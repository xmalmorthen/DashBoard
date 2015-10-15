using System;
using Gtk;
using outSolution;
using System.IO.Ports;
using System.IO;
using NLog;
using System.Collections.Generic;

public partial class MainWindow: Gtk.Window
{
	protected void OnDeleteEvent (object sender, DeleteEventArgs a)
	{
		a.RetVal = true;
		this.OnButton2Clicked (sender, null);
	}

	public MainWindow () : base (Gtk.WindowType.Toplevel)
	{
		Build ();

		/*
		//Codigo para testear el nlog [errores controlados]
		try {
			throw new Exception("Error controlado!!!");
		} catch (Exception ex) {
			Logger logger = LogManager.GetCurrentClassLogger();
			logger.Error(ex,ex.Message);
		}
		*/

		paned.Position = 338;

		this.tablePortInit ();
		tblPorts.CursorChanged += ontblPortsCursorChanged;

		this.tableBitacoraInit ();

		//seleccionar el primer elemento del treeview
		TreeIter iter;
		PortsModel.getModel().GetIterFirst (out iter);
		tblPorts.SetCursor (PortsModel.getModel ().GetPath (iter), tblPorts.GetColumn (0), false);
	}
		
	private void tablePortInit(){
		tblPorts.AppendColumn ("Puerto", new CellRendererText (), "text", 0);
		tblPorts.AppendColumn ("Estado", new CellRendererPixbuf (), "pixbuf", 1);
		tblPorts.AppendColumn ("Descripción", new CellRendererText (), "text", 2);
		tblPorts.Model = PortsModel.getModel ();
		this.populateTablePorts ();
		this.AutoConnectPorts ();
	}

	private void populateTablePorts(){
		PortsModel.clearModel ();

		string[] portList = SerialPort.GetPortNames ();
		if (portList.Length > 0) {
			foreach (string port in SerialPort.GetPortNames()) {
				CnnPort cnnPort;
				if (cnnPortList.TryGetValue (port, out cnnPort)) {
					PortsModel.addItem (port.ToString (), new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/on.png"), "Conectado");
				} else {
					PortsModel.addItem (port.ToString (), new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/off.png"), "Desconectado");	
				}
				cnnPort = null;
				BitacoraModel.addItem ("Detectar puerto", string.Format ("Puerto {0}", port.ToString ()));
			}
			GtkScrolledWindow.Visible = true;
		} else {
			lblPortsNotFound.Visible = true;
			GtkScrolledWindow.Visible = false;
			BitacoraModel.addItem ("Detectar puerto", "No se detectaron puertos","","AVISO");
		}
	}

	private void tableBitacoraInit(){
		tblBitacora.AppendColumn ("Acción", new CellRendererText (), "text", 0);
		tblBitacora.AppendColumn ("Mensaje", new CellRendererText (), "text", 1);
		tblBitacora.AppendColumn ("Hora", new CellRendererText (), "text", 2);
		tblBitacora.AppendColumn ("Fecha", new CellRendererText (), "text", 3);
		tblBitacora.AppendColumn ("Detalle", new CellRendererText (), "text", 4);
		tblBitacora.AppendColumn ("Estado", new CellRendererText (), "text", 5);
		tblBitacora.Model = BitacoraModel.getModel ();
	}

	TreeIter iterSelected;
	protected void ontblPortsCursorChanged(object sender, EventArgs e){
		TreeSelection selection = (sender as TreeView).Selection;

		TreeModel model;
		Boolean selected = false;
		Boolean conected = false;
		if (selection.GetSelected (out model, out iterSelected)) {			
			lblPuerto.LabelProp = "<span foreground=\"black\" size=\"xx-large\" weight=\"bold\">" + model.GetValue (iterSelected, 0) + "</span>";
			string status = model.GetValue (iterSelected, 2).ToString ().ToLower();
			if (status.Equals("desconectado", StringComparison.CurrentCultureIgnoreCase)) {
				imgPortStatus.Pixbuf = new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/off.png");
				btnconnect.Visible = true;
				btndisconnect.Visible = false;
				conected = false;
			} else if (status.Equals("conectado", StringComparison.CurrentCultureIgnoreCase)) {
				imgPortStatus.Pixbuf = new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/on.png");
				btndisconnect.Visible = true;
				btnconnect.Visible = false;
				conected = true;
			}
			selected = true;

			fraCnnConfig.Visible = btnconnect.Visible;

		}

		fraPortDetail.Visible = selected;
		fraSendData.Visible = conected;
		fraCnnConfig.Visible = selected && !conected;
	}

	private Dictionary<string,CnnPort> cnnPortList = new Dictionary<string,CnnPort>();
	protected void OnBtnconnectClicked (object sender, EventArgs e)
	{
		string port = lblPuerto.Text.ToString();
		int baudRate = Convert.ToInt32 (cmbBaudRate.ActiveText.ToString ());
		Parity parity = (Parity)Enum.Parse (typeof(Parity), cmbParity.ActiveText.ToString ());
		int databits = Convert.ToInt32 (cmbDatabits.ActiveText.ToString ());
		StopBits stopbits = (StopBits)Enum.Parse (typeof(StopBits), cmbStopbits.ActiveText.ToString ());

		string messageResponse;
		if (
			this.connectToPort (port,
				baudRate,
				parity,
				databits,
				stopbits,
				new SerialDataReceivedEventHandler (sport_DataReceived),
				new SerialErrorReceivedEventHandler (sport_ErrorReceived),
				out messageResponse)
		) {
			PortsModel.editItem (iterSelected, new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/on.png"), "Conectado");
			BitacoraModel.addItem ("Abrir puerto",string.Format ("Puerto {0}", port.ToString ()));
		} else {
			PortsModel.editItem (iterSelected, new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/err.png"), "Error al intentar conectar");
			BitacoraModel.addItem ("Abrir puerto",string.Format ("Puerto {0}", port.ToString ()),string.Format ("Error al intentar conectar [ {0} ]",messageResponse),"ERROR");
		}
		tblPorts.SetCursor (PortsModel.getModel ().GetPath (iterSelected), tblPorts.GetColumn (0), false);
	}

	private Boolean connectToPort(  string port,
									int baudRate,
									Parity parity,
									int databits,
									StopBits stopbits,
									SerialDataReceivedEventHandler sport_DataReceived,
									SerialErrorReceivedEventHandler sport_ErrorReceived,
									out string messageResponse){
		Boolean response = false;
		CnnPort cnnPort = new CnnPort ( port,
			baudRate,
			parity,
			databits,
			stopbits,
			new SerialDataReceivedEventHandler(sport_DataReceived),
			new SerialErrorReceivedEventHandler(sport_ErrorReceived));		
		if (cnnPort.Open (out messageResponse)) {
			cnnPortList.Add (port, cnnPort);
			response = true;
		}
		return response;
	}

	delegate void SerialDataReceivedDelegated(object sender, SerialDataReceivedEventArgs e);
	delegate void SerialErrorReceivedDelegated(object sender, SerialDataReceivedEventArgs e);

	void sport_DataReceived(object sender, SerialDataReceivedEventArgs e){
		SerialPort thisPort = (sender as SerialPort);

		byte[] buf = new byte[thisPort.BytesToRead];
		thisPort.Read(buf, 0, buf.Length);

		string strData = string.Empty;
		foreach (Byte b in buf)
		{
			BitacoraModel.addItem ("Leer puerto",string.Format ("Puerto {0}", thisPort.PortName),string.Format ("Dato recibido [ {0} ] ",b));

			strData += ((char) b).ToString();
		}
		BitacoraModel.addItem ("Cadena recibida",string.Format ("Puerto {0}", thisPort.PortName),string.Format ("Cadena [ {0} ] ",strData));


		/*
		 * CODIGO DE ENVÍO AUTOMATICO DE PULSACIONES A OTRO PUERTO DE MANERA AUTOMÁTICA
		 */
		this.senDataToPort ("COM1", //NOMBRE DEL PUERTO
							"p");	//DATO A ENVIAR 

	}

	void sport_ErrorReceived(object sender, SerialErrorReceivedEventArgs e){
		SerialPort thisPort = (sender as SerialPort);
		SerialError err = e.EventType;
		BitacoraModel.addItem ("Error de resepción de puerto",string.Format ("Puerto {0}", thisPort.PortName),string.Format ("{0}",err.ToString()),"ERROR");
	}
		
	protected void OnBtndisconnectClicked (object sender, EventArgs e)
	{
		CnnPort cnnPort;
		string port = lblPuerto.Text.ToString ();
		if (cnnPortList.TryGetValue (port, out cnnPort)) {
			if (cnnPort.Close (sport_DataReceived,
							   sport_ErrorReceived)) {
				PortsModel.editItem (iterSelected, new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/off.png"), "Desconectado");
				tblPorts.SetCursor (PortsModel.getModel ().GetPath (iterSelected), tblPorts.GetColumn (0), false);
				cnnPortList.Remove (port);
				BitacoraModel.addItem ("Cerrar puerto", string.Format ("Puerto {0}", port.ToString ()));
			} else {
				BitacoraModel.addItem ("Cerrar puerto", string.Format ("Puerto {0}", port.ToString ()),"Error al intentar cerrar puerto","ERROR");
			}
		}
	}	

	protected void OnBtnrefreshportsClicked (object sender, EventArgs e)
	{
		this.populateTablePorts ();
	}

	protected void OnButton2Clicked (object sender, EventArgs e)
	{
		if ( dlg.show(this, DialogFlags.DestroyWithParent, MessageType.Question, ButtonsType.YesNo, "Confirmar cerrar aplicación") == ResponseType.Yes)
			Application.Quit ();
	}

	protected void OnBtnsendmsgClicked (object sender, EventArgs e)
	{
		this.senDataToPort (lblPuerto.Text.ToString (), txtsendmsg.Text.ToString ());
	}

	protected void OnYesActionActivated (object sender, EventArgs e)
	{
		AutoConnectPorts win = new AutoConnectPorts ();
		win.Parent = this;
		win.Show ();
	}

	protected void OnCloseActionActivated (object sender, EventArgs e)
	{
		this.OnButton2Clicked (sender, e);
	}

	private void AutoConnectPorts(){
		ListStore autoConnectPortsList = AutoConnectPrtsModel.getModel ();
		TreeIter autocnnportiter;
		if (autoConnectPortsList.GetIterFirst (out autocnnportiter)) {
			do {
				string autocnnport = autoConnectPortsList.GetValue (autocnnportiter, 0).ToString();
				ListStore portsList = PortsModel.getModel ();
				TreeIter iter;
				Boolean portGetConnected = false;
				if (portsList.GetIterFirst (out iter)) {
					do {
						string port = portsList.GetValue (iter, 0).ToString();
						if (port.Trim().Equals(autocnnport.Trim(), StringComparison.CurrentCultureIgnoreCase)){

							string sport = lblPuerto.Text.ToString();
							int baudRate = Convert.ToInt32 (cmbBaudRate.ActiveText.ToString ());
							Parity parity = (Parity)Enum.Parse (typeof(Parity), cmbParity.ActiveText.ToString ());
							int databits = Convert.ToInt32 (cmbDatabits.ActiveText.ToString ());
							StopBits stopbits = (StopBits)Enum.Parse (typeof(StopBits), cmbStopbits.ActiveText.ToString ());

							CnnPort cnnPort;
							if (!cnnPortList.TryGetValue (port, out cnnPort)) {
								string messageResponse;
								if (
									this.connectToPort (port,
										baudRate,
										parity,
										databits,
										stopbits,
										new SerialDataReceivedEventHandler (sport_DataReceived),
										new SerialErrorReceivedEventHandler (sport_ErrorReceived),
										out messageResponse)
								) {
									PortsModel.editItem (iter, new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/on.png"), "Conectado");
									BitacoraModel.addItem ("Auto abrir puerto",string.Format ("Puerto {0}", port.ToString ()));
								} else {
									PortsModel.editItem (iter, new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/err.png"), "Error al intentar conectar");
									BitacoraModel.addItem ("Auto abrir puerto",string.Format ("Puerto {0}", port.ToString ()),string.Format ("Error al intentar conectar [ {0} ]",messageResponse),"ERROR");
								}	
							}
							cnnPort = null;
							portGetConnected = true;
						}
					} while (portsList.IterNext(ref iter));
				}

				if (!portGetConnected){
					BitacoraModel.addItem ("Auto abrir puerto",string.Format ("Puerto {0}", autocnnport),string.Format ("No se encontró el puerto disponible"),"ERROR");
				}

			} while(autoConnectPortsList.IterNext(ref autocnnportiter));
		}

	}

	protected void OnRefreshActionActivated (object sender, EventArgs e)
	{
		this.AutoConnectPorts ();
	}

	protected void OnBtnlimpiarbitacoraClicked (object sender, EventArgs e)
	{
		if (dlg.show(this, DialogFlags.DestroyWithParent, MessageType.Question, ButtonsType.YesNo, "Confirmar limpiar la bitácora de salida") == ResponseType.Yes)
			BitacoraModel.clearModel ();	
	}

	protected void OnBtnBitacoraHistoricaClicked (object sender, EventArgs e)
	{
		throw new NotImplementedException ();
	}

	private Boolean senDataToPort (string portName, string data){
		Boolean response = false;
		CnnPort cnnPort;
		string port = portName;
		if (cnnPortList.TryGetValue (port, out cnnPort)) {
			if (!cnnPort.SendData (data)) {
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al enviar el dato al puerto {0} [ {1} ]", port, data));
				BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()), string.Format ("Ocurrió un error al enviar el dato [ {0} ] al puerto", data), "ERROR");
			} else {
				BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()), string.Format ("Dato enviado al puerto [ {0} ]", data));
				response = true;
			}
		} else {
			BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()), string.Format ("El puerto [ {0} ] no se encuentra abierto o la comunicación ha sido interrumpida. Dato [ {0} ] no enviado", port,data), "ERROR");
		}
		return response;
	}

}
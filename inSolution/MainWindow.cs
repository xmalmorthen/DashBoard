using System;
using Gtk;
using inSolution;
using System.IO.Ports;
using System.IO;
using NLog;
using System.Collections.Generic;

public partial class MainWindow: Gtk.Window
{

	protected void OnDeleteEvent (object sender, DeleteEventArgs a)
	{
		Application.Quit ();
		a.RetVal = true;
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
		}

		fraPortDetail.Visible = selected;
		fraSendData.Visible = conected;
	}

	private Dictionary<string,CnnPort> cnnPortList = new Dictionary<string,CnnPort>();
	protected void OnBtnconnectClicked (object sender, EventArgs e)
	{
		string port = lblPuerto.Text.ToString();
		int baudRate = Convert.ToInt32 (cmbBaudRate.ActiveText.ToString ());
		Parity parity = (Parity)Enum.Parse (typeof(Parity), cmbParity.ActiveText.ToString ());
		int databits = Convert.ToInt32 (cmbDatabits.ActiveText.ToString ());
		StopBits stopbits = (StopBits)Enum.Parse (typeof(StopBits), cmbStopbits.ActiveText.ToString ());

		CnnPort cnnPort = new CnnPort ( port,
										baudRate,
										parity,
										databits,
										stopbits,
										new SerialDataReceivedEventHandler(sport_DataReceived),
										new SerialErrorReceivedEventHandler(sport_ErrorReceived));
		string messageResponse;
		if (cnnPort.Open (out messageResponse)) {
			PortsModel.editItem (iterSelected, new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/on.png"), "Conectado");
			cnnPortList.Add (port, cnnPort);
			BitacoraModel.addItem ("Abrir puerto",string.Format ("Puerto {0}", port.ToString ()));
		} else {
			PortsModel.editItem (iterSelected, new Gdk.Pixbuf (Directory.GetCurrentDirectory () + @"/Assets/Images/err.png"), "Error al intentar conectar");
			BitacoraModel.addItem ("Abrir puerto",string.Format ("Puerto {0}", port.ToString ()),string.Format ("Error al intentar conectar [ {0} ]",messageResponse),"ERROR");
		}
		tblPorts.SetCursor (PortsModel.getModel ().GetPath (iterSelected), tblPorts.GetColumn (0), false);
	}

	delegate void SerialDataReceivedDelegated(object sender, SerialDataReceivedEventArgs e);
	delegate void SerialErrorReceivedDelegated(object sender, SerialDataReceivedEventArgs e);

	void sport_DataReceived(object sender, SerialDataReceivedEventArgs e){
		SerialPort thisPort = (sender as SerialPort);

		byte[] buf = new byte[thisPort.BytesToRead];
		thisPort.Read(buf, 0, buf.Length);
		foreach (Byte b in buf)
		{
			BitacoraModel.addItem ("Leer puerto",string.Format ("Puerto {0}", thisPort.PortName),string.Format ("Dato recibido [ {0} ] ",b));
		}
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
			if (cnnPort.Close ()) {
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
		MessageDialog dlg = new MessageDialog (this, 
			                    DialogFlags.DestroyWithParent, 
			                    MessageType.Question, 
								ButtonsType.YesNo, 
			                    "Confirmar cerrar aplicación");
		ResponseType response = (ResponseType) dlg.Run ();
		dlg.Destroy ();
		if (response == ResponseType.Yes)
			Application.Quit ();
	}

	protected void OnBtnsendmsgClicked (object sender, EventArgs e)
	{
		CnnPort cnnPort;
		string port = lblPuerto.Text.ToString ();
		if (cnnPortList.TryGetValue (port, out cnnPort)) {
			String data = txtsendmsg.Text.ToString ();
			if (!cnnPort.SendData (data)) {
				MessageDialog dlg = new MessageDialog (this, 
					                    DialogFlags.DestroyWithParent, 
					                    MessageType.Error, 
					                    ButtonsType.Ok, 
										string.Format ("Ocurrió un error al enviar el dato al puerto {0} [ {1} ]", port, data));
				dlg.Run ();
				dlg.Destroy ();
				BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()),string.Format ("Ocurrió un error al enviar el dato [ {0} ] al puerto", data),"ERROR");
			} else {
				BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()),string.Format ("Dato enviado al puerto [ {0} ]", data));
			}

		}
	}

	protected void OnYesActionActivated (object sender, EventArgs e)
	{
		AutoConectPorts win = new AutoConectPorts ();
		win.Parent = this;
		win.ShowAll ();
		ResponseType response = (ResponseType) win.Run ();
		win.Destroy ();
	}

	protected void OnCloseActionActivated (object sender, EventArgs e)
	{
		this.OnButton2Clicked (sender, e);
	}

}
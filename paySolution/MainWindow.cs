using System;
using Gtk;
using System.Windows.Forms;
using paySolution;
using NLog;
using System.IO.Ports;
using MySql.Data.MySqlClient;
using System.Threading;
using System.Collections.Generic;

public partial class MainWindow: Gtk.Window
{
	private void setNotification(paySolution.payLogic.payStatus notificationType){
		Thread thrpayProcessTerminated = new Thread (new ThreadStart (delegate {
			Gtk.Application.Invoke( delegate {

				string notification = string.Empty;
				string[] color = new string[] { 
					"#fff",
					"#ff0000" 
				};

				switch (notificationType) {
				case paySolution.payLogic.payStatus.insertTicket:					
					notification = markup.make (Culturize.GetString (18), color[0], null, "60000", "heavy");
					break;
				case paySolution.payLogic.payStatus.readingTicket:
					
					break;
				case paySolution.payLogic.payStatus.errorReadingTicket:
					notification = markup.make (Culturize.GetString (22), color[1], null, "60000", "heavy");
					break;
				case paySolution.payLogic.payStatus.errorGeneral:
					notification = string.Format ("{0}\n{1}",
						markup.make (Culturize.GetString (23), color[1], null, "60000", "heavy"),
						markup.make (Culturize.GetString (24), color[1], null, "40000", "heavy"));
					break;
				}

				lblNotification.LabelProp = notification;
			});
		}));
		thrpayProcessTerminated.Start ();
	}

	private paySolution.payLogic.payStatus notificationState;
	public paySolution.payLogic.payStatus SetNotification{
		set {
			notificationState = value;
			setNotification (value);
		}
	}
		
	private void configureBackgroundForm(){
		mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (cnfg.GetFormBackgroundImage));
	}

	private void configureImagesControls(){
		imgMain.PixbufAnimation = new Gdk.PixbufAnimation (cnfg.GetPrincipalGifAnimated);
	}

	public MainWindow () : base (Gtk.WindowType.Toplevel)
	{	
		Build ();
		this.configureBackgroundForm ();
		this.configureImagesControls ();

		#if !DEBUG
			this.Maximize ();
		#endif
			
		imgLogo.Pixbuf = new Gdk.Pixbuf (cnfg.GetLogoImage);	
	} 

	protected void OnDeleteEvent (object sender, DeleteEventArgs a)
	{
		Gtk.Application.Quit ();
		a.RetVal = true;
	}

	public Boolean AutoConnectPorts(out string autoConnectPortsMessageResponse){
		Boolean result = false;
		ListStore autoConnectPortsList = AutoConnectPrtsModel.getModel ();
		TreeIter autocnnportiter;
		autoConnectPortsMessageResponse = string.Empty;
		if (autoConnectPortsList.GetIterFirst (out autocnnportiter)) {
			do {
				string port = autoConnectPortsList.GetValue (autocnnportiter, 0).ToString();
				int baudRate = Convert.ToInt32 (autoConnectPortsList.GetValue (autocnnportiter, 3).ToString());
				Parity parity = (Parity)Enum.Parse (typeof(Parity), autoConnectPortsList.GetValue (autocnnportiter, 4).ToString());
				int databits = Convert.ToInt32 (autoConnectPortsList.GetValue (autocnnportiter, 5).ToString());
				StopBits stopbits = (StopBits)Enum.Parse (typeof(StopBits), autoConnectPortsList.GetValue (autocnnportiter, 6).ToString());
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
					BitacoraModel.addItem ("Auto abrir puerto",string.Format ("Puerto {0}", port.ToString ()));
				} else {
					BitacoraModel.addItem ("Auto abrir puerto",string.Format ("Puerto {0}", port.ToString ()),string.Format ("Error al intentar conectar [ {0} ]",messageResponse),"ERROR");
					autoConnectPortsMessageResponse += string.Format("{0}",messageResponse);
				}	
			} while(autoConnectPortsList.IterNext(ref autocnnportiter));

			if (string.IsNullOrEmpty (autoConnectPortsMessageResponse))
				result = true;

		} else {
			autoConnectPortsMessageResponse = string.Format("No se encontraron puertos para auto conectar [ {0} ]",cnfg.Id_application);
		}
		return result;
	}

	public Dictionary<string,CnnPort> cnnPortList = new Dictionary<string,CnnPort>();
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

		string dataReceived = System.Text.Encoding.UTF8.GetString (buf);
		BitacoraModel.addItem ("Cadena recibida",string.Format ("Puerto {0}", thisPort.PortName),string.Format ("Cadena [ {0} ] ",dataReceived));
		payLogic.LogicFlow (thisPort.PortName,dataReceived);
	}

	void sport_ErrorReceived(object sender, SerialErrorReceivedEventArgs e){
		SerialPort thisPort = (sender as SerialPort);
		SerialError err = e.EventType;
		BitacoraModel.addItem ("Error de resepción de puerto",string.Format ("Puerto {0}", thisPort.PortName),string.Format ("{0}",err.ToString()),"ERROR");
	}

	/* TODO: Inicio
	 * Implementación de simulación
	 * Eliminar al terminar
	 */ 
	protected void OnButton1Clicked (object sender, EventArgs e)
	{
		string dataReceived = "q";
		payLogic.LogicFlow ("COM1", dataReceived);
	}

	protected void OnButton2Clicked (object sender, EventArgs e)
	{
		string dataReceived = "w";
		payLogic.LogicFlow ("COM1", dataReceived);
	}

	/* Fin
	 * Implementación de simulación
	 */ 
}

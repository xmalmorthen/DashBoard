using System;
using Gtk;
using System.Windows.Forms;
using paySolution;
using NLog;
using System.IO.Ports;
using MySql.Data.MySqlClient;
using System.Threading;

public partial class MainWindow: Gtk.Window
{
	public enum mainWindowNotification
	{
		insertTicket,
		readingTicket,
		errReadingTicket,
		calculatingAmount
	}

	string[] colors = new string[] {"white",
									"black", 
									"#fffc00", 	//amarillo
									"#ff0000",	//rojo
									"#6f0000"	//marron
	};

	private void setNotification(mainWindowNotification notificationType){
		Thread thrpayProcessTerminated = new Thread (new ThreadStart (delegate {
			Gtk.Application.Invoke( delegate {

				string notification = string.Empty;
				string color = colors [0];

				switch (notificationType) {
				case mainWindowNotification.insertTicket:					
					notification = markup.make (Culturize.GetString (18), color, null, "60000", "heavy");
					break;
				case mainWindowNotification.readingTicket:
					notification = string.Format ("{0}\n{1}",
						markup.make (Culturize.GetString (19), color, null, "60000", "heavy"),
						markup.make (Culturize.GetString (9), colors[2], null, "40000", "heavy"));
					break;
				case mainWindowNotification.errReadingTicket:
					notification = markup.make (Culturize.GetString (18), color, null, "60000", "heavy");
					break;
				case mainWindowNotification.calculatingAmount:
					notification = string.Format ("{0}\n{1}",
						markup.make (Culturize.GetString (20), color, null, "60000", "heavy"),
						markup.make (Culturize.GetString (21), colors[0], null, "40000", "heavy"));
					break;
				}

				lblNotification.LabelProp = notification;
			});
		}));
		thrpayProcessTerminated.Start ();
	}

	private mainWindowNotification notificationState;
	public mainWindowNotification SetNotification{
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

		this.Maximize ();

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

	private void configurePayLogic(decimal toPay){
		payLogic.ToPay = toPay;
		payLogic.Payable = payLogic.ToPay;
		payLogic.ToReturn = 0.00m;
		payLogic.Status = payLogic.payStatus.waithToMoney;
	}

}

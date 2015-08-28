using System;
using Gtk;
using paySolution;
using System.Timers;
using NLog;
using System.IO.Ports;

public partial class MainWindow: Gtk.Window
{
	Timer blink = new Timer (int.Parse(MainClass.cnfg.AppSettings ["blink_timer"]));
	public MainWindow () : base (Gtk.WindowType.Toplevel)
	{
		this.Shown  += new EventHandler (this.OnShown); 
		Build ();
	}

	protected virtual void OnShown (object sender, System.EventArgs e) 
	{ 
		this.Maximize ();
		mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (MainClass.imagesPath + "backGround2.jpg"));
		image1.PixbufAnimation = new Gdk.PixbufAnimation(MainClass.imagesPath + "ticket.png");

		this.blink.Elapsed+=new ElapsedEventHandler(blinkOnTimedEvent);
		this.blink.Enabled=true;

		this.timer.Elapsed+=new ElapsedEventHandler(OnTimedEvent);
		this.timer.Enabled=true;
	} 

	protected void OnDeleteEvent (object sender, DeleteEventArgs a)
	{
		Application.Quit ();
		a.RetVal = true;
	}

	string lblcontent = string.Empty;
	private void blinkOnTimedEvent(object source, ElapsedEventArgs e)
	{
		if (lblcontent.Length > 0) {
			lblNotifications.LabelProp = lblcontent;
			lblcontent = string.Empty;
		} else {
			lblcontent = lblNotifications.LabelProp;
			lblNotifications.LabelProp = string.Empty;
		}
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
			autoConnectPortsMessageResponse = string.Format("No se encontraron puertos para auto conectar [ {0} ]",MainClass.Id_application);
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


	/*
	 * CODIGO DE SIMULACIÓN [ BORRAR HASTA LA MARCA DE FIN ]
	 */ 
	Timer timer = new Timer(2000);
	private Boolean showPayForm = false;
	private void OnTimedEvent(object source, ElapsedEventArgs e)
	{		
		lblNotifications.LabelProp = "<span foreground=\"red\" size=\"70000\" font_weight=\"heavy\">Leyendo Ticket</span>\n<span foreground=\"white\" size=\"30000\" font_weight=\"heavy\">favor de esperar</span>";
		if (!this.showPayForm) {
			this.showPayForm = true;
		} else {
			this.timer.Enabled = false;	
			MainClass.FrmPayPanel.Show ();
		}
	}
	/*
	 * FIN DE CODIGO DE SIMULACIÓN [ BORRAR HASTA AQUI ]
	 */ 


}

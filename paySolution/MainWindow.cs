﻿using System;
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


	System.Windows.Forms.Timer blink;
	private Boolean iterBlink = false;
	void blink_Tick(object sender, EventArgs e){		
		iterBlink = !iterBlink;
		setNotification(notificationState);
	}

	string[] colors = new string[] {"black", 
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
					color = iterBlink ? colors [0] : colors [1];
					notification = markup.make (Culturize.GetString (18), color, null, "60000", "heavy");
					break;
				case mainWindowNotification.readingTicket:
					color = iterBlink ? colors [2] : colors [3];
					notification = string.Format ("{0}\n{1}",
						markup.make (Culturize.GetString (19), color, null, "60000", "heavy"),
						markup.make (Culturize.GetString (9), colors[2], null, "40000", "heavy"));
					break;
				case mainWindowNotification.errReadingTicket:
					color = iterBlink ? colors [0] : colors [1];
					notification = markup.make (Culturize.GetString (18), color, null, "60000", "heavy");
					break;
				case mainWindowNotification.calculatingAmount:
					color = iterBlink ? colors [0] : colors [1];
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

	public void configureIdiomsButtons(){
		int i = 0;

		MySqlDataReader idioms = Culturize.getCaIdioms ();
		if (idioms != null){

			VBox vbox = null;
			Boolean par = false;
			while (idioms.Read ()) {
				i++;

				if (!par) {
					vbox = new VBox ();
					vbox.Spacing = 6;
					vbox.Homogeneous = false;
					vbox.Visible = true;
				}

				Gtk.Button btn = new Gtk.Button();
				btn.Name = string.Format ("{0}", idioms ["siglas"].ToString ());
				btn.CanFocus = false;
				btn.UseUnderline = true;
				btn.Visible = true;
				btn.Image = new Gtk.Image (string.Format ("{0}", cnfg.GetBaseImage(idioms["image_fileName"].ToString())));
				btn.Clicked	+= (object sender, EventArgs e) => {
					string idiom = ( (Gtk.Button) sender).Name;
					Culturize.changeLenguaje (idiom);
				};

				vbox.Add (btn);

				Gtk.Box.BoxChild boxchild = ((Gtk.Box.BoxChild)(vbox [btn]));
				boxchild.Position = !par ? 0 : 1;
				boxchild.Expand = false;
				boxchild.Fill = false;
				boxchild.PackType = PackType.Start;

				if (par) {
					
					hbox1.Add (vbox);
					Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(hbox1 [vbox]));
					w1.Expand = false;
					w1.Fill = false;
				}
				par = !par;
			}

			if (i % 2 != 0) {
				Gtk.Alignment alignment = new Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
				vbox.Add (alignment);
				Box.BoxChild boxchild = ((global::Gtk.Box.BoxChild)(vbox [alignment]));
				boxchild.Position = 1;

				hbox1.Add (vbox);
				Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(hbox1 [vbox]));
				w1.Expand = false;
				w1.Fill = false;
			}

			if (!idioms.IsClosed)
				idioms.Close ();
		}
	}
		
	public MainWindow () : base (Gtk.WindowType.Toplevel)
	{	
		Build ();
		this.configureBackgroundForm ();
		this.configureImagesControls ();

		this.Maximize ();

		blink = new System.Windows.Forms.Timer ();
		blink.Tick += new EventHandler (blink_Tick);
		blink.Interval = int.Parse(cnfg.getConfiguration("blinkLabelTime"));
		blink.Enabled = true;
		blink.Start ();

		this.configureIdiomsButtons ();

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

	int clicks = 0;
	protected void OnButton1Clicked (object sender, EventArgs e)
	{
		clicks++;

	}

	private void configurePayLogic(decimal toPay){
		payLogic.ToPay = toPay;
		payLogic.Payable = payLogic.ToPay;
		payLogic.ToReturn = 0.00m;
		payLogic.Status = payLogic.payStatus.waithToMoney;
	}


	private System.Windows.Forms.Timer tmPaySimulation;
	public void configureTimerPaySimulation(){
		tmPaySimulation = new System.Windows.Forms.Timer ();
		tmPaySimulation.Tick += new EventHandler (tmPaySimulation_Tick);
		tmPaySimulation.Interval = 5000;
		tmPaySimulation.Enabled = true;
		tmPaySimulation.Start ();
	}

	public int SimulationIter = 1;
	void tmPaySimulation_Tick(object sender, EventArgs e){	
		Random random = new Random();
		int randomNumber = 0;
		switch (SimulationIter) {
		case 1:
			payLogic.Status = payLogic.payStatus.readingTicket;
			break;
		case 2:
			payLogic.Status = payLogic.payStatus.calculatingAmount;
			break;
		case 3:			
			randomNumber = random.Next(1,Convert.ToInt32 (cnfg.getConfiguration ("toPay").ToString ()));
			configurePayLogic (randomNumber);
			break;
		case 4:			
			randomNumber = random.Next(1,Convert.ToInt32(cnfg.getConfiguration ("moneyInserted").ToString ()));
			payLogic.PayDeposit = randomNumber;
			if (payLogic.Payable > 0) SimulationIter--;
			break;
		}
		SimulationIter++;
	}

}

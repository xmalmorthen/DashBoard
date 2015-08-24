
// This file has been generated by the GUI designer. Do not modify.

public partial class MainWindow
{
	private global::Gtk.UIManager UIManager;
	
	private global::Gtk.Action executeAction;
	
	private global::Gtk.Action disconnectAction;
	
	private global::Gtk.Action closeAction;
	
	private global::Gtk.VBox vbox4;
	
	private global::Gtk.MenuBar menubar1;
	
	private global::Gtk.HPaned paned;
	
	private global::Gtk.VBox vbox5;
	
	private global::Gtk.Frame fraPortsGrid;
	
	private global::Gtk.Alignment GtkAlignment6;
	
	private global::Gtk.HBox hbox2;
	
	private global::Gtk.VBox vbox3;
	
	private global::Gtk.ScrolledWindow GtkScrolledWindow;
	
	private global::Gtk.TreeView tblPorts;
	
	private global::Gtk.Label lblPortsNotFound;
	
	private global::Gtk.VBox vbox2;
	
	private global::Gtk.Button btnrefreshports;
	
	private global::Gtk.Alignment alignment1;
	
	private global::Gtk.Label GtkLabel9;
	
	private global::Gtk.Frame fraPortDetail;
	
	private global::Gtk.Alignment GtkAlignment7;
	
	private global::Gtk.HBox hbox8;
	
	private global::Gtk.Label label3;
	
	private global::Gtk.Label lblPuerto;
	
	private global::Gtk.Image imgPortStatus;
	
	private global::Gtk.Button btndisconnect;
	
	private global::Gtk.Button btnconnect;
	
	private global::Gtk.Label GtkLabel10;
	
	private global::Gtk.Frame fraCnnConfig;
	
	private global::Gtk.Alignment GtkAlignment8;
	
	private global::Gtk.VBox vbox6;
	
	private global::Gtk.HBox hbox9;
	
	private global::Gtk.Label label5;
	
	private global::Gtk.ComboBoxEntry cmbBaudRate;
	
	private global::Gtk.HBox hbox10;
	
	private global::Gtk.Label label6;
	
	private global::Gtk.ComboBoxEntry cmbParity;
	
	private global::Gtk.HBox hbox11;
	
	private global::Gtk.Label label7;
	
	private global::Gtk.ComboBoxEntry cmbDatabits;
	
	private global::Gtk.HBox hbox12;
	
	private global::Gtk.Label label8;
	
	private global::Gtk.ComboBoxEntry cmbStopbits;
	
	private global::Gtk.Label GtkLabel11;
	
	private global::Gtk.Frame fraSendData;
	
	private global::Gtk.Alignment GtkAlignment5;
	
	private global::Gtk.HBox hbox3;
	
	private global::Gtk.Label lblsendmsg;
	
	private global::Gtk.Entry txtsendmsg;
	
	private global::Gtk.Button btnsendmsg;
	
	private global::Gtk.Label GtkLabel7;
	
	private global::Gtk.ScrolledWindow GtkScrolledWindow1;
	
	private global::Gtk.TreeView tblBitacora;
	
	private global::Gtk.Statusbar statusbar;
	
	private global::Gtk.Button button2;

	protected virtual void Build ()
	{
		global::Stetic.Gui.Initialize (this);
		// Widget MainWindow
		this.UIManager = new global::Gtk.UIManager ();
		global::Gtk.ActionGroup w1 = new global::Gtk.ActionGroup ("Default");
		this.executeAction = new global::Gtk.Action ("executeAction", global::Mono.Unix.Catalog.GetString ("Configuraciones"), null, "gtk-execute");
		this.executeAction.ShortLabel = global::Mono.Unix.Catalog.GetString ("Configuraciones");
		w1.Add (this.executeAction, null);
		this.disconnectAction = new global::Gtk.Action ("disconnectAction", global::Mono.Unix.Catalog.GetString ("Autoconectar"), null, "gtk-disconnect");
		this.disconnectAction.ShortLabel = global::Mono.Unix.Catalog.GetString ("Autoconectar");
		w1.Add (this.disconnectAction, "<Primary>a");
		this.closeAction = new global::Gtk.Action ("closeAction", global::Mono.Unix.Catalog.GetString ("Cerrar"), null, "gtk-close");
		this.closeAction.ShortLabel = global::Mono.Unix.Catalog.GetString ("Cerrar");
		w1.Add (this.closeAction, "<Primary>x");
		this.UIManager.InsertActionGroup (w1, 0);
		this.AddAccelGroup (this.UIManager.AccelGroup);
		this.Name = "MainWindow";
		this.Title = global::Mono.Unix.Catalog.GetString ("Conector de puertos");
		this.Icon = global::Stetic.IconLoader.LoadIcon (this, "gtk-connect", global::Gtk.IconSize.SmallToolbar);
		this.WindowPosition = ((global::Gtk.WindowPosition)(1));
		this.BorderWidth = ((uint)(6));
		// Container child MainWindow.Gtk.Container+ContainerChild
		this.vbox4 = new global::Gtk.VBox ();
		this.vbox4.Name = "vbox4";
		this.vbox4.Spacing = 6;
		// Container child vbox4.Gtk.Box+BoxChild
		this.UIManager.AddUiFromString ("<ui><menubar name=\'menubar1\'><menu name=\'executeAction\' action=\'executeAction\'><m" +
		"enuitem name=\'disconnectAction\' action=\'disconnectAction\'/></menu><menuitem name" +
		"=\'closeAction\' action=\'closeAction\'/></menubar></ui>");
		this.menubar1 = ((global::Gtk.MenuBar)(this.UIManager.GetWidget ("/menubar1")));
		this.menubar1.Name = "menubar1";
		this.vbox4.Add (this.menubar1);
		global::Gtk.Box.BoxChild w2 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.menubar1]));
		w2.Position = 0;
		w2.Expand = false;
		w2.Fill = false;
		// Container child vbox4.Gtk.Box+BoxChild
		this.paned = new global::Gtk.HPaned ();
		this.paned.CanFocus = true;
		this.paned.Name = "paned";
		this.paned.Position = 1;
		this.paned.BorderWidth = ((uint)(1));
		// Container child paned.Gtk.Paned+PanedChild
		this.vbox5 = new global::Gtk.VBox ();
		this.vbox5.WidthRequest = 38;
		this.vbox5.Name = "vbox5";
		this.vbox5.Spacing = 6;
		// Container child vbox5.Gtk.Box+BoxChild
		this.fraPortsGrid = new global::Gtk.Frame ();
		this.fraPortsGrid.Name = "fraPortsGrid";
		this.fraPortsGrid.ShadowType = ((global::Gtk.ShadowType)(0));
		// Container child fraPortsGrid.Gtk.Container+ContainerChild
		this.GtkAlignment6 = new global::Gtk.Alignment (0F, 0F, 1F, 1F);
		this.GtkAlignment6.Name = "GtkAlignment6";
		this.GtkAlignment6.LeftPadding = ((uint)(12));
		// Container child GtkAlignment6.Gtk.Container+ContainerChild
		this.hbox2 = new global::Gtk.HBox ();
		this.hbox2.Name = "hbox2";
		this.hbox2.Spacing = 6;
		// Container child hbox2.Gtk.Box+BoxChild
		this.vbox3 = new global::Gtk.VBox ();
		this.vbox3.Name = "vbox3";
		this.vbox3.Spacing = 6;
		// Container child vbox3.Gtk.Box+BoxChild
		this.GtkScrolledWindow = new global::Gtk.ScrolledWindow ();
		this.GtkScrolledWindow.HeightRequest = 167;
		this.GtkScrolledWindow.Name = "GtkScrolledWindow";
		this.GtkScrolledWindow.ShadowType = ((global::Gtk.ShadowType)(1));
		// Container child GtkScrolledWindow.Gtk.Container+ContainerChild
		this.tblPorts = new global::Gtk.TreeView ();
		this.tblPorts.CanFocus = true;
		this.tblPorts.Name = "tblPorts";
		this.GtkScrolledWindow.Add (this.tblPorts);
		this.vbox3.Add (this.GtkScrolledWindow);
		global::Gtk.Box.BoxChild w4 = ((global::Gtk.Box.BoxChild)(this.vbox3 [this.GtkScrolledWindow]));
		w4.Position = 0;
		// Container child vbox3.Gtk.Box+BoxChild
		this.lblPortsNotFound = new global::Gtk.Label ();
		this.lblPortsNotFound.Name = "lblPortsNotFound";
		this.lblPortsNotFound.LabelProp = global::Mono.Unix.Catalog.GetString ("<span foreground=\"red\" size=\"xx-large\" weight=\"heavy\">No se encontraron PUERTOS</" +
		"span>");
		this.lblPortsNotFound.UseMarkup = true;
		this.lblPortsNotFound.Wrap = true;
		this.vbox3.Add (this.lblPortsNotFound);
		global::Gtk.Box.BoxChild w5 = ((global::Gtk.Box.BoxChild)(this.vbox3 [this.lblPortsNotFound]));
		w5.Position = 1;
		w5.Expand = false;
		this.hbox2.Add (this.vbox3);
		global::Gtk.Box.BoxChild w6 = ((global::Gtk.Box.BoxChild)(this.hbox2 [this.vbox3]));
		w6.Position = 0;
		// Container child hbox2.Gtk.Box+BoxChild
		this.vbox2 = new global::Gtk.VBox ();
		this.vbox2.Name = "vbox2";
		this.vbox2.Spacing = 6;
		// Container child vbox2.Gtk.Box+BoxChild
		this.btnrefreshports = new global::Gtk.Button ();
		this.btnrefreshports.CanFocus = true;
		this.btnrefreshports.Name = "btnrefreshports";
		this.btnrefreshports.UseUnderline = true;
		global::Gtk.Image w7 = new global::Gtk.Image ();
		w7.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-refresh", global::Gtk.IconSize.Button);
		this.btnrefreshports.Image = w7;
		this.vbox2.Add (this.btnrefreshports);
		global::Gtk.Box.BoxChild w8 = ((global::Gtk.Box.BoxChild)(this.vbox2 [this.btnrefreshports]));
		w8.Position = 0;
		w8.Expand = false;
		w8.Fill = false;
		// Container child vbox2.Gtk.Box+BoxChild
		this.alignment1 = new global::Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
		this.alignment1.Name = "alignment1";
		this.vbox2.Add (this.alignment1);
		global::Gtk.Box.BoxChild w9 = ((global::Gtk.Box.BoxChild)(this.vbox2 [this.alignment1]));
		w9.Position = 1;
		this.hbox2.Add (this.vbox2);
		global::Gtk.Box.BoxChild w10 = ((global::Gtk.Box.BoxChild)(this.hbox2 [this.vbox2]));
		w10.Position = 1;
		w10.Expand = false;
		w10.Fill = false;
		this.GtkAlignment6.Add (this.hbox2);
		this.fraPortsGrid.Add (this.GtkAlignment6);
		this.GtkLabel9 = new global::Gtk.Label ();
		this.GtkLabel9.Name = "GtkLabel9";
		this.GtkLabel9.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Lista de puertos encontrados</b>");
		this.GtkLabel9.UseMarkup = true;
		this.fraPortsGrid.LabelWidget = this.GtkLabel9;
		this.vbox5.Add (this.fraPortsGrid);
		global::Gtk.Box.BoxChild w13 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.fraPortsGrid]));
		w13.Position = 0;
		// Container child vbox5.Gtk.Box+BoxChild
		this.fraPortDetail = new global::Gtk.Frame ();
		this.fraPortDetail.Name = "fraPortDetail";
		this.fraPortDetail.ShadowType = ((global::Gtk.ShadowType)(0));
		// Container child fraPortDetail.Gtk.Container+ContainerChild
		this.GtkAlignment7 = new global::Gtk.Alignment (0F, 0F, 1F, 1F);
		this.GtkAlignment7.Name = "GtkAlignment7";
		this.GtkAlignment7.LeftPadding = ((uint)(12));
		// Container child GtkAlignment7.Gtk.Container+ContainerChild
		this.hbox8 = new global::Gtk.HBox ();
		this.hbox8.Name = "hbox8";
		this.hbox8.Spacing = 10;
		// Container child hbox8.Gtk.Box+BoxChild
		this.label3 = new global::Gtk.Label ();
		this.label3.Name = "label3";
		this.label3.LabelProp = global::Mono.Unix.Catalog.GetString ("<span foreground=\"black\" size=\"large\">Puerto</span>");
		this.label3.UseMarkup = true;
		this.hbox8.Add (this.label3);
		global::Gtk.Box.BoxChild w14 = ((global::Gtk.Box.BoxChild)(this.hbox8 [this.label3]));
		w14.Position = 0;
		w14.Expand = false;
		w14.Fill = false;
		// Container child hbox8.Gtk.Box+BoxChild
		this.lblPuerto = new global::Gtk.Label ();
		this.lblPuerto.Name = "lblPuerto";
		this.lblPuerto.UseMarkup = true;
		this.hbox8.Add (this.lblPuerto);
		global::Gtk.Box.BoxChild w15 = ((global::Gtk.Box.BoxChild)(this.hbox8 [this.lblPuerto]));
		w15.Position = 1;
		w15.Expand = false;
		w15.Fill = false;
		// Container child hbox8.Gtk.Box+BoxChild
		this.imgPortStatus = new global::Gtk.Image ();
		this.imgPortStatus.Name = "imgPortStatus";
		this.hbox8.Add (this.imgPortStatus);
		global::Gtk.Box.BoxChild w16 = ((global::Gtk.Box.BoxChild)(this.hbox8 [this.imgPortStatus]));
		w16.Position = 2;
		w16.Expand = false;
		w16.Fill = false;
		// Container child hbox8.Gtk.Box+BoxChild
		this.btndisconnect = new global::Gtk.Button ();
		this.btndisconnect.CanFocus = true;
		this.btndisconnect.Name = "btndisconnect";
		this.btndisconnect.UseUnderline = true;
		global::Gtk.Image w17 = new global::Gtk.Image ();
		w17.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-connect", global::Gtk.IconSize.Button);
		this.btndisconnect.Image = w17;
		this.hbox8.Add (this.btndisconnect);
		global::Gtk.Box.BoxChild w18 = ((global::Gtk.Box.BoxChild)(this.hbox8 [this.btndisconnect]));
		w18.PackType = ((global::Gtk.PackType)(1));
		w18.Position = 3;
		w18.Expand = false;
		w18.Fill = false;
		// Container child hbox8.Gtk.Box+BoxChild
		this.btnconnect = new global::Gtk.Button ();
		this.btnconnect.CanFocus = true;
		this.btnconnect.Name = "btnconnect";
		this.btnconnect.UseUnderline = true;
		global::Gtk.Image w19 = new global::Gtk.Image ();
		w19.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-disconnect", global::Gtk.IconSize.Button);
		this.btnconnect.Image = w19;
		this.hbox8.Add (this.btnconnect);
		global::Gtk.Box.BoxChild w20 = ((global::Gtk.Box.BoxChild)(this.hbox8 [this.btnconnect]));
		w20.PackType = ((global::Gtk.PackType)(1));
		w20.Position = 4;
		w20.Expand = false;
		w20.Fill = false;
		this.GtkAlignment7.Add (this.hbox8);
		this.fraPortDetail.Add (this.GtkAlignment7);
		this.GtkLabel10 = new global::Gtk.Label ();
		this.GtkLabel10.Name = "GtkLabel10";
		this.GtkLabel10.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Detalle del puerto</b>");
		this.GtkLabel10.UseMarkup = true;
		this.fraPortDetail.LabelWidget = this.GtkLabel10;
		this.vbox5.Add (this.fraPortDetail);
		global::Gtk.Box.BoxChild w23 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.fraPortDetail]));
		w23.Position = 1;
		w23.Expand = false;
		w23.Fill = false;
		// Container child vbox5.Gtk.Box+BoxChild
		this.fraCnnConfig = new global::Gtk.Frame ();
		this.fraCnnConfig.Name = "fraCnnConfig";
		this.fraCnnConfig.ShadowType = ((global::Gtk.ShadowType)(0));
		// Container child fraCnnConfig.Gtk.Container+ContainerChild
		this.GtkAlignment8 = new global::Gtk.Alignment (0F, 0F, 1F, 1F);
		this.GtkAlignment8.Name = "GtkAlignment8";
		this.GtkAlignment8.LeftPadding = ((uint)(12));
		// Container child GtkAlignment8.Gtk.Container+ContainerChild
		this.vbox6 = new global::Gtk.VBox ();
		this.vbox6.Name = "vbox6";
		this.vbox6.Spacing = 6;
		// Container child vbox6.Gtk.Box+BoxChild
		this.hbox9 = new global::Gtk.HBox ();
		this.hbox9.Name = "hbox9";
		this.hbox9.Spacing = 6;
		// Container child hbox9.Gtk.Box+BoxChild
		this.label5 = new global::Gtk.Label ();
		this.label5.Name = "label5";
		this.label5.Xpad = 20;
		this.label5.LabelProp = global::Mono.Unix.Catalog.GetString ("Baud Rate:");
		this.hbox9.Add (this.label5);
		global::Gtk.Box.BoxChild w24 = ((global::Gtk.Box.BoxChild)(this.hbox9 [this.label5]));
		w24.Position = 0;
		w24.Expand = false;
		w24.Fill = false;
		// Container child hbox9.Gtk.Box+BoxChild
		this.cmbBaudRate = global::Gtk.ComboBoxEntry.NewText ();
		this.cmbBaudRate.AppendText (global::Mono.Unix.Catalog.GetString ("9600"));
		this.cmbBaudRate.CanFocus = true;
		this.cmbBaudRate.Name = "cmbBaudRate";
		this.cmbBaudRate.Active = 0;
		this.hbox9.Add (this.cmbBaudRate);
		global::Gtk.Box.BoxChild w25 = ((global::Gtk.Box.BoxChild)(this.hbox9 [this.cmbBaudRate]));
		w25.Position = 1;
		this.vbox6.Add (this.hbox9);
		global::Gtk.Box.BoxChild w26 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox9]));
		w26.Position = 0;
		w26.Expand = false;
		w26.Fill = false;
		w26.Padding = ((uint)(4));
		// Container child vbox6.Gtk.Box+BoxChild
		this.hbox10 = new global::Gtk.HBox ();
		this.hbox10.Name = "hbox10";
		this.hbox10.Spacing = 6;
		// Container child hbox10.Gtk.Box+BoxChild
		this.label6 = new global::Gtk.Label ();
		this.label6.Name = "label6";
		this.label6.Xpad = 31;
		this.label6.LabelProp = global::Mono.Unix.Catalog.GetString ("Parity:");
		this.hbox10.Add (this.label6);
		global::Gtk.Box.BoxChild w27 = ((global::Gtk.Box.BoxChild)(this.hbox10 [this.label6]));
		w27.Position = 0;
		w27.Expand = false;
		w27.Fill = false;
		// Container child hbox10.Gtk.Box+BoxChild
		this.cmbParity = global::Gtk.ComboBoxEntry.NewText ();
		this.cmbParity.AppendText (global::Mono.Unix.Catalog.GetString ("Even"));
		this.cmbParity.AppendText (global::Mono.Unix.Catalog.GetString ("Odd"));
		this.cmbParity.AppendText (global::Mono.Unix.Catalog.GetString ("None"));
		this.cmbParity.AppendText (global::Mono.Unix.Catalog.GetString ("Mark"));
		this.cmbParity.AppendText (global::Mono.Unix.Catalog.GetString ("Space"));
		this.cmbParity.CanFocus = true;
		this.cmbParity.Name = "cmbParity";
		this.cmbParity.Active = 2;
		this.hbox10.Add (this.cmbParity);
		global::Gtk.Box.BoxChild w28 = ((global::Gtk.Box.BoxChild)(this.hbox10 [this.cmbParity]));
		w28.Position = 1;
		this.vbox6.Add (this.hbox10);
		global::Gtk.Box.BoxChild w29 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox10]));
		w29.Position = 1;
		w29.Expand = false;
		w29.Fill = false;
		// Container child vbox6.Gtk.Box+BoxChild
		this.hbox11 = new global::Gtk.HBox ();
		this.hbox11.Name = "hbox11";
		this.hbox11.Spacing = 6;
		// Container child hbox11.Gtk.Box+BoxChild
		this.label7 = new global::Gtk.Label ();
		this.label7.Name = "label7";
		this.label7.Xpad = 24;
		this.label7.LabelProp = global::Mono.Unix.Catalog.GetString ("Databits:");
		this.hbox11.Add (this.label7);
		global::Gtk.Box.BoxChild w30 = ((global::Gtk.Box.BoxChild)(this.hbox11 [this.label7]));
		w30.Position = 0;
		w30.Expand = false;
		w30.Fill = false;
		// Container child hbox11.Gtk.Box+BoxChild
		this.cmbDatabits = global::Gtk.ComboBoxEntry.NewText ();
		this.cmbDatabits.AppendText (global::Mono.Unix.Catalog.GetString ("4"));
		this.cmbDatabits.AppendText (global::Mono.Unix.Catalog.GetString ("5"));
		this.cmbDatabits.AppendText (global::Mono.Unix.Catalog.GetString ("6"));
		this.cmbDatabits.AppendText (global::Mono.Unix.Catalog.GetString ("7"));
		this.cmbDatabits.AppendText (global::Mono.Unix.Catalog.GetString ("8"));
		this.cmbDatabits.CanFocus = true;
		this.cmbDatabits.Name = "cmbDatabits";
		this.cmbDatabits.Active = 4;
		this.hbox11.Add (this.cmbDatabits);
		global::Gtk.Box.BoxChild w31 = ((global::Gtk.Box.BoxChild)(this.hbox11 [this.cmbDatabits]));
		w31.Position = 1;
		this.vbox6.Add (this.hbox11);
		global::Gtk.Box.BoxChild w32 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox11]));
		w32.Position = 2;
		w32.Expand = false;
		w32.Fill = false;
		// Container child vbox6.Gtk.Box+BoxChild
		this.hbox12 = new global::Gtk.HBox ();
		this.hbox12.Name = "hbox12";
		this.hbox12.Spacing = 6;
		// Container child hbox12.Gtk.Box+BoxChild
		this.label8 = new global::Gtk.Label ();
		this.label8.Name = "label8";
		this.label8.Xpad = 24;
		this.label8.LabelProp = global::Mono.Unix.Catalog.GetString ("Stopbits:");
		this.hbox12.Add (this.label8);
		global::Gtk.Box.BoxChild w33 = ((global::Gtk.Box.BoxChild)(this.hbox12 [this.label8]));
		w33.Position = 0;
		w33.Expand = false;
		w33.Fill = false;
		// Container child hbox12.Gtk.Box+BoxChild
		this.cmbStopbits = global::Gtk.ComboBoxEntry.NewText ();
		this.cmbStopbits.AppendText (global::Mono.Unix.Catalog.GetString ("None"));
		this.cmbStopbits.AppendText (global::Mono.Unix.Catalog.GetString ("One"));
		this.cmbStopbits.AppendText (global::Mono.Unix.Catalog.GetString ("OnePointFive"));
		this.cmbStopbits.AppendText (global::Mono.Unix.Catalog.GetString ("Two"));
		this.cmbStopbits.CanFocus = true;
		this.cmbStopbits.Name = "cmbStopbits";
		this.cmbStopbits.Active = 1;
		this.hbox12.Add (this.cmbStopbits);
		global::Gtk.Box.BoxChild w34 = ((global::Gtk.Box.BoxChild)(this.hbox12 [this.cmbStopbits]));
		w34.Position = 1;
		this.vbox6.Add (this.hbox12);
		global::Gtk.Box.BoxChild w35 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox12]));
		w35.Position = 3;
		w35.Expand = false;
		w35.Fill = false;
		this.GtkAlignment8.Add (this.vbox6);
		this.fraCnnConfig.Add (this.GtkAlignment8);
		this.GtkLabel11 = new global::Gtk.Label ();
		this.GtkLabel11.Name = "GtkLabel11";
		this.GtkLabel11.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Configuración de conexión</b>");
		this.GtkLabel11.UseMarkup = true;
		this.fraCnnConfig.LabelWidget = this.GtkLabel11;
		this.vbox5.Add (this.fraCnnConfig);
		global::Gtk.Box.BoxChild w38 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.fraCnnConfig]));
		w38.Position = 2;
		w38.Expand = false;
		w38.Fill = false;
		// Container child vbox5.Gtk.Box+BoxChild
		this.fraSendData = new global::Gtk.Frame ();
		this.fraSendData.Name = "fraSendData";
		this.fraSendData.ShadowType = ((global::Gtk.ShadowType)(0));
		// Container child fraSendData.Gtk.Container+ContainerChild
		this.GtkAlignment5 = new global::Gtk.Alignment (0F, 0F, 1F, 1F);
		this.GtkAlignment5.Name = "GtkAlignment5";
		this.GtkAlignment5.LeftPadding = ((uint)(12));
		// Container child GtkAlignment5.Gtk.Container+ContainerChild
		this.hbox3 = new global::Gtk.HBox ();
		this.hbox3.Name = "hbox3";
		this.hbox3.Spacing = 6;
		// Container child hbox3.Gtk.Box+BoxChild
		this.lblsendmsg = new global::Gtk.Label ();
		this.lblsendmsg.Name = "lblsendmsg";
		this.lblsendmsg.LabelProp = global::Mono.Unix.Catalog.GetString ("Enviar mensaje");
		this.hbox3.Add (this.lblsendmsg);
		global::Gtk.Box.BoxChild w39 = ((global::Gtk.Box.BoxChild)(this.hbox3 [this.lblsendmsg]));
		w39.Position = 0;
		w39.Expand = false;
		w39.Fill = false;
		// Container child hbox3.Gtk.Box+BoxChild
		this.txtsendmsg = new global::Gtk.Entry ();
		this.txtsendmsg.CanFocus = true;
		this.txtsendmsg.Name = "txtsendmsg";
		this.txtsendmsg.IsEditable = true;
		this.txtsendmsg.InvisibleChar = '●';
		this.hbox3.Add (this.txtsendmsg);
		global::Gtk.Box.BoxChild w40 = ((global::Gtk.Box.BoxChild)(this.hbox3 [this.txtsendmsg]));
		w40.Position = 1;
		// Container child hbox3.Gtk.Box+BoxChild
		this.btnsendmsg = new global::Gtk.Button ();
		this.btnsendmsg.CanFocus = true;
		this.btnsendmsg.Name = "btnsendmsg";
		this.btnsendmsg.UseUnderline = true;
		global::Gtk.Image w41 = new global::Gtk.Image ();
		w41.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-go-forward", global::Gtk.IconSize.Dnd);
		this.btnsendmsg.Image = w41;
		this.hbox3.Add (this.btnsendmsg);
		global::Gtk.Box.BoxChild w42 = ((global::Gtk.Box.BoxChild)(this.hbox3 [this.btnsendmsg]));
		w42.Position = 2;
		w42.Expand = false;
		w42.Fill = false;
		this.GtkAlignment5.Add (this.hbox3);
		this.fraSendData.Add (this.GtkAlignment5);
		this.GtkLabel7 = new global::Gtk.Label ();
		this.GtkLabel7.Name = "GtkLabel7";
		this.GtkLabel7.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Envio de datos de prueba</b>");
		this.GtkLabel7.UseMarkup = true;
		this.fraSendData.LabelWidget = this.GtkLabel7;
		this.vbox5.Add (this.fraSendData);
		global::Gtk.Box.BoxChild w45 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.fraSendData]));
		w45.Position = 3;
		w45.Expand = false;
		w45.Fill = false;
		this.paned.Add (this.vbox5);
		global::Gtk.Paned.PanedChild w46 = ((global::Gtk.Paned.PanedChild)(this.paned [this.vbox5]));
		w46.Resize = false;
		// Container child paned.Gtk.Paned+PanedChild
		this.GtkScrolledWindow1 = new global::Gtk.ScrolledWindow ();
		this.GtkScrolledWindow1.Name = "GtkScrolledWindow1";
		this.GtkScrolledWindow1.ShadowType = ((global::Gtk.ShadowType)(1));
		// Container child GtkScrolledWindow1.Gtk.Container+ContainerChild
		this.tblBitacora = new global::Gtk.TreeView ();
		this.tblBitacora.CanFocus = true;
		this.tblBitacora.Name = "tblBitacora";
		this.GtkScrolledWindow1.Add (this.tblBitacora);
		this.paned.Add (this.GtkScrolledWindow1);
		this.vbox4.Add (this.paned);
		global::Gtk.Box.BoxChild w49 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.paned]));
		w49.Position = 1;
		// Container child vbox4.Gtk.Box+BoxChild
		this.statusbar = new global::Gtk.Statusbar ();
		this.statusbar.Name = "statusbar";
		this.statusbar.Spacing = 6;
		this.statusbar.HasResizeGrip = false;
		// Container child statusbar.Gtk.Box+BoxChild
		this.button2 = new global::Gtk.Button ();
		this.button2.CanFocus = true;
		this.button2.Name = "button2";
		this.button2.UseUnderline = true;
		global::Gtk.Image w50 = new global::Gtk.Image ();
		w50.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-close", global::Gtk.IconSize.Dnd);
		this.button2.Image = w50;
		this.statusbar.Add (this.button2);
		global::Gtk.Box.BoxChild w51 = ((global::Gtk.Box.BoxChild)(this.statusbar [this.button2]));
		w51.Position = 1;
		w51.Expand = false;
		w51.Fill = false;
		this.vbox4.Add (this.statusbar);
		global::Gtk.Box.BoxChild w52 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.statusbar]));
		w52.Position = 2;
		w52.Expand = false;
		w52.Fill = false;
		this.Add (this.vbox4);
		if ((this.Child != null)) {
			this.Child.ShowAll ();
		}
		this.DefaultWidth = 827;
		this.DefaultHeight = 612;
		this.lblPortsNotFound.Hide ();
		this.fraPortDetail.Hide ();
		this.fraCnnConfig.Hide ();
		this.fraSendData.Hide ();
		this.Show ();
		this.DeleteEvent += new global::Gtk.DeleteEventHandler (this.OnDeleteEvent);
		this.disconnectAction.Activated += new global::System.EventHandler (this.OnYesActionActivated);
		this.closeAction.Activated += new global::System.EventHandler (this.OnCloseActionActivated);
		this.btnrefreshports.Clicked += new global::System.EventHandler (this.OnBtnrefreshportsClicked);
		this.btnconnect.Clicked += new global::System.EventHandler (this.OnBtnconnectClicked);
		this.btndisconnect.Clicked += new global::System.EventHandler (this.OnBtndisconnectClicked);
		this.btnsendmsg.Clicked += new global::System.EventHandler (this.OnBtnsendmsgClicked);
		this.button2.Clicked += new global::System.EventHandler (this.OnButton2Clicked);
	}
}

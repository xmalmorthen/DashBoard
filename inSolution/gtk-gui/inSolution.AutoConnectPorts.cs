
// This file has been generated by the GUI designer. Do not modify.
namespace inSolution
{
	public partial class AutoConnectPorts
	{
		private global::Gtk.VBox mainbox;
		
		private global::Gtk.HPaned hpaned2;
		
		private global::Gtk.HBox hbox7;
		
		private global::Gtk.VBox vbox1;
		
		private global::Gtk.Frame frame2;
		
		private global::Gtk.Alignment GtkAlignment5;
		
		private global::Gtk.VBox vbox3;
		
		private global::Gtk.HBox hbox3;
		
		private global::Gtk.Label label1;
		
		private global::Gtk.Entry txtPuerto;
		
		private global::Gtk.HBox hbox1;
		
		private global::Gtk.Label label3;
		
		private global::Gtk.Entry txtalias;
		
		private global::Gtk.HBox hbox4;
		
		private global::Gtk.Label label2;
		
		private global::Gtk.Entry txtDesc;
		
		private global::Gtk.Label GtkLabel5;
		
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
		
		private global::Gtk.VBox vbox5;
		
		private global::Gtk.Alignment alignment2;
		
		private global::Gtk.Button btnInsert;
		
		private global::Gtk.Button btnEdit;
		
		private global::Gtk.Button btnClear;
		
		private global::Gtk.Frame frame1;
		
		private global::Gtk.Alignment GtkAlignment3;
		
		private global::Gtk.HBox hbox5;
		
		private global::Gtk.ScrolledWindow GtkScrolledWindow;
		
		private global::Gtk.TreeView tblData;
		
		private global::Gtk.VBox vbox4;
		
		private global::Gtk.Alignment alignment1;
		
		private global::Gtk.Button btnDelete;
		
		private global::Gtk.Label GtkLabel4;

		protected virtual void Build ()
		{
			global::Stetic.Gui.Initialize (this);
			// Widget inSolution.AutoConnectPorts
			this.Name = "inSolution.AutoConnectPorts";
			this.Title = global::Mono.Unix.Catalog.GetString ("AutoConnectPorts");
			this.Icon = global::Stetic.IconLoader.LoadIcon (this, "gtk-execute", global::Gtk.IconSize.SmallToolbar);
			this.WindowPosition = ((global::Gtk.WindowPosition)(4));
			this.Modal = true;
			// Container child inSolution.AutoConnectPorts.Gtk.Container+ContainerChild
			this.mainbox = new global::Gtk.VBox ();
			this.mainbox.Name = "mainbox";
			this.mainbox.BorderWidth = ((uint)(2));
			// Container child mainbox.Gtk.Box+BoxChild
			this.hpaned2 = new global::Gtk.HPaned ();
			this.hpaned2.CanFocus = true;
			this.hpaned2.Name = "hpaned2";
			this.hpaned2.Position = 1;
			// Container child hpaned2.Gtk.Paned+PanedChild
			this.hbox7 = new global::Gtk.HBox ();
			this.hbox7.Name = "hbox7";
			this.hbox7.Spacing = 6;
			// Container child hbox7.Gtk.Box+BoxChild
			this.vbox1 = new global::Gtk.VBox ();
			this.vbox1.Name = "vbox1";
			this.vbox1.Spacing = 6;
			// Container child vbox1.Gtk.Box+BoxChild
			this.frame2 = new global::Gtk.Frame ();
			this.frame2.Name = "frame2";
			this.frame2.ShadowType = ((global::Gtk.ShadowType)(0));
			this.frame2.BorderWidth = ((uint)(3));
			// Container child frame2.Gtk.Container+ContainerChild
			this.GtkAlignment5 = new global::Gtk.Alignment (0F, 0F, 1F, 1F);
			this.GtkAlignment5.Name = "GtkAlignment5";
			this.GtkAlignment5.LeftPadding = ((uint)(12));
			// Container child GtkAlignment5.Gtk.Container+ContainerChild
			this.vbox3 = new global::Gtk.VBox ();
			this.vbox3.Name = "vbox3";
			this.vbox3.Spacing = 6;
			this.vbox3.BorderWidth = ((uint)(6));
			// Container child vbox3.Gtk.Box+BoxChild
			this.hbox3 = new global::Gtk.HBox ();
			this.hbox3.Name = "hbox3";
			this.hbox3.Spacing = 6;
			// Container child hbox3.Gtk.Box+BoxChild
			this.label1 = new global::Gtk.Label ();
			this.label1.Name = "label1";
			this.label1.Xpad = 13;
			this.label1.LabelProp = global::Mono.Unix.Catalog.GetString ("Puerto");
			this.hbox3.Add (this.label1);
			global::Gtk.Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(this.hbox3 [this.label1]));
			w1.Position = 0;
			w1.Expand = false;
			w1.Fill = false;
			// Container child hbox3.Gtk.Box+BoxChild
			this.txtPuerto = new global::Gtk.Entry ();
			this.txtPuerto.CanFocus = true;
			this.txtPuerto.Name = "txtPuerto";
			this.txtPuerto.IsEditable = true;
			this.txtPuerto.InvisibleChar = '●';
			this.hbox3.Add (this.txtPuerto);
			global::Gtk.Box.BoxChild w2 = ((global::Gtk.Box.BoxChild)(this.hbox3 [this.txtPuerto]));
			w2.Position = 1;
			this.vbox3.Add (this.hbox3);
			global::Gtk.Box.BoxChild w3 = ((global::Gtk.Box.BoxChild)(this.vbox3 [this.hbox3]));
			w3.Position = 0;
			w3.Expand = false;
			w3.Fill = false;
			// Container child vbox3.Gtk.Box+BoxChild
			this.hbox1 = new global::Gtk.HBox ();
			this.hbox1.Name = "hbox1";
			this.hbox1.Spacing = 6;
			// Container child hbox1.Gtk.Box+BoxChild
			this.label3 = new global::Gtk.Label ();
			this.label3.WidthRequest = 61;
			this.label3.Name = "label3";
			this.label3.LabelProp = global::Mono.Unix.Catalog.GetString ("Alias");
			this.hbox1.Add (this.label3);
			global::Gtk.Box.BoxChild w4 = ((global::Gtk.Box.BoxChild)(this.hbox1 [this.label3]));
			w4.Position = 0;
			w4.Expand = false;
			w4.Fill = false;
			// Container child hbox1.Gtk.Box+BoxChild
			this.txtalias = new global::Gtk.Entry ();
			this.txtalias.CanFocus = true;
			this.txtalias.Name = "txtalias";
			this.txtalias.IsEditable = true;
			this.txtalias.InvisibleChar = '●';
			this.hbox1.Add (this.txtalias);
			global::Gtk.Box.BoxChild w5 = ((global::Gtk.Box.BoxChild)(this.hbox1 [this.txtalias]));
			w5.Position = 1;
			this.vbox3.Add (this.hbox1);
			global::Gtk.Box.BoxChild w6 = ((global::Gtk.Box.BoxChild)(this.vbox3 [this.hbox1]));
			w6.Position = 1;
			w6.Expand = false;
			w6.Fill = false;
			// Container child vbox3.Gtk.Box+BoxChild
			this.hbox4 = new global::Gtk.HBox ();
			this.hbox4.Name = "hbox4";
			this.hbox4.Spacing = 6;
			// Container child hbox4.Gtk.Box+BoxChild
			this.label2 = new global::Gtk.Label ();
			this.label2.Name = "label2";
			this.label2.LabelProp = global::Mono.Unix.Catalog.GetString ("Descripción");
			this.hbox4.Add (this.label2);
			global::Gtk.Box.BoxChild w7 = ((global::Gtk.Box.BoxChild)(this.hbox4 [this.label2]));
			w7.Position = 0;
			w7.Expand = false;
			w7.Fill = false;
			// Container child hbox4.Gtk.Box+BoxChild
			this.txtDesc = new global::Gtk.Entry ();
			this.txtDesc.CanFocus = true;
			this.txtDesc.Name = "txtDesc";
			this.txtDesc.IsEditable = true;
			this.txtDesc.InvisibleChar = '●';
			this.hbox4.Add (this.txtDesc);
			global::Gtk.Box.BoxChild w8 = ((global::Gtk.Box.BoxChild)(this.hbox4 [this.txtDesc]));
			w8.Position = 1;
			this.vbox3.Add (this.hbox4);
			global::Gtk.Box.BoxChild w9 = ((global::Gtk.Box.BoxChild)(this.vbox3 [this.hbox4]));
			w9.Position = 2;
			w9.Expand = false;
			w9.Fill = false;
			this.GtkAlignment5.Add (this.vbox3);
			this.frame2.Add (this.GtkAlignment5);
			this.GtkLabel5 = new global::Gtk.Label ();
			this.GtkLabel5.Name = "GtkLabel5";
			this.GtkLabel5.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Configuraciones del puerto</b>");
			this.GtkLabel5.UseMarkup = true;
			this.frame2.LabelWidget = this.GtkLabel5;
			this.vbox1.Add (this.frame2);
			global::Gtk.Box.BoxChild w12 = ((global::Gtk.Box.BoxChild)(this.vbox1 [this.frame2]));
			w12.Position = 0;
			w12.Fill = false;
			// Container child vbox1.Gtk.Box+BoxChild
			this.fraCnnConfig = new global::Gtk.Frame ();
			this.fraCnnConfig.Name = "fraCnnConfig";
			this.fraCnnConfig.ShadowType = ((global::Gtk.ShadowType)(0));
			this.fraCnnConfig.BorderWidth = ((uint)(3));
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
			global::Gtk.Box.BoxChild w13 = ((global::Gtk.Box.BoxChild)(this.hbox9 [this.label5]));
			w13.Position = 0;
			w13.Expand = false;
			w13.Fill = false;
			// Container child hbox9.Gtk.Box+BoxChild
			this.cmbBaudRate = global::Gtk.ComboBoxEntry.NewText ();
			this.cmbBaudRate.AppendText (global::Mono.Unix.Catalog.GetString ("9600"));
			this.cmbBaudRate.CanFocus = true;
			this.cmbBaudRate.Name = "cmbBaudRate";
			this.cmbBaudRate.Active = 0;
			this.hbox9.Add (this.cmbBaudRate);
			global::Gtk.Box.BoxChild w14 = ((global::Gtk.Box.BoxChild)(this.hbox9 [this.cmbBaudRate]));
			w14.Position = 1;
			this.vbox6.Add (this.hbox9);
			global::Gtk.Box.BoxChild w15 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox9]));
			w15.Position = 0;
			w15.Expand = false;
			w15.Fill = false;
			w15.Padding = ((uint)(4));
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
			global::Gtk.Box.BoxChild w16 = ((global::Gtk.Box.BoxChild)(this.hbox10 [this.label6]));
			w16.Position = 0;
			w16.Expand = false;
			w16.Fill = false;
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
			global::Gtk.Box.BoxChild w17 = ((global::Gtk.Box.BoxChild)(this.hbox10 [this.cmbParity]));
			w17.Position = 1;
			this.vbox6.Add (this.hbox10);
			global::Gtk.Box.BoxChild w18 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox10]));
			w18.Position = 1;
			w18.Expand = false;
			w18.Fill = false;
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
			global::Gtk.Box.BoxChild w19 = ((global::Gtk.Box.BoxChild)(this.hbox11 [this.label7]));
			w19.Position = 0;
			w19.Expand = false;
			w19.Fill = false;
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
			global::Gtk.Box.BoxChild w20 = ((global::Gtk.Box.BoxChild)(this.hbox11 [this.cmbDatabits]));
			w20.Position = 1;
			this.vbox6.Add (this.hbox11);
			global::Gtk.Box.BoxChild w21 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox11]));
			w21.Position = 2;
			w21.Expand = false;
			w21.Fill = false;
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
			global::Gtk.Box.BoxChild w22 = ((global::Gtk.Box.BoxChild)(this.hbox12 [this.label8]));
			w22.Position = 0;
			w22.Expand = false;
			w22.Fill = false;
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
			global::Gtk.Box.BoxChild w23 = ((global::Gtk.Box.BoxChild)(this.hbox12 [this.cmbStopbits]));
			w23.Position = 1;
			this.vbox6.Add (this.hbox12);
			global::Gtk.Box.BoxChild w24 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox12]));
			w24.Position = 3;
			w24.Expand = false;
			w24.Fill = false;
			this.GtkAlignment8.Add (this.vbox6);
			this.fraCnnConfig.Add (this.GtkAlignment8);
			this.GtkLabel11 = new global::Gtk.Label ();
			this.GtkLabel11.Name = "GtkLabel11";
			this.GtkLabel11.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Configuración de conexión</b>");
			this.GtkLabel11.UseMarkup = true;
			this.fraCnnConfig.LabelWidget = this.GtkLabel11;
			this.vbox1.Add (this.fraCnnConfig);
			global::Gtk.Box.BoxChild w27 = ((global::Gtk.Box.BoxChild)(this.vbox1 [this.fraCnnConfig]));
			w27.Position = 1;
			w27.Expand = false;
			w27.Fill = false;
			this.hbox7.Add (this.vbox1);
			global::Gtk.Box.BoxChild w28 = ((global::Gtk.Box.BoxChild)(this.hbox7 [this.vbox1]));
			w28.Position = 0;
			// Container child hbox7.Gtk.Box+BoxChild
			this.vbox5 = new global::Gtk.VBox ();
			this.vbox5.Name = "vbox5";
			this.vbox5.Spacing = 6;
			// Container child vbox5.Gtk.Box+BoxChild
			this.alignment2 = new global::Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
			this.alignment2.Name = "alignment2";
			this.vbox5.Add (this.alignment2);
			global::Gtk.Box.BoxChild w29 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.alignment2]));
			w29.Position = 0;
			// Container child vbox5.Gtk.Box+BoxChild
			this.btnInsert = new global::Gtk.Button ();
			this.btnInsert.CanFocus = true;
			this.btnInsert.Name = "btnInsert";
			this.btnInsert.UseUnderline = true;
			global::Gtk.Image w30 = new global::Gtk.Image ();
			w30.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-add", global::Gtk.IconSize.Button);
			this.btnInsert.Image = w30;
			this.vbox5.Add (this.btnInsert);
			global::Gtk.Box.BoxChild w31 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.btnInsert]));
			w31.Position = 1;
			w31.Expand = false;
			w31.Fill = false;
			// Container child vbox5.Gtk.Box+BoxChild
			this.btnEdit = new global::Gtk.Button ();
			this.btnEdit.CanFocus = true;
			this.btnEdit.Name = "btnEdit";
			this.btnEdit.UseUnderline = true;
			global::Gtk.Image w32 = new global::Gtk.Image ();
			w32.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-edit", global::Gtk.IconSize.Button);
			this.btnEdit.Image = w32;
			this.vbox5.Add (this.btnEdit);
			global::Gtk.Box.BoxChild w33 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.btnEdit]));
			w33.Position = 2;
			w33.Expand = false;
			w33.Fill = false;
			// Container child vbox5.Gtk.Box+BoxChild
			this.btnClear = new global::Gtk.Button ();
			this.btnClear.CanFocus = true;
			this.btnClear.Name = "btnClear";
			this.btnClear.UseUnderline = true;
			global::Gtk.Image w34 = new global::Gtk.Image ();
			w34.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-clear", global::Gtk.IconSize.Button);
			this.btnClear.Image = w34;
			this.vbox5.Add (this.btnClear);
			global::Gtk.Box.BoxChild w35 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.btnClear]));
			w35.Position = 3;
			w35.Expand = false;
			w35.Fill = false;
			this.hbox7.Add (this.vbox5);
			global::Gtk.Box.BoxChild w36 = ((global::Gtk.Box.BoxChild)(this.hbox7 [this.vbox5]));
			w36.Position = 1;
			w36.Expand = false;
			w36.Padding = ((uint)(9));
			this.hpaned2.Add (this.hbox7);
			global::Gtk.Paned.PanedChild w37 = ((global::Gtk.Paned.PanedChild)(this.hpaned2 [this.hbox7]));
			w37.Resize = false;
			// Container child hpaned2.Gtk.Paned+PanedChild
			this.frame1 = new global::Gtk.Frame ();
			this.frame1.Name = "frame1";
			this.frame1.ShadowType = ((global::Gtk.ShadowType)(0));
			// Container child frame1.Gtk.Container+ContainerChild
			this.GtkAlignment3 = new global::Gtk.Alignment (0F, 0F, 1F, 1F);
			this.GtkAlignment3.Name = "GtkAlignment3";
			this.GtkAlignment3.LeftPadding = ((uint)(12));
			// Container child GtkAlignment3.Gtk.Container+ContainerChild
			this.hbox5 = new global::Gtk.HBox ();
			this.hbox5.Name = "hbox5";
			this.hbox5.Spacing = 6;
			// Container child hbox5.Gtk.Box+BoxChild
			this.GtkScrolledWindow = new global::Gtk.ScrolledWindow ();
			this.GtkScrolledWindow.Name = "GtkScrolledWindow";
			this.GtkScrolledWindow.ShadowType = ((global::Gtk.ShadowType)(1));
			// Container child GtkScrolledWindow.Gtk.Container+ContainerChild
			this.tblData = new global::Gtk.TreeView ();
			this.tblData.CanFocus = true;
			this.tblData.Name = "tblData";
			this.GtkScrolledWindow.Add (this.tblData);
			this.hbox5.Add (this.GtkScrolledWindow);
			global::Gtk.Box.BoxChild w39 = ((global::Gtk.Box.BoxChild)(this.hbox5 [this.GtkScrolledWindow]));
			w39.Position = 0;
			// Container child hbox5.Gtk.Box+BoxChild
			this.vbox4 = new global::Gtk.VBox ();
			this.vbox4.Name = "vbox4";
			this.vbox4.Spacing = 6;
			// Container child vbox4.Gtk.Box+BoxChild
			this.alignment1 = new global::Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
			this.alignment1.Name = "alignment1";
			this.vbox4.Add (this.alignment1);
			global::Gtk.Box.BoxChild w40 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.alignment1]));
			w40.Position = 0;
			// Container child vbox4.Gtk.Box+BoxChild
			this.btnDelete = new global::Gtk.Button ();
			this.btnDelete.CanFocus = true;
			this.btnDelete.Name = "btnDelete";
			this.btnDelete.UseUnderline = true;
			global::Gtk.Image w41 = new global::Gtk.Image ();
			w41.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-delete", global::Gtk.IconSize.Button);
			this.btnDelete.Image = w41;
			this.vbox4.Add (this.btnDelete);
			global::Gtk.Box.BoxChild w42 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.btnDelete]));
			w42.Position = 1;
			w42.Expand = false;
			w42.Fill = false;
			this.hbox5.Add (this.vbox4);
			global::Gtk.Box.BoxChild w43 = ((global::Gtk.Box.BoxChild)(this.hbox5 [this.vbox4]));
			w43.Position = 1;
			w43.Expand = false;
			w43.Fill = false;
			this.GtkAlignment3.Add (this.hbox5);
			this.frame1.Add (this.GtkAlignment3);
			this.GtkLabel4 = new global::Gtk.Label ();
			this.GtkLabel4.Name = "GtkLabel4";
			this.GtkLabel4.Xalign = 0F;
			this.GtkLabel4.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Puertos configurados</b>");
			this.GtkLabel4.UseMarkup = true;
			this.frame1.LabelWidget = this.GtkLabel4;
			this.hpaned2.Add (this.frame1);
			this.mainbox.Add (this.hpaned2);
			global::Gtk.Box.BoxChild w47 = ((global::Gtk.Box.BoxChild)(this.mainbox [this.hpaned2]));
			w47.PackType = ((global::Gtk.PackType)(1));
			w47.Position = 0;
			this.Add (this.mainbox);
			if ((this.Child != null)) {
				this.Child.ShowAll ();
			}
			this.DefaultWidth = 703;
			this.DefaultHeight = 329;
			this.btnEdit.Hide ();
			this.Show ();
			this.btnInsert.Clicked += new global::System.EventHandler (this.OnBtnInsertClicked);
			this.btnEdit.Clicked += new global::System.EventHandler (this.OnBtnEditClicked);
			this.btnClear.Clicked += new global::System.EventHandler (this.OnBtnClearClicked);
			this.btnDelete.Clicked += new global::System.EventHandler (this.OnBtnDeleteClicked);
		}
	}
}


// This file has been generated by the GUI designer. Do not modify.
namespace paySolution
{
	public partial class frmWellcomePension
	{
		private global::Gtk.HBox hbox1;
		
		private global::Gtk.VBox vbox5;
		
		private global::Gtk.Label lblWelcome;
		
		private global::Gtk.Label lblName;
		
		private global::Gtk.VBox vbox1;
		
		private global::Gtk.Image imgLogo;
		
		private global::Gtk.Alignment alignment2;
		
		private global::Gtk.HBox hbox6;
		
		private global::Gtk.Label lblPlus;
		
		private global::Gtk.Image imgMajor;
		
		private global::Gtk.HBox hbox7;
		
		private global::Gtk.Label lblAcept;
		
		private global::Gtk.Image imgMajor1;
		
		private global::Gtk.HBox hbox8;
		
		private global::Gtk.Label lblCancel;
		
		private global::Gtk.Image imgMajor2;
		
		private global::Gtk.Alignment alignment1;

		protected virtual void Build ()
		{
			global::Stetic.Gui.Initialize (this);
			// Widget paySolution.frmWellcomePension
			this.WidthRequest = 1280;
			this.HeightRequest = 768;
			this.Name = "paySolution.frmWellcomePension";
			this.Title = "";
			this.TypeHint = ((global::Gdk.WindowTypeHint)(4));
			this.WindowPosition = ((global::Gtk.WindowPosition)(3));
			this.Resizable = false;
			this.Decorated = false;
			this.Gravity = ((global::Gdk.Gravity)(10));
			// Container child paySolution.frmWellcomePension.Gtk.Container+ContainerChild
			this.hbox1 = new global::Gtk.HBox ();
			this.hbox1.Name = "hbox1";
			this.hbox1.Spacing = 6;
			this.hbox1.BorderWidth = ((uint)(6));
			// Container child hbox1.Gtk.Box+BoxChild
			this.vbox5 = new global::Gtk.VBox ();
			this.vbox5.Name = "vbox5";
			this.vbox5.Spacing = 6;
			// Container child vbox5.Gtk.Box+BoxChild
			this.lblWelcome = new global::Gtk.Label ();
			this.lblWelcome.Name = "lblWelcome";
			this.lblWelcome.Xalign = 1F;
			this.lblWelcome.LabelProp = global::Mono.Unix.Catalog.GetString ("<span foreground=\"white\" size=\"60000\">BIENVENIDO</span>");
			this.lblWelcome.UseMarkup = true;
			this.lblWelcome.Justify = ((global::Gtk.Justification)(1));
			this.vbox5.Add (this.lblWelcome);
			global::Gtk.Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.lblWelcome]));
			w1.Position = 0;
			w1.Expand = false;
			// Container child vbox5.Gtk.Box+BoxChild
			this.lblName = new global::Gtk.Label ();
			this.lblName.Name = "lblName";
			this.lblName.Xalign = 0F;
			this.lblName.LabelProp = global::Mono.Unix.Catalog.GetString ("<span foreground=\"white\" size=\"30000\">BIENVENIDO</span>");
			this.lblName.UseMarkup = true;
			this.lblName.Justify = ((global::Gtk.Justification)(1));
			this.vbox5.Add (this.lblName);
			global::Gtk.Box.BoxChild w2 = ((global::Gtk.Box.BoxChild)(this.vbox5 [this.lblName]));
			w2.Position = 1;
			w2.Expand = false;
			w2.Fill = false;
			this.hbox1.Add (this.vbox5);
			global::Gtk.Box.BoxChild w3 = ((global::Gtk.Box.BoxChild)(this.hbox1 [this.vbox5]));
			w3.Position = 0;
			w3.Expand = false;
			w3.Fill = false;
			// Container child hbox1.Gtk.Box+BoxChild
			this.vbox1 = new global::Gtk.VBox ();
			this.vbox1.Name = "vbox1";
			this.vbox1.Spacing = 6;
			// Container child vbox1.Gtk.Box+BoxChild
			this.imgLogo = new global::Gtk.Image ();
			this.imgLogo.Name = "imgLogo";
			this.imgLogo.Xalign = 1F;
			this.vbox1.Add (this.imgLogo);
			global::Gtk.Box.BoxChild w4 = ((global::Gtk.Box.BoxChild)(this.vbox1 [this.imgLogo]));
			w4.Position = 0;
			w4.Expand = false;
			w4.Fill = false;
			w4.Padding = ((uint)(3));
			// Container child vbox1.Gtk.Box+BoxChild
			this.alignment2 = new global::Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
			this.alignment2.HeightRequest = 139;
			this.alignment2.Name = "alignment2";
			this.vbox1.Add (this.alignment2);
			global::Gtk.Box.BoxChild w5 = ((global::Gtk.Box.BoxChild)(this.vbox1 [this.alignment2]));
			w5.Position = 1;
			w5.Expand = false;
			// Container child vbox1.Gtk.Box+BoxChild
			this.hbox6 = new global::Gtk.HBox ();
			this.hbox6.HeightRequest = 150;
			this.hbox6.Name = "hbox6";
			this.hbox6.Spacing = 6;
			// Container child hbox6.Gtk.Box+BoxChild
			this.lblPlus = new global::Gtk.Label ();
			this.lblPlus.Name = "lblPlus";
			this.lblPlus.Xalign = 1F;
			this.lblPlus.LabelProp = global::Mono.Unix.Catalog.GetString ("<span foreground=\"white\" size=\"40000\">RENOVAR PENSIÓN</span>");
			this.lblPlus.UseMarkup = true;
			this.lblPlus.Justify = ((global::Gtk.Justification)(1));
			this.hbox6.Add (this.lblPlus);
			global::Gtk.Box.BoxChild w6 = ((global::Gtk.Box.BoxChild)(this.hbox6 [this.lblPlus]));
			w6.Position = 0;
			// Container child hbox6.Gtk.Box+BoxChild
			this.imgMajor = new global::Gtk.Image ();
			this.imgMajor.Name = "imgMajor";
			this.hbox6.Add (this.imgMajor);
			global::Gtk.Box.BoxChild w7 = ((global::Gtk.Box.BoxChild)(this.hbox6 [this.imgMajor]));
			w7.PackType = ((global::Gtk.PackType)(1));
			w7.Position = 1;
			w7.Expand = false;
			w7.Fill = false;
			this.vbox1.Add (this.hbox6);
			global::Gtk.Box.BoxChild w8 = ((global::Gtk.Box.BoxChild)(this.vbox1 [this.hbox6]));
			w8.Position = 2;
			w8.Expand = false;
			// Container child vbox1.Gtk.Box+BoxChild
			this.hbox7 = new global::Gtk.HBox ();
			this.hbox7.HeightRequest = 150;
			this.hbox7.Name = "hbox7";
			this.hbox7.Spacing = 6;
			// Container child hbox7.Gtk.Box+BoxChild
			this.lblAcept = new global::Gtk.Label ();
			this.lblAcept.Name = "lblAcept";
			this.lblAcept.Xalign = 1F;
			this.lblAcept.LabelProp = global::Mono.Unix.Catalog.GetString ("<span foreground=\"white\" size=\"40000\">PAGAR TICKET</span>");
			this.lblAcept.UseMarkup = true;
			this.lblAcept.Justify = ((global::Gtk.Justification)(1));
			this.hbox7.Add (this.lblAcept);
			global::Gtk.Box.BoxChild w9 = ((global::Gtk.Box.BoxChild)(this.hbox7 [this.lblAcept]));
			w9.Position = 0;
			// Container child hbox7.Gtk.Box+BoxChild
			this.imgMajor1 = new global::Gtk.Image ();
			this.imgMajor1.Name = "imgMajor1";
			this.hbox7.Add (this.imgMajor1);
			global::Gtk.Box.BoxChild w10 = ((global::Gtk.Box.BoxChild)(this.hbox7 [this.imgMajor1]));
			w10.PackType = ((global::Gtk.PackType)(1));
			w10.Position = 1;
			w10.Expand = false;
			w10.Fill = false;
			this.vbox1.Add (this.hbox7);
			global::Gtk.Box.BoxChild w11 = ((global::Gtk.Box.BoxChild)(this.vbox1 [this.hbox7]));
			w11.Position = 3;
			w11.Expand = false;
			w11.Fill = false;
			// Container child vbox1.Gtk.Box+BoxChild
			this.hbox8 = new global::Gtk.HBox ();
			this.hbox8.HeightRequest = 150;
			this.hbox8.Name = "hbox8";
			this.hbox8.Spacing = 6;
			// Container child hbox8.Gtk.Box+BoxChild
			this.lblCancel = new global::Gtk.Label ();
			this.lblCancel.Name = "lblCancel";
			this.lblCancel.Xalign = 1F;
			this.lblCancel.LabelProp = global::Mono.Unix.Catalog.GetString ("<span foreground=\"white\" size=\"40000\">CANCELAR</span>");
			this.lblCancel.UseMarkup = true;
			this.lblCancel.Justify = ((global::Gtk.Justification)(1));
			this.hbox8.Add (this.lblCancel);
			global::Gtk.Box.BoxChild w12 = ((global::Gtk.Box.BoxChild)(this.hbox8 [this.lblCancel]));
			w12.Position = 0;
			// Container child hbox8.Gtk.Box+BoxChild
			this.imgMajor2 = new global::Gtk.Image ();
			this.imgMajor2.Name = "imgMajor2";
			this.hbox8.Add (this.imgMajor2);
			global::Gtk.Box.BoxChild w13 = ((global::Gtk.Box.BoxChild)(this.hbox8 [this.imgMajor2]));
			w13.PackType = ((global::Gtk.PackType)(1));
			w13.Position = 1;
			w13.Expand = false;
			w13.Fill = false;
			this.vbox1.Add (this.hbox8);
			global::Gtk.Box.BoxChild w14 = ((global::Gtk.Box.BoxChild)(this.vbox1 [this.hbox8]));
			w14.Position = 4;
			w14.Expand = false;
			w14.Fill = false;
			this.hbox1.Add (this.vbox1);
			global::Gtk.Box.BoxChild w15 = ((global::Gtk.Box.BoxChild)(this.hbox1 [this.vbox1]));
			w15.PackType = ((global::Gtk.PackType)(1));
			w15.Position = 1;
			w15.Expand = false;
			w15.Fill = false;
			// Container child hbox1.Gtk.Box+BoxChild
			this.alignment1 = new global::Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
			this.alignment1.WidthRequest = 25;
			this.alignment1.Name = "alignment1";
			this.hbox1.Add (this.alignment1);
			global::Gtk.Box.BoxChild w16 = ((global::Gtk.Box.BoxChild)(this.hbox1 [this.alignment1]));
			w16.PackType = ((global::Gtk.PackType)(1));
			w16.Position = 2;
			w16.Expand = false;
			w16.Fill = false;
			this.Add (this.hbox1);
			if ((this.Child != null)) {
				this.Child.ShowAll ();
			}
			this.DefaultWidth = 1280;
			this.DefaultHeight = 768;
			this.Show ();
			this.DeleteEvent += new global::Gtk.DeleteEventHandler (this.OnDeleteEvent);
		}
	}
}

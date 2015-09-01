using System;
using Cairo;
using Gtk;
using System.Windows.Forms;
using System.Collections;
using MySql.Data.MySqlClient;

namespace paySolution
{
	public partial class frmPayPanel : Gtk.Window
	{
		Timer hour;

		private void configureBackgroundForm(){
			mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (cnfg.GetFormBackgroundImage));
		}

		private void putDateTimeinLanguaje(){
			lblfechaData.LabelProp = markup.make(string.Format("{0:MM/dd/yyyy}",DateTime.Now),"red", null, "20000","bold");
			lblhoraData.LabelProp = markup.make(string.Format("{0:H:mm:ss}",DateTime.Now),"red", null, "20000","bold");
		}

		void hour_Tick(object sender, EventArgs e){
			this.putDateTimeinLanguaje ();
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
					}

					Gtk.Button btn = new Gtk.Button();
					btn.Name = string.Format ("{0}", idioms ["siglas"].ToString ());
					btn.CanFocus = false;
					btn.UseUnderline = true;
					btn.Image = new Gtk.Image (string.Format ("{0}", cnfg.GetBaseImage(idioms["image_fileName"].ToString())));
					btn.Clicked	+= (object sender, EventArgs e) => {
						string idiom = ( (Gtk.Button) sender).Name;
						changeLanguajeConfiguration (idiom);
					};

					vbox.Add (btn);

					Gtk.Box.BoxChild boxchild = ((Gtk.Box.BoxChild)(vbox [btn]));
					boxchild.Position = !par ? 0 : 1;
					boxchild.Expand = false;
					boxchild.Fill = false;
					boxchild.PackType = PackType.Start;


					if (par) {
						hbox2.Add (vbox);
						Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(hbox2 [vbox]));
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

					hbox2.Add (vbox);
					Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(hbox2 [vbox]));
					w1.Expand = false;
					w1.Fill = false;
				}

				if (!idioms.IsClosed)
					idioms.Close ();
			}
		}

		public void eachItems(Gtk.Container container){
			foreach (Gtk.Widget item in container.AllChildren) 
			{ 
				if (item is Gtk.Container) eachItems (item as Gtk.Container);
				
				if (item is Gtk.Label) { 
					Gtk.Label lbl = item as Gtk.Label;
					if (lbl.Text.Equals ("[") || lbl.Text.Equals ("]")) {
						lbl.LabelProp = markup.make (string.Format ("{0}", lbl.Text), "black", null, "22000", "bold");
					} else {
						lbl.LabelProp = markup.make (string.Format ("{0}", lbl.Text), "black", null, "20000", "normal");
					}
					lbl.UseMarkup = true;
				} else if (item is Gtk.Image) {
					if (item.Name.Contains ("imghorizontalLine")) {
						Gtk.Image img = item as Gtk.Image;
						img.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("horizontalLine.png"));
					}
				}
			} 
		} 

		public void initLanguajeConfigurations(){
			this.configureIdiomsButtons ();

			lblfecha.Text = Culturize.GetString(1);
			lblhora.Text = Culturize.GetString(2);
			lblCajero.Text = Culturize.GetString(3);

			this.eachItems (this);

			lblAPagar.LabelProp = markup.make (Culturize.GetString (4), "red", null, "50000", "heavy");
			lblPorPagar.LabelProp = markup.make (Culturize.GetString (5), "black", null, "25000", "heavy");
			lblADevolver.LabelProp = markup.make (Culturize.GetString (6), "black", null, "25000", "heavy");

			lblAPagarData.LabelProp = markup.make ("000.00", "red", null, "50000", "heavy");
			lblSignoPesos.LabelProp = markup.make ("$", "red", null, "50000", "heavy");
			lbl21.LabelProp = markup.make ("[", "red", null, "65000", "heavy");;
			lbl24.LabelProp = markup.make ("]", "red", null, "65000", "heavy");
			lblPorPagarData.LabelProp = markup.make ("000.00", "black", null, "25000", "heavy");
			lblSignoPesos1.LabelProp = markup.make ("$", "black", null, "25000", "heavy");
			lblADevolverData.LabelProp = markup.make ("000.00", "black", null, "25000", "heavy");
			lblSignoPesos2.LabelProp = markup.make ("$", "black", null, "25000", "heavy");

			this.putDateTimeinLanguaje ();
		}

		public frmPayPanel () :base (Gtk.WindowType.Toplevel)
		{	
			this.Build ();
			this.Maximize ();

			this.configureBackgroundForm ();

			this.initLanguajeConfigurations ();


			hour = new Timer ();
			hour.Tick += new EventHandler (hour_Tick);
			hour.Interval = 1000;
			hour.Enabled = true;
			hour.Start ();

			imgLogo.Pixbuf = new Gdk.Pixbuf (cnfg.GetLogoImage);
			imgfecha.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage("date.png"));
			imghora.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage("clock.png"));
		}

		public void changeLanguajeConfiguration(string siglas){
			Culturize.changeLenguaje (siglas);
			MainClass.MainWin.initLanguajeConfigurations ();
			this.initLanguajeConfigurations ();
		}
	}
}


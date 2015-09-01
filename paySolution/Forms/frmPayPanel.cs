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

		private void configureBackgroundEntrys(){
			Gtk.Style style = new Style();
			style.FontDescription.Size = 28000;
			style.FontDescription.Weight = Pango.Weight.Heavy;

			entry1.ModifyFont (style.FontDescription);
			entry1.ModifyBase(StateType.Normal, new Gdk.Color(143,189,38));
		}

		void hour_Tick(object sender, EventArgs e){
			lblfechaData.LabelProp = markup.make(string.Format("{0:MM/dd/yyyy}",DateTime.Now),"red", null, "15000","bold");
			lblhoraData.LabelProp = markup.make(string.Format("{0:H:mm:ss}",DateTime.Now),"red", null, "15000","bold");
		}

		public void initLanguajeConfigurations(){
			lbl1.LabelProp = markup.make (string.Format("{0}",lbl1.LabelProp), "black", null,"23000","bold");
			lbl2.LabelProp = markup.make (string.Format("{0}",lbl2.LabelProp), "black", null,"23000","bold");
			lbl3.LabelProp = markup.make (string.Format("{0}",lbl3.LabelProp), "black", null,"23000","bold");
			lbl4.LabelProp = markup.make (string.Format("{0}",lbl4.LabelProp), "black", null,"23000","bold");

			lblfecha.LabelProp = markup.make (string.Format("{0}",Culturize.GetString(1)), "black", null,"15000","bold");
			lblhora.LabelProp = markup.make (string.Format("{0}",Culturize.GetString(2)), "black", null,"15000","bold");
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

		public frmPayPanel () :base (Gtk.WindowType.Toplevel)
		{	
			this.Build ();
			this.Maximize ();

			this.configureBackgroundForm ();
			this.configureBackgroundEntrys ();
			this.configureIdiomsButtons ();

			this.initLanguajeConfigurations ();


			hour = new Timer ();
			hour.Tick += new EventHandler (hour_Tick);
			hour.Interval = 1000;
			hour.Enabled = true;
			hour.Start ();

			imgLogo.Pixbuf = new Gdk.Pixbuf (cnfg.GetLogoImage);

			//btnEsp.Image = new Gtk.Image (cnfg.GetBaseImage("esp.png"));
			//btnEng.Image = new Gtk.Image (cnfg.GetBaseImage("eng.png"));
		}

		protected void OnBtnEngClicked (object sender, EventArgs e)
		{
			changeLanguajeConfiguration ("eng");
		}

		protected void OnBtnEspClicked (object sender, EventArgs e)
		{
			changeLanguajeConfiguration ("esp");
		}

		public void changeLanguajeConfiguration(string siglas){
			Culturize.changeLenguaje (siglas);
			MainClass.MainWin.initLanguajeConfigurations ();
			this.initLanguajeConfigurations ();
		}
	}
}


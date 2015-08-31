using System;
using Cairo;
using Gtk;
using System.Windows.Forms;
using System.Collections;

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


			hour = new Timer ();
			hour.Tick += new EventHandler (hour_Tick);
			hour.Interval = 1000;
			hour.Enabled = true;
			hour.Start ();

		}

		void hour_Tick(object sender, EventArgs e){
			lblfecha.LabelProp = markup.make(string.Format("{0}:{1}:{2}",DateTime.Now.Hour,DateTime.Now.Minute,DateTime.Now.Second),"red", null, "15000","bold");
		}

		public void changeLanguajeConfiguration(){
			MainClass.MainWin.initLanguajeConfigurations ();
			this.initLanguajeConfigurations ();
		}

		public void initLanguajeConfigurations(){
			lblFechaHora.LabelProp = markup.make (string.Format("{0}/{1}",Culturize.GetString(1),Culturize.GetString(2)), "black", null,"15000","bold");
		}


		public frmPayPanel () :base (Gtk.WindowType.Toplevel)
		{	
			this.Build ();
			this.Maximize ();

			this.configureBackgroundForm ();
			this.configureBackgroundEntrys ();

			this.initLanguajeConfigurations ();

			imgLogo.Pixbuf = new Gdk.Pixbuf (cnfg.GetLogoImage);

			btnEsp.Image = new Gtk.Image (cnfg.GetBaseImage("esp.png"));
			btnEng.Image = new Gtk.Image (cnfg.GetBaseImage("eng.png"));

		}

		protected void OnBtnEngClicked (object sender, EventArgs e)
		{
			MainClass.Languaje = cnfg.getConfiguration ("Languaje2");
			initLanguajeConfigurations ();
		}
	}
}


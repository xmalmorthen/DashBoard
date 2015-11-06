using System;
using Cairo;
using Gtk;
using System.Windows.Forms;
using System.Collections;
using MySql.Data.MySqlClient;
using System.Threading;
using Pango;

namespace paySolution
{
	public partial class frmPayPanel : Gtk.Window
	{

		protected void OnDeleteEvent (object sender, DeleteEventArgs a)
		{
			Gtk.Application.Quit ();
			a.RetVal = true;
		}

		private void configureBackgroundForm(){
			mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (cnfg.GetFormBackgroundImage(cnfg.getConfiguration("formPayBackground"))));
		}

		private void loadImages(){
			imgLogo.Pixbuf = new Gdk.Pixbuf (cnfg.GetLogoImage);
			imgMajor.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("major.png"));
		}

		private void putLabelBorders(){
			this.imghborder.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
		}


		private void changeFontType(){
			string[] fontType = new string[] { 
				"HelvLight",
				"Letter Gothic Std" 
			};

			lblCancel.ModifyFont (FontDescription.FromString (fontType[1]));
			lblRef.ModifyFont (FontDescription.FromString (fontType[1]));
		}

		private string[] color = new string[] { 
			"#fff",
			"#ff0000" 
		};
		private void putLabels(){
			lblCancel.LabelProp = markup.make (Culturize.GetString (26), color[0], null, "30000", "heavy");
		}

		public void populateDataLabels(){
			
		}

		public frmPayPanel () :base (Gtk.WindowType.Toplevel)
		{	
			this.FocusInEvent += new FocusInEventHandler (delegate(object o, FocusInEventArgs args) {
				this.configureBackgroundForm ();
			});

			this.Build ();

			#if !DEBUG
				this.Maximize ();
			#endif

			this.loadImages ();
			this.putLabelBorders ();
			this.changeFontType ();
			this.putLabels ();
		}

		public enum payType
		{
			ticket,
			pension
		}

		public void setIdPay(payType type, string data){			
			lblRef.LabelProp = markup.make (string.Format("{0} - {1}", (type == payType.pension ? Culturize.GetString (36) : Culturize.GetString (37)) ,data.Trim()), color[0], null, "20000", "heavy");
		}

	}
}


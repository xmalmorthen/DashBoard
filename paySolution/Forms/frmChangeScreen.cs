using System;
using Gtk;
using Pango;

namespace paySolution
{
	public partial class frmChangeScreen : Gtk.Window
	{
		protected void OnDeleteEvent (object sender, DeleteEventArgs a)
		{
			Gtk.Application.Quit ();
			a.RetVal = true;
		}

		private void configureBackgroundForm(){
			mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (cnfg.GetChangeImage));
		}

		private void loadImages(){
			imgMajor.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("major.png"));
		}

		private void changeFontType(){
			string[] fontType = new string[] { 
				"HelvLight",
				"Letter Gothic Std" 
			};

			lblNotification.ModifyFont (FontDescription.FromString (fontType[0]));
			lblPrint.ModifyFont (FontDescription.FromString (fontType[1]));
		}

		private string[] color = new string[] { 
			"#fff",
			"#ff0000"
		};
		private void putLabels(){
			lblNotification.LabelProp = markup.make (Culturize.GetString (35), color[1], null, "30000", "heavy");
			lblPrint.LabelProp = markup.make (Culturize.GetString (34), color[0], null, "30000", "heavy");
		}

		public frmChangeScreen () :
			base (Gtk.WindowType.Toplevel)
		{
			this.FocusInEvent += new FocusInEventHandler (delegate(object o, FocusInEventArgs args) {
				this.configureBackgroundForm ();

				lblNotification.Visible = payLogic.Status == payLogic.payStatus.withAmountPayedandReturnMoney;
			});

			this.Build ();

			Gdk.Color col = new Gdk.Color();
			Gdk.Color.Parse("#000", ref col);
			this.ModifyBg(Gtk.StateType.Normal, col);

			#if !DEBUG
			this.Maximize ();
			#endif

			this.loadImages ();
			this.changeFontType ();
			this.putLabels ();
		}
			
	}
}


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

			/*lblVence.ModifyFont (FontDescription.FromString (fontType[0]));
			lblRenovar.ModifyFont (FontDescription.FromString (fontType[0]));
			lblTotalPagar.ModifyFont (FontDescription.FromString (fontType[0]));
			lblVencera.ModifyFont (FontDescription.FromString (fontType[0]));

			lblDataVence.ModifyFont (FontDescription.FromString (fontType[0]));
			lblDataRenovar.ModifyFont (FontDescription.FromString (fontType[0]));
			lblDataTotalPago.ModifyFont (FontDescription.FromString (fontType[0]));
			lblDataPensionVencera.ModifyFont (FontDescription.FromString (fontType[0]));

			lblPlus.ModifyFont (FontDescription.FromString (fontType[1]));
			lblAcept.ModifyFont (FontDescription.FromString (fontType[1]));
			*/
		}

		private string[] color = new string[] { 
			"#fff",
			"#ff0000" 
		};
		private void putLabels(){
			lblCancel.LabelProp = markup.make (Culturize.GetString (26), color[0], null, "30000", "heavy");

			/*lblVence.LabelProp = markup.make (Culturize.GetString (27), color[0], null, "30000", "heavy");
			lblRenovar.LabelProp = markup.make (Culturize.GetString (28), color[0], null, "30000", "heavy");
			lblTotalPagar.LabelProp = markup.make (Culturize.GetString (29), color[0], null, "30000", "heavy");
			lblVencera.LabelProp = markup.make (Culturize.GetString (30), color[0], null, "30000", "heavy");*/
		}

		public void populateDataLabels(){
			/*lblDataVence.LabelProp = markup.make (renewBoard.PensionExpires.ToShortDateString (), color[0], null, "30000", "heavy");
			lblDataRenovar.LabelProp = markup.make (renewBoard.RenovateMonths.ToString(), color[0], null, "30000", "heavy");
			lblDataTotalPago.LabelProp = markup.make (string.Format("$ {0}",renewBoard.TotalPay.ToString()), color[0], null, "30000", "heavy");
			lblDataPensionVencera.LabelProp = markup.make (renewBoard.PensionWillExpires.ToShortDateString(), color[0], null, "30000", "heavy");*/
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

	}
}


using System;
using Gtk;
using Pango;

namespace paySolution
{
	public partial class frmWellcomePension : Gtk.Window
	{
		protected void OnDeleteEvent (object sender, DeleteEventArgs a)
		{
			Gtk.Application.Quit ();
			a.RetVal = true;
		}

		private void loadImages(){
			imgLogo.Pixbuf = new Gdk.Pixbuf (cnfg.GetLogoImage);

			imgMajor.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("major.png"));
			imgMajor1.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("major.png"));
			imgMajor2.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("major.png"));
		}

		private void changeFontType(){
			string[] fontType = new string[] { 
				"HelvLight",
				"Letter Gothic Std" 
			};
				
			lblPlus.ModifyFont (FontDescription.FromString (fontType[1]));
			lblAcept.ModifyFont (FontDescription.FromString (fontType[1]));
			lblCancel.ModifyFont (FontDescription.FromString (fontType[1]));

			lblWelcome.ModifyFont (FontDescription.FromString (fontType[1]));
			lblName.ModifyFont (FontDescription.FromString (fontType[1]));
		}

		private string[] color = new string[] { 
			"#fff",
			"#ff0000" 
		};
		private void putLabels(){
			lblPlus.LabelProp = markup.make ("+", color[0], null, "45000", "heavy");
			lblAcept.LabelProp = markup.make (Culturize.GetString (25), color[0], null, "30000", "heavy");
			lblCancel.LabelProp = markup.make (Culturize.GetString (26), color[0], null, "30000", "heavy");

			lblWelcome.LabelProp = markup.make (Culturize.GetString (31), color[0], null, "40000", "heavy");
		}

		private void populateDataLabels(){
			string Nombre;

			/*
			 * TODO: Logica para obtener la información
			 */ 
			Nombre = "XMAL MORTHEN";
			/*
			 *
			 */
			lblName.LabelProp = markup.make (Nombre, color[0], null, "30000", "heavy");
		}

		public frmWellcomePension () :
			base (Gtk.WindowType.Toplevel)
		{
			this.Build ();

			this.loadImages ();
			this.changeFontType ();
			this.putLabels ();
			this.populateDataLabels ();

		}
	}
}


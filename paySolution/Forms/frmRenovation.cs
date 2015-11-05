using System;
using Gtk;
using Pango;

namespace paySolution
{
	public partial class frmRenovation : Gtk.Window
	{

		private void configureBackgroundForm(){
			mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (cnfg.GetFormBackgroundImage(cnfg.getConfiguration("formMainBackground"))));
		}

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

			lblVence.ModifyFont (FontDescription.FromString (fontType[0]));
			lblRenovar.ModifyFont (FontDescription.FromString (fontType[0]));
			lblTotalPagar.ModifyFont (FontDescription.FromString (fontType[0]));
			lblVencera.ModifyFont (FontDescription.FromString (fontType[0]));

			lblDataVence.ModifyFont (FontDescription.FromString (fontType[0]));
			lblDataRenovar.ModifyFont (FontDescription.FromString (fontType[0]));
			lblDataTotalPago.ModifyFont (FontDescription.FromString (fontType[0]));
			lblDataPensionVencera.ModifyFont (FontDescription.FromString (fontType[0]));

			lblPlus.ModifyFont (FontDescription.FromString (fontType[1]));
			lblAcept.ModifyFont (FontDescription.FromString (fontType[1]));
			lblCancel.ModifyFont (FontDescription.FromString (fontType[1]));
		}

		private string[] color = new string[] { 
			"#fff",
			"#ff0000" 
		};
		private void putLabels(){
			lblPlus.LabelProp = markup.make ("+", color[0], null, "45000", "heavy");
			lblAcept.LabelProp = markup.make (Culturize.GetString (25), color[0], null, "30000", "heavy");
			lblCancel.LabelProp = markup.make (Culturize.GetString (26), color[0], null, "30000", "heavy");

			lblVence.LabelProp = markup.make (Culturize.GetString (27), color[0], null, "30000", "heavy");
			lblRenovar.LabelProp = markup.make (Culturize.GetString (28), color[0], null, "30000", "heavy");
			lblTotalPagar.LabelProp = markup.make (Culturize.GetString (29), color[0], null, "30000", "heavy");
			lblVencera.LabelProp = markup.make (Culturize.GetString (30), color[0], null, "30000", "heavy");
		}

		public void populateDataLabels(){
			lblDataVence.LabelProp = markup.make (renewBoard.PensionExpires.ToShortDateString (), color[0], null, "30000", "heavy");
			lblDataRenovar.LabelProp = markup.make (renewBoard.RenovateMonths.ToString(), color[0], null, "30000", "heavy");
			lblDataTotalPago.LabelProp = markup.make (string.Format("$ {0}",renewBoard.TotalPay.ToString()), color[0], null, "30000", "heavy");
			lblDataPensionVencera.LabelProp = markup.make (renewBoard.PensionWillExpires.ToShortDateString(), color[0], null, "30000", "heavy");
		}

		private void putLabelBorders(){
			this.imghborder1.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder2.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder3.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder4.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder5.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder6.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder7.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder8.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imgvborder1.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder2.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder3.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder4.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder5.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder6.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder7.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder8.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
		}

		public frmRenovation () :
			base (Gtk.WindowType.Toplevel)
		{
			this.FocusInEvent += new FocusInEventHandler (delegate(object o, FocusInEventArgs args) {
				this.configureBackgroundForm ();
			});

			this.Build ();

			#if !DEBUG
			this.Maximize ();
			#endif

			this.loadImages ();
			this.changeFontType ();
			this.putLabels ();
			this.populateDataLabels ();
			this.putLabelBorders ();
		}

		protected void OnButton1Clicked (object sender, EventArgs e)
		{
			string dataReceived = "+";
			payLogic.LogicFlow ("COM1", dataReceived);
		}

		protected void OnButton3Clicked (object sender, EventArgs e)
		{
			string dataReceived = "A";
			payLogic.LogicFlow ("COM1", dataReceived);
		}

		protected void OnButton4Clicked (object sender, EventArgs e)
		{
			string dataReceived = "C";
			payLogic.LogicFlow ("COM1", dataReceived);
		}
	}
}


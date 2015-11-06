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
			this.tick.Stop ();
			this.tick.Enabled = false;
			this.tick.Dispose ();
			this.tick = null;

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
			lblRef.ModifyFont (FontDescription.FromString (fontType[0]));
			lblTotal.ModifyFont (FontDescription.FromString (fontType[0]));
			lblTotalPlus.ModifyFont (FontDescription.FromString (fontType[0]));
			lblPagado.ModifyFont (FontDescription.FromString (fontType[0]));
			lblChange.ModifyFont (FontDescription.FromString (fontType[0]));
			lblIngreso.ModifyFont (FontDescription.FromString (fontType[0]));
			lblSalida.ModifyFont (FontDescription.FromString (fontType[0]));
			lblEstancia.ModifyFont (FontDescription.FromString (fontType[0]));
		}

		private string[] color = new string[] { 
			"#fff",
			"#ff0000" 
		};
		private void putLabels(){
			lblCancel.LabelProp = markup.make (Culturize.GetString (26), color[0], null, "30000", "heavy");
			lblDate.LabelProp = markup.make (DateTime.Now.ToString("D"), color[0], null, "25000", "heavy");
		}

		private System.Windows.Forms.Timer tick = new System.Windows.Forms.Timer();
		private void init(){
			tick.Interval = 1000;
			tick.Enabled = true;
			tick.Tick += new EventHandler ((object sender, EventArgs e) => {
				Gtk.Application.Invoke( delegate {
					lblTime.LabelProp = markup.make (DateTime.Now.ToString("hh:mm:ss tt"), color[0], null, "30000", "heavy");
				});
			});
			tick.Start ();
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
			this.init();
		}



		public void populateDataLabels(payLogic.paytype type){
			vbox5.Visible = type == payLogic.paytype.ticket;

			lblRef.LabelProp = markup.make (string.Format("{0} - {1}", (type == payLogic.paytype.pension ? Culturize.GetString (36) : Culturize.GetString (37)) ,(type == payLogic.paytype.pension ? renewBoard.PensionID : ticket.TicketId)), color[0], null, "20000", "heavy");

			lblTotal.LabelProp = markup.make (string.Format("$ {0}",payLogic.ToPay.ToString()), color[0], null, "60000", "heavy");
			lblTotalPlus.LabelProp = markup.make (string.Format("$ {0}",payLogic.ToPay.ToString()), color[0], null, "83000", "heavy");
			lblPagado.LabelProp = markup.make (string.Format("$ {0}",payLogic.Payable.ToString()), color[0], null, "40000", "heavy");
			lblChange.LabelProp = markup.make (string.Format("$ {0}",payLogic.ToReturn.ToString()), color[0], null, "50000", "heavy");

			switch (type) {
				case payLogic.paytype.ticket:
					lblIngreso.LabelProp = markup.make (ticket.Entry.ToString("hh:mm:ss tt"), color[0], null, "30000", "heavy");
					lblSalida.LabelProp = markup.make (ticket.Exit.ToString("hh:mm:ss tt"), color[0], null, "30000", "heavy");
					lblEstancia.LabelProp = markup.make (string.Format("{0} hr(s).",ticket.Stay), color[0], null, "30000", "heavy");
				break;
			}

		}

		protected void OnButton1Clicked (object sender, EventArgs e)
		{
			payLogic.LogicFlow ("COM2", "Z");
		}

		protected void OnButton2Clicked (object sender, EventArgs e)
		{
			payLogic.LogicFlow ("COM1", "cc");
		}

	}
}


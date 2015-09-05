using System;
using System.Windows.Forms;
using Gtk;

namespace paySolution
{
	public partial class frmNotificationsWin : Gtk.Window
	{
		Timer close,languaje;

		private void configureBackgroundForm(){
			mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (cnfg.GetFormBackgroundImage));
		}
			
		public frmNotificationsWin (Window parent_window, MessageType messageType,string  message, EventHandler OnDestroyedEvent = null, int? closeInterval = null) :
			base (Gtk.WindowType.Toplevel)
		{
			string imagePath = cnfg.GetBaseImage ("view");

			this.Build ();

			this.Destroyed += OnDestroyedEvent;

			this.configureBackgroundForm ();

			this.KeepAbove = true;
			this.TypeHint = Gdk.WindowTypeHint.Dialog;

			this.imghborder1.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imghborder2.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderHorizontal.png"));
			this.imgvborder1.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));
			this.imgvborder2.Pixbuf = new Gdk.Pixbuf (cnfg.GetBaseImage ("borderVertical.png"));

			//this.ParentWindow = parent_window as Gdk.Window;

			switch (messageType) {
			case MessageType.Info:
				imagePath = cnfg.GetBaseImage ("info");
				break;
			case MessageType.Warning:
				imagePath = cnfg.GetBaseImage ("warning");
				break;
			case MessageType.Question:
				imagePath = cnfg.GetBaseImage ("question");
				break;
			case MessageType.Error:
				imagePath = cnfg.GetBaseImage ("error");
				break;
			case MessageType.Other:
				imagePath = cnfg.GetBaseImage ("other");
				break;
			}	

			imgNotification.Pixbuf = new Gdk.Pixbuf (string.Format("{0}{1}",imagePath,".png"));
			imgNotification.CanFocus = false;
			imgNotification.Visible = true;

			lblNotification.LabelProp = markup.make (message, "black", null, "30000", "heavy");
			lblNotification.CanFocus =false;
			lblNotification.Visible = true;

			close = new Timer ();
			close.Tick += new EventHandler (close_Tick);

			if (closeInterval == null) closeInterval = int.Parse(cnfg.getConfiguration("autoCloseDialogTime"));

			close.Interval = (int)closeInterval;
			close.Enabled = true;
			close.Start ();

			languajeInit = MainClass.Languaje;

			languaje = new Timer ();
			languaje.Tick += new EventHandler (languaje_Tick);
			languaje.Interval = 500;
			languaje.Enabled = true;
			languaje.Start ();

		}

		void close_Tick(object sender, EventArgs e){
			languaje.Stop ();
			languaje.Dispose ();

			close.Stop ();
			this.Destroy ();

			close.Dispose ();
		}

		string languajeInit;
		void languaje_Tick(object sender, EventArgs e){
			if (languajeInit != MainClass.Languaje) {
				languajeInit = MainClass.Languaje;
				lblNotification.LabelProp = markup.make (resourseMessages.exitMessage, "black", null, "30000", "heavy");
			}
		}

	}
}
using System;
using Gtk;
using System.Threading;

namespace paySolution
{
	public partial class frmPublicity : Gtk.Window
	{
		public frmPublicity () :
			base (Gtk.WindowType.Toplevel)
		{
			this.Build ();

			Gdk.Color col = new Gdk.Color();
			Gdk.Color.Parse("#000", ref col);
			this.ModifyBg(Gtk.StateType.Normal, col);

			#if !DEBUG
				this.Maximize ();
			#endif

			imgPublicity.Pixbuf = new Gdk.Pixbuf (cnfg.GetPublicityImage);
		}

		protected void OnDeleteEvent (object sender, DeleteEventArgs a)
		{
			Gtk.Application.Quit ();
			a.RetVal = true;
		}
	}
}


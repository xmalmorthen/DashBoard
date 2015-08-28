using System;

namespace paySolution
{
	public partial class frmPayPanel : Gtk.Window
	{
		public frmPayPanel () :base (Gtk.WindowType.Toplevel)
		{
			this.Shown  += new EventHandler (this.OnShown); 
			this.Build ();
		}

		protected void OnShown (object sender, System.EventArgs e) 
		{ 
			this.Maximize ();
		} 

	}
}


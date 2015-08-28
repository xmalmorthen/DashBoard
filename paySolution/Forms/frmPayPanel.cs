using System;

namespace paySolution
{
	public partial class frmPayPanel : Gtk.Window
	{
		private Boolean isShow = false;

		public frmPayPanel () :base (Gtk.WindowType.Toplevel)
		{	
			if (!isShow) this.Shown  += new EventHandler (this.OnShown); 
			this.Build ();
		}

		protected void OnShown (object sender, System.EventArgs e) 
		{ 
			if (!isShow) {				
				isShow = true;
				this.Shown  -= this.OnShown; 
				this.Maximize ();
			}
		} 

	}
}


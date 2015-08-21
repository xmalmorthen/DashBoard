using System;

namespace inSolution
{
	public partial class AutoConectPorts : Gtk.Dialog
	{
		public AutoConectPorts ()
		{
			this.Build ();
		}

		protected void OnButtonOkClicked (object sender, EventArgs e)
		{
			this.Respond (Gtk.ResponseType.Accept);
		}

		protected void OnButtonCancelClicked (object sender, EventArgs e)
		{
			this.Respond (Gtk.ResponseType.Cancel);
		}
	}
}


using System;
using MySql.Data.MySqlClient;
using Gtk;

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

		protected void OnBtnInsertClicked (object sender, EventArgs e)
		{
			MySqlDataReader response = DataBase.CallSp("Insert_AutoConectPort",new string[] { txtPuerto.Text, txtDesc.Text});
			if (response == null) {
				MessageDialog dlg = new MessageDialog (this, 
					DialogFlags.DestroyWithParent, 
					MessageType.Error, 
					ButtonsType.Ok, 
					string.Format ("Ocurrió un error al intentar guardar las configuraciones, favor de interntarlo de nuevo!!!"));
			}
			response.Close ();
		}
	}
}


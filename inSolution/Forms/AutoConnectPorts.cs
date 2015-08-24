using System;
using Gtk;
using MySql.Data.MySqlClient;

namespace inSolution
{
	public partial class AutoConnectPorts : Gtk.Window
	{
		protected void OnDeleteEvent (object sender, DeleteEventArgs a)
		{
			Application.Quit ();
			a.RetVal = true;
		}

		public AutoConnectPorts () : base (Gtk.WindowType.Toplevel)
		{
			this.Build ();

			this.tablePortInit ();
			tblData.CursorChanged += ontblPortsCursorChanged;
		}

		private void tablePortInit(){
			tblData.AppendColumn ("Puerto", new CellRendererText (), "text", 0);
			tblData.AppendColumn ("Alias", new CellRendererText (), "text", 1);
			tblData.AppendColumn ("Descripción", new CellRendererText (), "text", 2);
			tblData.AppendColumn ("Fecha Inserción", new CellRendererText (), "text", 3);
			tblData.AppendColumn ("Fecha Actualización", new CellRendererText (), "text", 4);
			tblData.Model = AutoConnectPrtsModel.getModel ();
		}

		TreeIter iterSelected;
		protected void ontblPortsCursorChanged(object sender, EventArgs e){
			TreeSelection selection = (sender as TreeView).Selection;

			TreeModel model;
			Boolean selected = false;
			if (selection.GetSelected (out model, out iterSelected)) {
				txtPuerto.Text = model.GetValue (iterSelected, 0).ToString ();
				txtalias.Text = model.GetValue (iterSelected, 1).ToString ();
				txtDesc.Text = model.GetValue (iterSelected, 2).ToString ();
				selected = true;
				ChangeFormMode (FormMode.Edit);
				txtalias.GrabFocus ();
			}
		}
			
		protected void OnButtonOkClicked (object sender, EventArgs e)
		{
			this.Destroy ();
		}

		protected void OnBtnInsertClicked (object sender, EventArgs e)
		{
			Boolean isValid = true;

			if (string.IsNullOrEmpty (txtPuerto.Text)) {
				MessageDialog dlg = new MessageDialog (this, 
					DialogFlags.DestroyWithParent, 
					MessageType.Error, 
					ButtonsType.Ok, 
					string.Format ("Falta indicar el puerto"));
				dlg.Run ();
				dlg.Destroy ();
				txtPuerto.GrabFocus ();
				isValid = false;
			}

			if (isValid) {
				if (AutoConnectPrtsModel.addItem(new string[] { txtPuerto.Text, txtalias.Text, txtDesc.Text })) {
					MessageDialog dlg = new MessageDialog (this, 
						                    DialogFlags.DestroyWithParent, 
						                    MessageType.Error, 
						                    ButtonsType.Ok, 
						                    string.Format ("Ocurrió un error al intentar guardar las configuraciones, favor de interntarlo de nuevo"));
					dlg.Run ();
					dlg.Destroy ();
				} else {					
					CleanForm ();
					tblData.Model = AutoConnectPrtsModel.getModel ();
				}
			}
		}

		protected void OnBtnClearClicked (object sender, EventArgs e)
		{
			MessageDialog dlg = new MessageDialog (this, 
				DialogFlags.DestroyWithParent, 
				MessageType.Question, 
				ButtonsType.YesNo, 
				string.Format ("Limpiar formulario"));
			ResponseType response = (ResponseType) dlg.Run ();
			dlg.Destroy ();
			if (response == ResponseType.Yes) {
				this.CleanForm ();
				txtPuerto.GrabFocus ();

			}
		}

		private void CleanForm(){
			txtPuerto.Text = string.Empty;
			txtalias.Text = string.Empty;
			txtDesc.Text = string.Empty;
			ChangeFormMode (FormMode.Append);
		}
			
		private enum FormMode
		{
			Append,
			Edit
		};

		private void ChangeFormMode(FormMode formMode){
			txtPuerto.Sensitive = ( formMode == FormMode.Append || formMode == FormMode.Edit);
			txtalias.Sensitive = (formMode == FormMode.Append || formMode == FormMode.Edit);
			txtPuerto.Sensitive = (formMode == FormMode.Append);

			btnEdit.Visible = ( formMode == FormMode.Edit);
			btnInsert.Visible = ( formMode == FormMode.Append);
		}

		protected void OnBtnEditClicked (object sender, EventArgs e)
		{
			if (!AutoConnectPrtsModel.editItem(new string[] { txtalias.Text, txtDesc.Text })) {
				MessageDialog dlg = new MessageDialog (this, 
					DialogFlags.DestroyWithParent, 
					MessageType.Error, 
					ButtonsType.Ok, 
					string.Format ("Ocurrió un error al intentar editar las configuraciones, favor de interntarlo de nuevo"));
				dlg.Run ();
				dlg.Destroy ();
			} else {					
				CleanForm ();
				tblData.Model = AutoConnectPrtsModel.getModel ();
			}
		}

	}
}


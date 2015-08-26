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

			hpaned2.Position = 416;

			this.tablePortInit ();
			tblData.CursorChanged += ontblPortsCursorChanged;
		}

		private void tablePortInit(){
			tblData.AppendColumn ("Puerto", new CellRendererText (), "text", 0);
			tblData.AppendColumn ("Alias", new CellRendererText (), "text", 1);
			tblData.AppendColumn ("Descripción", new CellRendererText (), "text", 2);
			tblData.AppendColumn ("Baud Rate", new CellRendererText (), "text", 3);
			tblData.AppendColumn ("Parity", new CellRendererText (), "text", 4);
			tblData.AppendColumn ("Data Bits", new CellRendererText (), "text", 5);
			tblData.AppendColumn ("Stop Bits", new CellRendererText (), "text", 6);
			tblData.Model = AutoConnectPrtsModel.getModel ();
		}

		TreeIter iterSelected;
		protected void ontblPortsCursorChanged(object sender, EventArgs e){
			TreeSelection selection = (sender as TreeView).Selection;

			TreeModel model;
			if (selection.GetSelected (out model, out iterSelected)) {
				txtPuerto.Text = model.GetValue (iterSelected, 0).ToString ();
				txtalias.Text = model.GetValue (iterSelected, 1).ToString ();
				txtDesc.Text = model.GetValue (iterSelected, 2).ToString ();

				string baudRate = model.GetValue (iterSelected, 3).ToString ();
				string parity = model.GetValue (iterSelected, 4).ToString ();
				string databits = model.GetValue (iterSelected, 5).ToString ();
				string stopbits = model.GetValue (iterSelected, 6).ToString ();

				this.SelIterCmb (cmbBaudRate, baudRate);
				this.SelIterCmb (cmbParity,parity);
				this.SelIterCmb (cmbDatabits, databits);
				this.SelIterCmb (cmbStopbits, stopbits);

				ChangeFormMode (FormMode.Edit);
				txtalias.GrabFocus ();
			}
		}

		private void SelIterCmb(ComboBoxEntry cmb, string itemtoselect){
			Boolean isSelected = false;
			TreeIter cmbiter;
			cmb.Model.GetIterFirst (out cmbiter);
			do {
				GLib.Value value = new GLib.Value();
				cmb.Model.GetValue(cmbiter,0,ref value);
				if ((value.Val as string).Equals(itemtoselect, StringComparison.CurrentCultureIgnoreCase)){
					cmb.SetActiveIter(cmbiter);
					isSelected = true;
				}
			} while (cmb.Model.IterNext(ref cmbiter));
			if (!isSelected) {
				cmb.AppendText (itemtoselect);
				this.SelIterCmb (cmb, itemtoselect);
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
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Falta indicar el puerto"));
				txtPuerto.GrabFocus ();
				isValid = false;
			}

			string baudRate = cmbBaudRate.ActiveText.ToString ();
			string parity = cmbParity.ActiveText.ToString ();
			string databits = cmbDatabits.ActiveText.ToString ();
			string stopbits = cmbStopbits.ActiveText.ToString ();

			if (string.IsNullOrEmpty (baudRate)) {
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Faltan datos"));
				cmbBaudRate.GrabFocus ();
				isValid = false;
				return;
			}
			if (string.IsNullOrEmpty (parity)) {
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Faltan datos"));
				cmbParity.GrabFocus ();
				isValid = false;
				return;
			}
			if (string.IsNullOrEmpty (databits)) {
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Faltan datos"));
				cmbDatabits.GrabFocus ();
				isValid = false;
				return;
			}
			if (string.IsNullOrEmpty (stopbits)) {
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Faltan datos"));
				cmbStopbits.GrabFocus ();
				isValid = false;
				return;
			}

			if (isValid) {
				if (!AutoConnectPrtsModel.addItem(new string[] { txtPuerto.Text, txtalias.Text, txtDesc.Text, baudRate, parity, databits, stopbits })) {
					dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al intentar guardar las configuraciones, favor de interntarlo de nuevo"));
				} else {					
					CleanForm ();
					tblData.Model = AutoConnectPrtsModel.getModel ();
				}
			}
		}

		protected void OnBtnClearClicked (object sender, EventArgs e)
		{
			if (dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Question, ButtonsType.YesNo, string.Format ("Limpiar formulario")) == ResponseType.Yes) {
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
			string baudRate = cmbBaudRate.ActiveText.ToString ();
			string parity = cmbParity.ActiveText.ToString ();
			string databits = cmbDatabits.ActiveText.ToString ();
			string stopbits = cmbStopbits.ActiveText.ToString ();

			if (!AutoConnectPrtsModel.editItem(new string[] { tblData.Model.GetValue (iterSelected, 7).ToString (),txtalias.Text, txtDesc.Text, baudRate, parity, databits, stopbits  })) {
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al intentar editar las configuraciones, favor de interntarlo de nuevo"));
			} else {					
				CleanForm ();
				tblData.Model = AutoConnectPrtsModel.getModel ();
			}
		}

		protected void OnBtnDeleteClicked (object sender, EventArgs e)
		{			
			string id = null;
			try {
				id = tblData.Model.GetValue (iterSelected, 7).ToString();
			} catch (Exception) {}
			if (string.IsNullOrEmpty (id)) {
				dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Info, ButtonsType.Ok, string.Format ("Falta seleccionar el registro a eliminar"));
			} else {
				if (dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Question, ButtonsType.YesNo, "Confirmar la eliminación del registro") == ResponseType.Yes) {
					if (!AutoConnectPrtsModel.deleteItem (id)) {
						dlg.show (this, DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al intentar eliminar la configuracion, favor de interntarlo de nuevo"));
					} else {					
						CleanForm ();
						tblData.Model = AutoConnectPrtsModel.getModel ();
					}	
				}
			}
		}
	}
}


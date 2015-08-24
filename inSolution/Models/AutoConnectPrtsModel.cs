using System;
using Gtk;
using Gdk;
using MySql.Data.MySqlClient;

namespace inSolution
{
	public static class AutoConnectPrtsModel
	{
		private static Gtk.ListStore store = new Gtk.ListStore (typeof (string),typeof (string),typeof (string),typeof (string),typeof (string),typeof (string));

		private static void dataBaseData(){
			store.Clear ();
			MySqlDataReader data = DataBase.CallSp ("pa_get_AutoConnectPorts");
			while (data.Read())
			{
				store.AppendValues (data ["portname"].ToString (),
									data ["alias"].ToString (),
									data ["description"].ToString (),
									data ["fechahora_ins"].ToString (),
									data ["fechahora_act"].ToString (),
									data ["id"].ToString ());				
			}
			if (!data.IsClosed) data.Close();
		}

		public static Gtk.ListStore getModel(){
			dataBaseData();
			return store;
		}

		public static Boolean addItem(string[] parameters = null){
			Boolean result = false;
			try {
				DataBase.CallSp ("pa_insert_AutoConectPort", parameters);
				result = true;
			} catch (Exception) {
				result = false;
			}
			return result;
		}

		public static Boolean editItem(string[] parameters = null){
			Boolean result = false;
			try {
				DataBase.CallSp ("pa_edit_AutoConectPort", parameters);

				result = true;
			} catch (Exception) {
				result = false;
			}
			return result;
		}

	}
}


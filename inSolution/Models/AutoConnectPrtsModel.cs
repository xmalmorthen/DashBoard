using System;
using Gtk;
using Gdk;
using MySql.Data.MySqlClient;

namespace inSolution
{
	public static class AutoConnectPrtsModel
	{
		private static Gtk.ListStore store = new Gtk.ListStore (typeof (string),typeof (string),typeof (string),typeof (string),typeof (string),typeof (string),typeof (string),typeof (string));

		private static void dataBaseData(){
			store.Clear ();
			MySqlDataReader data = DataBase.CallSp ("pa_get_AutoConnectPorts");
			if (data != null){
				while (data.Read ()) {
					store.AppendValues (data ["portname"].ToString (),
						data ["alias"].ToString (),
						data ["description"].ToString (),
						data ["baudrate"].ToString (),
						data ["parity"].ToString (),
						data ["dataBits"].ToString (),
						data ["stopBits"].ToString (),
						data ["id"].ToString ());				
				}
				if (!data.IsClosed)
					data.Close ();
			}
		}

		public static Gtk.ListStore getModel(){
			dataBaseData();
			return store;
		}

		public static Boolean addItem(string[] parameters = null){
			Boolean result = false;
			try {
				MySqlDataReader response = DataBase.CallSp ("pa_insert_AutoConnectPort", parameters);
				if (response != null){
					response.Close();	
					result = true;
				}
			} catch (Exception) {
				result = false;
			}
			return result;
		}

		public static Boolean editItem(string[] parameters = null){
			Boolean result = false;
			try {
				MySqlDataReader response = DataBase.CallSp ("pa_edit_AutoConnectPort", parameters);
				if (response != null){
					response.Close();	
					result = true;
				}
			} catch (Exception) {
				result = false;
			}
			return result;
		}

		public static Boolean deleteItem(string id){
			Boolean result = false;
			try {
				MySqlDataReader response = DataBase.CallSp ("pa_delete_AutoConnectPort", new string[] {id});
				if (response != null){
					response.Close();	
					result = true;
				}
			} catch (Exception) {
				result = false;
			}
			return result;
		}

	}
}


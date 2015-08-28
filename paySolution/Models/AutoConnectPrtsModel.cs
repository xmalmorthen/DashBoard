using System;
using Gtk;
using Gdk;
using MySql.Data.MySqlClient;
using paySolution;

namespace paySolution
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

	}
}


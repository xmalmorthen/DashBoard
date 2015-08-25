using System;
using Gtk;

namespace inSolution
{
	public static class BitacoraModel
	{
		private static Gtk.ListStore store = new Gtk.ListStore (typeof (string),typeof (string),typeof (string),typeof (string),typeof (string),typeof (string));
		private static Gtk.ListStore Store {
			get {
				return store;
			}
			set {
				store = value;
			}
		}

		public static Boolean addItem(string accion, string mensaje, string detalle = "", string status = "OK"){
			Boolean result = false;
			try {
				DateTime dt = DateTime.Now;
				Store.AppendValues (accion,mensaje,dt.ToShortTimeString(),dt.ToShortDateString(),detalle,status);
				globalClasses.DataBase.CallSp("pa_insert_tbl_bitacora",new string[] { accion,mensaje,detalle,status}).Close();
				result = true;
			} catch (Exception) {
				result = false;
			}
			return result;
		}

		public static Gtk.ListStore getModel(){
			return Store;
		}

		public static Boolean clearModel(){
			Boolean result = false;
			try {
				Store.Clear ();	
				result = true;
			} catch (Exception) {
				result = false;
			}
			return result;
		}
	}
}


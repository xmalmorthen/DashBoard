using System;
using Gtk;
using Gdk;

namespace inSolution
{
	public static class PortsModel
	{
		private static Gtk.ListStore store = new Gtk.ListStore (typeof (string),typeof (Gdk.Pixbuf),typeof (string));
		private static Gtk.ListStore Store {
			get {
				return store;
			}
			set {
				store = value;
			}
		}

		public static Boolean addItem(string port, Gdk.Pixbuf iconPath, string status){
			Boolean result = false;
			try {
				Store.AppendValues (port,iconPath,status);
				result = true;
			} catch (Exception) {
				result = false;
			}
			return result;
		}

		public static Boolean editItem(TreeIter iterSelected, Pixbuf icon, string description){
			Boolean result = false;
			try {
				Store.SetValue (iterSelected, 1, icon);
				Store.SetValue (iterSelected, 2, description);
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


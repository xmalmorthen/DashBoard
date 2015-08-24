using System;
using Gtk;
using NLog.Internal;

namespace inSolution
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Application.Init ();

			ConfigurationManager cnfg = new ConfigurationManager ();

			Boolean isDatabaseOpened = DataBase.Open (cnfg.AppSettings ["server"],
											  		  cnfg.AppSettings ["database"],
													  cnfg.AppSettings ["usr"],
													  cnfg.AppSettings ["pwd"]);
			if (!isDatabaseOpened) {
				MessageDialog dlg = new MessageDialog (null,
					                    DialogFlags.DestroyWithParent, 
					                    MessageType.Error, 
					                    ButtonsType.Ok, 
					                    string.Format ("Ocurrió un error al intentar abrir la base de datos Servidor: {0}, Base de datos: {1}", cnfg.AppSettings ["server"], cnfg.AppSettings ["database"]));
				dlg.Run ();
				dlg.Destroy ();
			} else {
				MainWindow win = new MainWindow ();
				win.Show ();
				Application.Run ();

				DataBase.Close ();
			}
		}
	}
}

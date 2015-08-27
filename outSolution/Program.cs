using System;
using Gtk;
using NLog.Internal;
using NLog;

namespace outSolution
{
	class MainClass
	{
		private static ConfigurationManager cnfg;

		public static string Id_application {
			get {
				return  cnfg.AppSettings ["id_application"];
			}
		}


		public static void Main (string[] args)
		{
			Application.Init ();

			cnfg = new ConfigurationManager ();

			Boolean isDatabaseOpened = DataBase.Open (cnfg.AppSettings ["server"],
											  		  cnfg.AppSettings ["database"],
													  cnfg.AppSettings ["usr"],
													  cnfg.AppSettings ["pwd"]);
			if (!isDatabaseOpened) {
				dlg.show (null,DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al intentar abrir la base de datos Servidor: {0}, Base de datos: {1}", cnfg.AppSettings ["server"], cnfg.AppSettings ["database"]));
			} else {
				MainWindow win = new MainWindow ();
				win.Show ();
				Application.Run ();

				DataBase.Close ();
			}
		}
	}
}

using System;
using Gtk;
using NLog.Internal;
using NLog;

namespace paySolution
{
	class MainClass
	{
		public static string imagesPath;

		public static ConfigurationManager cnfg;

		public static string Id_application {
			get {
				return  cnfg.AppSettings ["id_application"];
			}
		}

		public static void Main (string[] args)
		{
			Application.Init ();

			cnfg = new ConfigurationManager ();

			MainClass.imagesPath = System.IO.Path.Combine (AppDomain.CurrentDomain.BaseDirectory, @cnfg.AppSettings ["imagesPath"]);

			Boolean isDatabaseOpened = DataBase.Open (cnfg.AppSettings ["server"],
				cnfg.AppSettings ["database"],
				cnfg.AppSettings ["usr"],
				cnfg.AppSettings ["pwd"]);
			if (!isDatabaseOpened) {
				dlg.show (null,DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al intentar abrir la base de datos Servidor: {0}, Base de datos: {1}", cnfg.AppSettings ["server"], cnfg.AppSettings ["database"]));
			} else {
				loadPanels ();

				string messageResponse;
				if (MainWin.AutoConnectPorts (out messageResponse)){					
					MainWin.Show ();
					Application.Run ();
				} else {
					unloadPanels ();
					dlg.show (null,DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un problema al intentar conectar al/los puerto(s) [ {0} ]",messageResponse));
				}
				DataBase.Close ();
			}
		}


		public static MainWindow MainWin;
		public static frmPayPanel FrmPayPanel;

		private static void loadPanels(){
			FrmPayPanel = new frmPayPanel ();
			FrmPayPanel.Hide ();
			MainWin = new MainWindow ();
			MainWin.Hide ();
		}

		private static void unloadPanels(){
			FrmPayPanel.Destroy ();
			MainWin.Destroy ();
		}


	}
}

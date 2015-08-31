using System;
using Gtk;
using NLog.Internal;
using NLog;

namespace paySolution
{
	class MainClass
	{
		private static string languaje;
		public static string Languaje {
			get {
				return languaje;
			}
			set {
				languaje = value;
			}
		}

		public static void Main (string[] args)
		{
			Application.Init ();

			Languaje = cnfg.DefaultLanguaje;

			Boolean isDatabaseOpened = DataBase.Open ( cnfg.getConfiguration("server"),
													   cnfg.getConfiguration("database"),
													   cnfg.getConfiguration("usr"),
													   cnfg.getConfiguration("pwd"));
			if (!isDatabaseOpened) {
				dlg.show (null,DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al intentar abrir la base de datos Servidor: {0}, Base de datos: {1}", cnfg.getConfiguration("server"), cnfg.getConfiguration("database")));
			} else {
				loadPanels ();

				string messageResponse;
				if (MainWin.AutoConnectPorts (out messageResponse)){					
					MainWin.Show ();
					Application.Run ();
				} else {
					//unloadPanels ();
					//dlg.show (null,DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un problema al intentar conectar al/los puerto(s) [ {0} ]",messageResponse));
				}

				MainWin.Show ();
				Application.Run ();

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

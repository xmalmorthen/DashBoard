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

			Boolean isDatabaseOpened = DataBase.Open ( cnfg.getConfiguration("server"),
													   cnfg.getConfiguration("database"),
													   cnfg.getConfiguration("usr"),
													   cnfg.getConfiguration("pwd"));
			if (!isDatabaseOpened) {
				dlg.show (null,DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un error al intentar abrir la base de datos Servidor: {0}, Base de datos: {1}", cnfg.getConfiguration("server"), cnfg.getConfiguration("database")));
			} else {
				Languaje = cnfg.DefaultLanguaje;

				loadPanels ();

				string messageResponse;
				if (MainWin.AutoConnectPorts (out messageResponse)){					
					MainWin.Visible = true;
					Application.Run ();
				} else {
					dlg.show (null,DialogFlags.DestroyWithParent, MessageType.Error, ButtonsType.Ok, string.Format ("Ocurrió un problema al intentar conectar al/los puerto(s) [ {0} ]",messageResponse));
					unloadPanels ();
				}

				DataBase.Close ();
			}
		}


		public static MainWindow MainWin;
		public static frmPayPanel FrmPayPanel;
		public static frmPublicity FrmPublicity;
		public static frmRenovation FrmRenovation;
		public static frmChangeScreen FrmChangeScreen;

		private static void loadPanels(){
			FrmPublicity = new frmPublicity ();
			FrmPublicity.Visible = false;

			FrmRenovation = new frmRenovation ();
			FrmRenovation.Visible = false;

			FrmChangeScreen = new frmChangeScreen ();
			FrmChangeScreen.Visible = false;

			FrmPayPanel = new frmPayPanel ();
			FrmPayPanel.Visible = false;

			MainWin = new MainWindow ();
			MainWin.Visible = false;

			payLogic.Status = payLogic.payStatus.insertTicket;
		}

		private static void unloadPanels(){
			FrmPublicity.Destroy ();
			FrmRenovation.Destroy ();
			FrmChangeScreen.Destroy ();
			FrmPayPanel.Destroy ();
			MainWin.Destroy ();
		}
			
	}
}

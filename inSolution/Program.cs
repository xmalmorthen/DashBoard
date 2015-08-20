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
			DataBase.Open (cnfg.AppSettings ["server"],
				cnfg.AppSettings ["database"],
				cnfg.AppSettings ["usr"],
				cnfg.AppSettings ["pwd"]);

			MainWindow win = new MainWindow ();
			win.Show ();
			Application.Run ();

			DataBase.Close ();
		}
	}
}

using System;
using Gtk;
using MySql.Data.MySqlClient;
using NLog;

namespace paySolution
{
	public static class Culturize
	{
		public static string GetString(int id){
			string response = string.Empty;
			try {
				MySqlDataReader data = DataBase.CallSp ("pa_get_culturize",new string[] {id.ToString()});
				if (data != null){
					while (data.Read ()) {
						response = data[MainClass.Languaje].ToString();
					}
					if (!data.IsClosed)
						data.Close ();
				}
			} catch (Exception ex) {
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
			}
			return response;
		}
	}
}


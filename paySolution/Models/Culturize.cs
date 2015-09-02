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
				MySqlDataReader data = DataBase.CallSp ("pa_get_culturize",new string[] {id.ToString()},false);
				if (data != null){
					while (data.Read ()) {
						try {
							response = data[MainClass.Languaje].ToString();	
						} catch (Exception) {
							response = data["default"].ToString();	
						}

						if (Boolean.Parse(cnfg.getConfiguration("upperCaseStrings")) == true){
							response = response.ToUpper();
						}
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

		public static MySqlDataReader getCaIdioms(){
			return DataBase.CallSp ("pa_get_Idioms",false);
		}

		public static void changeLenguaje(string siglas){
			MainClass.Languaje = siglas;
		}

		public static string GetParameter(string parameter){
			string response = string.Empty;
			try {
				MySqlDataReader data = DataBase.CallSp ("pa_get_culturizeParameter",new string[] {MainClass.Languaje,parameter},false);
				if (data != null){
					while (data.Read ()) {
						response = data["val"].ToString();	
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


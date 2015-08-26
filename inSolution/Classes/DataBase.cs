using System;
using MySql.Data.MySqlClient;
using System.Data.Common;
using NLog;
using System.Data;

namespace inSolution
{
	public static class DataBase
	{
		private static MySqlConnection cnn;

		public static Boolean Open(string Server, string Database, string Usr, string Pwd){
			Boolean result = false;
			try {
				string cnnstr = String.Format ("Server={0};Database={1};Uid={2};Pwd={3}", Server, Database, Usr, Pwd);
				cnn = new MySqlConnection (cnnstr);
				cnn.Open();
				result = true;
			} catch (Exception ex) {
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
			}
			return result;
		}

		public static Boolean Close(){
			Boolean result = false;
			try {
				cnn.Close ();
				result = true;
			} catch (Exception ex) {
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
			}
			return result;
		}

		public static MySqlDataReader Insert(string query){			
			MySqlCommand cmd;
			MySqlDataReader dr;
			try {
				cmd = new MySqlCommand (query, cnn);
				dr= cmd.ExecuteReader ();
				cmd.Dispose();
				return dr;
			} catch (Exception ex) {
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
				return null;
			}
		}

		public static MySqlDataReader CallSp(string sp, string[] parameters = null){
			MySqlCommand cmd;
			MySqlDataReader dr;
			try
			{
				string query = string.Format("call {0} ({1}",sp,MainClass.Id_application);
				if (parameters != null){
					if (parameters.Length > 0){
						query += ",";
					}
				}

				int i = 1;
				if (parameters != null){
					foreach (var item in parameters) {
						query += string.Format("\"{0}\"",item);
						if (i < parameters.Length ) query += ",";
						i++;
					}	
				}
				query += ");";

				cmd = new MySqlCommand(query, cnn);
				cmd.Prepare();
				dr= cmd.ExecuteReader ();
				cmd.Dispose();
				return dr;
			}
			catch (Exception ex)
			{
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
				return null;
			}
		}

	}
}


using System;
using MySql.Data.MySqlClient;
using System.Data.Common;
using NLog;
using System.Data;

namespace paySolution
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

		public static MySqlDataReader CallSp(string sp){
			return DataBase._CallSp (sp);
		}

		public static MySqlDataReader CallSp(string sp,Boolean default_id_application = true){
			return DataBase._CallSp (sp,null,null,default_id_application);
		}

		public static MySqlDataReader CallSp(string sp, string[] parameters){
			return DataBase._CallSp (sp,parameters);
		}

		public static MySqlDataReader CallSp(string sp, string[] parameters, int id_application){
			return DataBase._CallSp (sp,parameters,id_application);
		}

		public static MySqlDataReader CallSp(string sp, string[] parameters, Boolean default_id_application){
			return DataBase._CallSp (sp,parameters,null,default_id_application);
		}
			
		private static MySqlDataReader _CallSp(string sp, string[] parameters = null, int? id_application = null, Boolean default_id_application = true){
			MySqlCommand cmd;
			MySqlDataReader dr;
			try
			{
				string idApplication = default_id_application == false ? (id_application != null ? id_application.ToString() : string.Empty)  : cnfg.Id_application;

				string query = string.Format("call {0} ({1}",sp, idApplication);

				if (parameters != null && !string.IsNullOrEmpty(idApplication)){
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


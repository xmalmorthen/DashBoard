using System;
using NLog.Internal;
using MySql.Data.MySqlClient;
using NLog;

namespace paySolution
{
	public static class cnfg
	{
		private static ConfigurationManager config = new ConfigurationManager ();

		public static string baseDirectory{
			get { 
				return AppDomain.CurrentDomain.BaseDirectory;
			}
		}

		public static string getConfiguration(string configurationItem){
			try {
				string response = string.Empty;

				OperatingSystem os = Environment.OSVersion;
				PlatformID pid = os.Platform;

				if (pid == PlatformID.Unix) {
					response =  config.AppSettings[configurationItem].Replace(@"\","/");
				} else{
					response = config.AppSettings[configurationItem];
				}
				return response;
			} catch (Exception) {
				return null;
			}
		}

		public static string Id_application {
			get {
				return getConfiguration("id_application");
			}
		}

		public static string DefaultLanguaje{
			get {
				string response = string.Empty;
				try {
					MySqlDataReader data = DataBase.CallSp ("pa_get_ApplicationParameter",new string[] {"defaultLanguaje"},true);
					if (data != null){
						while (data.Read ()) {
							try {
								response = data["value"].ToString();	
							} catch (Exception) {
								response = getConfiguration("defaultLanguaje");	
							}
						}
						if (!data.IsClosed)
							data.Close ();
					} else {
						response = getConfiguration("defaultLanguaje");	
					}
				} catch (Exception ex) {
					Logger logger = LogManager.GetCurrentClassLogger();
					logger.Error(ex,ex.Message);
				}
				return response;
			}
		}

		public static string ImagesPath {
			get {
				return System.IO.Path.Combine (baseDirectory, getConfiguration("imagesPath"));
			}
		}

		public static string GetFormBackgroundImage{
			get { 
				return System.IO.Path.Combine (baseDirectory,ImagesPath,getConfiguration("backgroundsImages"),getConfiguration("formBackground"));
			}
		}

		public static string GetLogoImage{
			get { 
				return System.IO.Path.Combine (baseDirectory,ImagesPath,getConfiguration("baseImagesPath"),getConfiguration("logoImage"));
			}
		}

		public static string GetPrincipalGifAnimated{
			get { 
				return System.IO.Path.Combine (baseDirectory,ImagesPath,getConfiguration("baseGifsPath"),getConfiguration("principalGifAnimated"));
			}
		}

		public static string GetGif(string gifName){
			return System.IO.Path.Combine (baseDirectory,ImagesPath,getConfiguration("baseGifsPath"),string.Format("{0}{1}",MainClass.Languaje,getConfiguration("pathSeparator")),gifName);
		}

		public static string GetBaseImage(string imageName){
			return System.IO.Path.Combine (baseDirectory,ImagesPath,getConfiguration("baseImagesPath"),imageName);
		}

		public static string GetPublicityImage{
			get {
				return System.IO.Path.Combine (baseDirectory, ImagesPath, getConfiguration ("PublicityImagesPath"), getConfiguration ("PublicityImageDefault"));
			}
		}

		public static string GetCheckerName(int id){
			string response = string.Empty;
			try {
				MySqlDataReader data = DataBase.CallSp ("pa_get_ApplicationInfo",new string[] {id.ToString()},false);
				if (data != null){
					while (data.Read ()) {
						try {
							response = data["description"].ToString();	
						} catch (Exception) {
							response = getConfiguration("stringDefaultValue");	
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

		public static string getApplicationParameter(string parameter){
			string response = string.Empty;
			try {
				MySqlDataReader data = DataBase.CallSp ("pa_get_ApplicationParameter",new string[] {parameter},true);
				if (data != null){
					while (data.Read ()) {
						try {
							response = data["value"].ToString();	
						} catch (Exception) {}
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


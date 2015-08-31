using System;
using NLog.Internal;

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
				string pathSeparator = config.AppSettings["pathSeparator"].ToString();
				if (!pathSeparator.Equals(@"\")){
					return config.AppSettings[configurationItem].Replace(@"\",pathSeparator);
				} else {
					return config.AppSettings[configurationItem];
				}
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
				return getConfiguration("defaultLanguaje");
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




	}
}


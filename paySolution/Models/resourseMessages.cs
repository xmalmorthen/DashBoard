using System;

namespace paySolution
{
	public static class resourseMessages
	{
		public static string exitMessage {
			get{ 
				return string.Format ("{0}. {1} \n {2} {3}",Culturize.GetString (14), Culturize.GetString (15), cnfg.getApplicationParameter ("tiempoSalida"),Culturize.GetString (17));
			}
		}

		public static string printingReceiptMessage {
			get{ 
				return string.Format ("{0}",Culturize.GetString (16));
			}
		}

	}
}


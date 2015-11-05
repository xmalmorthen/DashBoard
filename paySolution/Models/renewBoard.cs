using System;

namespace paySolution
{
	public static class renewBoard
	{
		private static DateTime pensionExpires;
		public static DateTime PensionExpires {
			get {
				return pensionExpires;
			}
			set {
				pensionExpires = value;
			}
		}

		private static int renovateMonths;
		public static int RenovateMonths {
			get {
				return renovateMonths;
			}
			set {
				renovateMonths = value;
			}
		}

		private static decimal renewalCost = 000.00m;
		public static decimal TotalPay {
			get {
				if (renewalCost == 0m) {
					renewalCost = getRenewalCost ();
				}

				return renewBoard.renovateMonths * renewalCost;
			}
		}

		public static DateTime PensionWillExpires {
			get {
				return renewBoard.PensionExpires.AddMonths (renewBoard.RenovateMonths);
			}
		}

		private static decimal getRenewalCost (){
			Decimal renewalCost = 200.00m;

			/*
			 * TODO: Obtener el costo de renoviación por mes
			 */

			return renewalCost;
		}

		public static DateTime getPensionExpires (string pensionId){
			DateTime pensionExpires = new DateTime ();

			/*
			 * TODO: obtener fecha de expiración de pensión
			 */ 

			//throw new FieldAccessException ("Error al leer el RFID");

			pensionExpires = DateTime.Now;

			return pensionExpires;
		}

	}
}


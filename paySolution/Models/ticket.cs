using System;

namespace paySolution
{
	public static class ticket
	{
		private static string ticketId;
		public static string TicketId {
			get {
				return ticketId;
			}
			set {
				ticketId = value;
			}
		}

		private static Decimal totalPay;
		public static Decimal TotalPay {
			get {
				return totalPay;
			}
			set {
				totalPay = value;
			}
		}

		private static DateTime entry;
		public static DateTime Entry {
			get {
				return entry;
			}
			set {
				entry = value;
			}
		}

		private static DateTime exit;
		public static DateTime Exit {
			get {
				return exit;
			}
			set {
				exit = value;
			}
		}

		public static string Stay {
			get {
				return Math.Round((exit - entry).TotalHours, 2).ToString();
			}
		}
	}
}


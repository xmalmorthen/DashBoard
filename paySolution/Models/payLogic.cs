using System;

namespace paySolution
{
	public static class payLogic
	{
		public enum payStatus
		{
			insertTicket, 		//En espera de ticket
			readingTicket,		//Leyendo el ticket
			errorReadingTicket,	//Error al leer el ticket
			calculatingAmount,	//Calculando monto a pagar
			waithToMoney,		//Esperando depósito de dinero
			cancelPay, 			//Proceso de pago cancelado
			withMoney, 			//Con dinero depositado y esperando más para completar el monto a pagar
			withAmountPayed,	//Depósito de dinero completado
			printingTicket		//Impresión de ticket de pago
		}

		private static decimal toPay;
		public static decimal ToPay {
			get {
				return toPay;
			}
			set {
				toPay = value;
			}
		}

		private static decimal payable;
		public static decimal Payable {
			get {
				return payable;
			}
			set {
				payable = value;
			}
		}

		private static decimal toReturn;
		public static decimal ToReturn {
			get {
				return toReturn;
			}
			set {
				toReturn = value;
			}
		}

		public static string SetNotification{
			set { 
				MainClass.FrmPayPanel.SetNotification = value;
			}
		}

		public static payStatus status;
		public static payStatus Status {
			get {
				return status;
			}
			set {

				switch (value) {
				case payStatus.insertTicket: 		//En espera de ticket
					MainClass.MainWin.SetNotification = "inserte_ticket.gif";
					break;
				case payStatus.readingTicket:		//Leyendo el ticket
					MainClass.MainWin.SetNotification = "leyendo_ticket.gif";
					break;
				case payStatus.errorReadingTicket:	//Error al leer el ticket
					MainClass.MainWin.SetNotification = "inserte_ticket.gif";
					break;
				case payStatus.calculatingAmount:	//Calculando monto a pagar
					MainClass.MainWin.SetNotification = "calculando_importe.gif";
					break;
				case payStatus.waithToMoney: 		//Esperando depósito de dinero
					payLogic.SetNotification = Culturize.GetString (7);

					MainClass.FrmPayPanel.Visible = true;
					//MainClass.MainWin.Visible = false;
					break;
				case payStatus.cancelPay: 			//Proceso de pago cancelado
					MainClass.MainWin.SetNotification = "inserte_ticket.gif";
					//MainClass.MainWin.Visible = true;
					MainClass.FrmPayPanel.Visible = false;




					value = payStatus.insertTicket;

					/*
					 * INICIO DE CODIGO DE SIMULACIÓN - [BOORAR AL IMPLEMENTAR]
					 */ 
					MainClass.MainWin.SimulationIter = 1;
					/*
					 * FIN DE CODIGO DE SIMULACIÓN
					 */

					break;
				case payStatus.withMoney: 			//Con dinero depositado y esperando más para completar el monto a pagar
					break;
				case payStatus.withAmountPayed:		//Depósito de dinero completado
					break;
				case payStatus.printingTicket:		//Impresión de ticket de pago
					break;

				default:
					break;
				}
				status = value;
			}
		}

	}
}


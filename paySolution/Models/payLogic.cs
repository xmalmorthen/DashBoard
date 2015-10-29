using System;
using Gtk;
using System.Threading;

namespace paySolution
{
	public static class payLogic
	{
		public enum payStatus
		{
			init,							//Sin estatus
			insertTicket, 					//En espera de ticket
			readingTicket,					//Leyendo el ticket
			errorReadingTicket,				//Error al leer el ticket
			calculatingAmount,				//Calculando monto a pagar
			waithToMoney,					//Esperando depósito de dinero
			cancelPay, 						//Proceso de pago cancelado
			withMoney, 						//Con dinero depositado y esperando más para completar el monto a pagar
			withAmountPayed,				//Depósito de dinero completado
			withAmountPayedandReturnMoney,	//Depósito de dinero completado
			ticketProcessed,				//Ticket procesado [ registros en bd afectados ] 
			payProcessTerminated,			//Flojo de pago terminado
			printingRecepit,				//Impresión de recibo de pago
			recepitPrinted					//Recibo impreso
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

				if (value < 0) {
					ToReturn = value * -1;
					value = 0m;
				}
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

		private static decimal payDeposit = 0.00m;
		public static decimal PayDeposit {
			get {
				return payDeposit;
			}
			set {
				Payable -= value;
				payDeposit = value;
			}
		}
			
		private static payStatus status;
		public static payStatus Status{
			get {
				return status;
			}
			set {
				if (Status != value) {

					MainClass.MainWin.Visible = value == payStatus.insertTicket;
					MainClass.FrmPublicity.Visible = value == payStatus.readingTicket || value == payStatus.calculatingAmount;
					MainClass.FrmPayPanel.Visible = !MainClass.MainWin.Visible && !MainClass.FrmPublicity.Visible;

					switch (value) {
					case payStatus.insertTicket: 		//En espera de ticket
						MainClass.MainWin.SetNotification = payStatus.insertTicket;
						break;
					case payStatus.readingTicket:
						break;
					case payStatus.errorReadingTicket:	//Error al leer ticket
						MainClass.MainWin.SetNotification = payStatus.errorReadingTicket;
						break;
					case payStatus.waithToMoney: 		//Esperando depósito de dinero
						break;
					case payStatus.cancelPay: 			//Proceso de pago cancelado
						Status = payStatus.insertTicket;
						break;
					case payStatus.withMoney: 			//Con dinero depositado y esperando más para completar el monto a pagar
						break;
					case payStatus.withAmountPayed:		//Depósito de dinero completado
						break;
					case payStatus.withAmountPayedandReturnMoney:
						break;
					case payStatus.ticketProcessed:
						break;
					case payStatus.payProcessTerminated:
						break;
					case payStatus.printingRecepit:		//Impresión de recibo de pago
						break;	
					case payStatus.recepitPrinted:		//Recibo impreso
						break;
					}
					status = value;
				}
			}
		}

	}
}


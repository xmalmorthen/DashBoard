using System;
using Gtk;
using System.Threading;

namespace paySolution
{
	public static class payLogic
	{
		public enum payStatus
		{
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
					paymentFlow ();
				}

				payable = value;
				MainClass.FrmPayPanel.refreshPayLabels ();
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
			
		public static string SetNotification{
			set { 
				Application.Invoke (delegate {
					MainClass.FrmPayPanel.SetNotification = value;
				});
			}
		}

		public static void RefreshNotification(payStatus status){
			try {
				switch (status) {
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
					break;
				case payStatus.cancelPay: 			//Proceso de pago cancelado
					MainClass.MainWin.SetNotification = "inserte_ticket.gif";
					break;
				case payStatus.withMoney: 			//Con dinero depositado y esperando más para completar el monto a pagar
					break;
				case payStatus.withAmountPayed:		//Depósito de dinero completado
					payLogic.SetNotification = string.Format ("{0}, {1}...",Culturize.GetString (8),Culturize.GetString (9));
					break;
				case payStatus.withAmountPayedandReturnMoney:
					payLogic.SetNotification = Culturize.GetString (10);
					break;
				case payStatus.ticketProcessed:
						payLogic.SetNotification = Culturize.GetString (11);
					break;
				case payStatus.payProcessTerminated:
					payLogic.SetNotification = Culturize.GetString (12);
					break;
				case payStatus.printingRecepit:		//Impresión de recibo de pago
					payLogic.SetNotification =  string.Format ("{0}, {1}...",Culturize.GetString (13),Culturize.GetString (9));
					break;
				case payStatus.recepitPrinted:		//Recibo impreso
					payLogic.SetNotification =  Culturize.GetString (16);
					break;
				}	
			} catch (Exception) {}

		}

		private static payStatus status;
		public static payStatus Status{
			get {
				return status;
			}
			set {
				if (Status != value) {
					RefreshNotification (value);

					switch (value) {
					case payStatus.insertTicket: 		//En espera de ticket
						//MainClass.MainWin.Visible = true;					
						MainClass.FrmPayPanel.Visible = false;

						/*
						 * TODO: INICIO DE CODIGO DE SIMULACIÓN - [BOORAR AL IMPLEMENTAR]
						 */ 
							MainClass.MainWin.SimulationIter = 1;
						/*
						 * FIN DE CODIGO DE SIMULACIÓN
						 */

						break;
					case payStatus.waithToMoney: 		//Esperando depósito de dinero
						MainClass.FrmPayPanel.changeCancelButtonVisibility (true);
						MainClass.FrmPayPanel.changeReciboButtonVisibility (false);

						MainClass.FrmPayPanel.Visible = true;
						//MainClass.MainWin.Visible = false;
						break;
					case payStatus.cancelPay: 			//Proceso de pago cancelado
						Status = payStatus.insertTicket;
						break;
					case payStatus.withMoney: 			//Con dinero depositado y esperando más para completar el monto a pagar
						break;
					case payStatus.withAmountPayed:		//Depósito de dinero completado
						MainClass.FrmPayPanel.changeCancelButtonVisibility (false);

						//TODO: INSERTAR LOGICA PARA GUARDAR EN BASE DE DATOS EL PAGO REALIZADO

						break;
					case payStatus.withAmountPayedandReturnMoney:
						
						break;
					case payStatus.ticketProcessed:
						break;
					case payStatus.payProcessTerminated:
						MainClass.FrmPayPanel.changeReciboButtonVisibility (true);

						string msg = string.Format ("{0}. {1} \n {2} {3}", Culturize.GetString (14), Culturize.GetString (15), cnfg.getApplicationParameter ("tiempoSalida"),Culturize.GetString (17));
						dlg.show (MainClass.FrmPayPanel, Gtk.MessageType.Info, msg);

						break;
					case payStatus.printingRecepit:		//Impresión de recibo de pago
						MainClass.FrmPayPanel.changeReciboButtonVisibility (false);
						break;	
					case payStatus.recepitPrinted:		//Recibo impreso
						break;
					}
					status = value;
				}
			}
		}

		private static void paymentFlow(){
			Status = payStatus.withAmountPayed;
			if (ToReturn > 0) {
				Status = payStatus.withAmountPayedandReturnMoney;
			}

			Thread thrTicketProccessed = new Thread (new ThreadStart (delegate {
				System.Threading.Thread.Sleep (int.Parse(cnfg.getConfiguration("sleepTime")));
				Application.Invoke( delegate {
					payLogic.Status = payStatus.ticketProcessed;
					System.Threading.Thread.Sleep (int.Parse(cnfg.getConfiguration("sleepTime")));
					Thread thrpayProcessTerminated = new Thread (new ThreadStart (delegate {
						System.Threading.Thread.Sleep (int.Parse(cnfg.getConfiguration("sleepTime")));
						Application.Invoke( delegate {
							payLogic.Status = payStatus.payProcessTerminated;
						});
					}));
					thrpayProcessTerminated.Start ();
				});
			}));
			thrTicketProccessed.Start ();
		}

	}
}


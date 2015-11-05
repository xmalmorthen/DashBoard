using System;
using Gtk;
using System.Threading;
using NLog;
using System.Collections.Generic;

namespace paySolution
{
	public static class payLogic
	{
		public enum payStatus
		{
			init,							//Sin estatus
			insertTicket, 					//En espera de ticket
			readingTicket,					//Leyendo el ticket
			readingRFID,					//Leyendo RFID
			errorReadingTicketorRFID,		//Error al leer el ticket o RFID
			calculatingAmount,				//Calculando monto a pagar
			waithToRenewBoard,				//Esperando acción de renovación de pensión
			waithToMoney,					//Esperando depósito de dinero
			cancelPay, 						//Proceso de pago cancelado
			withMoney, 						//Con dinero depositado y esperando más para completar el monto a pagar
			withAmountPayed,				//Depósito de dinero completado
			withAmountPayedandReturnMoney,	//Depósito de dinero completado
			ticketProcessed,				//Ticket procesado [ registros en bd afectados ] 
			payProcessTerminated,			//Flojo de pago terminado
			printingRecepit,				//Impresión de recibo de pago
			recepitPrinted,					//Recibo impreso
			errorGeneral					//Error general
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

		private static string dataReceived = string.Empty;

		public static void LogicFlow(string Port, string dataInput){
			try {
				switch (Port.Trim().ToLower()) {
					case "com1":
						switch (dataInput.Trim().ToLower()) {
							case "q": 			//Lectura de ticket
								readTicket (dataInput);								
							break;
							case "w": 			//Lectura de RFID
								readRFID (dataInput);
							break;
							case "+":			//agregar mes a la renovación de la pensión
								renewBoard.RenovateMonths = renewBoard.RenovateMonths < 5 ? renewBoard.RenovateMonths + 1 : 0;
								MainClass.FrmRenovation.populateDataLabels();
							break;
							case "a":			//aceptar renovación de pensión
								payLogic.Status = payLogic.payStatus.readingTicket;
								changeStatusAfterSleepTime(payLogic.payStatus.waithToMoney,true);	//tiempo de espera para mostrar publicidad
							break;
							case "c":			//cancelar renovación de pensión
								MainClass.FrmPublicity.Visible = true;
								MainClass.FrmRenovation.Visible = false;
								changeStatusAfterSleepTime(payLogic.payStatus.insertTicket,true);
							break;
						}
					break;
					case "com2":
						switch (dataInput.Trim().ToLower()) {
							case "q":
							break;
						}
					break;			
				}
			} catch (Exception ex) {
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
				if (ex.GetType () == typeof(FieldAccessException)) {
					payLogic.Status = payLogic.payStatus.errorReadingTicketorRFID;
				}else{
					MainClass.MainWin.SetNotification = payStatus.errorGeneral;
					changeStatusAfterSleepTime(payLogic.payStatus.insertTicket);
				}
			}
		}
			
		private static void readTicket(string dataInput){
			payLogic.Status = payLogic.payStatus.readingTicket;
			/*
			 * TODO: Logica para leer datos de ticket desde información recibida por codigo de barra o por base de datos
			 */

			//throw new FieldAccessException ("Error al leer ticket");

			/*
			 * TODO: Logica para calcular el monto a pagar
			 */
			payLogic.ToPay = 50.15m;	//valor simulado

			changeStatusAfterSleepTime(payLogic.payStatus.waithToMoney,true);	//tiempo de espera para mostrar publicidad
		}

		private static void readRFID(string dataInput){
			payLogic.Status = payLogic.payStatus.readingRFID;

			renewBoard.PensionExpires = renewBoard.getPensionExpires (dataInput);;
			renewBoard.RenovateMonths = 1;

			MainClass.FrmRenovation.populateDataLabels();
			payLogic.Status = payLogic.payStatus.waithToRenewBoard;
		}

		private static Boolean senDataToPort (string portName, string data){
			Boolean response = false;
			CnnPort cnnPort;
			string port = portName;
			if (MainClass.MainWin.cnnPortList.TryGetValue (port, out cnnPort)) {
				if (!cnnPort.SendData (data)) {
					BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()), string.Format ("Ocurrió un error al enviar el dato [ {0} ] al puerto", data), "ERROR");
				} else {
					BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()), string.Format ("Dato enviado al puerto [ {0} ]", data));
					response = true;
				}
			} else {
				BitacoraModel.addItem ("Enviar dato al puerto", string.Format ("Puerto {0}", port.ToString ()), string.Format ("El puerto [ {0} ] no se encuentra abierto o la comunicación ha sido interrumpida. Dato [ {0} ] no enviado", port,data), "ERROR");
			}
			return response;
		}

		private static payStatus status;
		public static payStatus Status{
			get {
				return status;
			}
			set {
				if (Status != value) {					
					MainClass.MainWin.Visible = value == payStatus.insertTicket || value == payStatus.errorReadingTicketorRFID || value == payStatus.errorGeneral;
					MainClass.FrmRenovation.Visible = value == payStatus.waithToRenewBoard;
					MainClass.FrmPublicity.Visible = value == payStatus.readingTicket || value == payStatus.calculatingAmount;
					MainClass.FrmPayPanel.Visible = !MainClass.MainWin.Visible && !MainClass.FrmPublicity.Visible && !MainClass.FrmRenovation.Visible;

					switch (value) {
						case payStatus.insertTicket: 		//En espera de ticket
							MainClass.MainWin.SetNotification = payStatus.insertTicket;
						break;
						case payStatus.errorReadingTicketorRFID:	//Error al leer ticket
							MainClass.MainWin.SetNotification = payStatus.errorReadingTicketorRFID;
							changeStatusAfterSleepTime (payLogic.payStatus.insertTicket);
						break;
					}
					status = value;					
				}
			}
		}

		private static void changeStatusAfterSleepTime(payStatus _status, Boolean byGeter = false){
			Thread thrTicketProccessed = new Thread (new ThreadStart (delegate {
				System.Threading.Thread.Sleep (int.Parse(cnfg.getConfiguration("sleepTime")));
				Application.Invoke( delegate {
					switch (_status) {
						case payStatus.insertTicket:
						case payStatus.errorReadingTicketorRFID:
						case payStatus.errorGeneral:
							MainClass.MainWin.SetNotification = _status;
						break;
					}
					if (!byGeter) {
						status = _status;
					} else {
						payLogic.Status = _status;
					}
				});
			}));
			thrTicketProccessed.Start ();
		}

	}

}


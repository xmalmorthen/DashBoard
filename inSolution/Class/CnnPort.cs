using System;
using System.IO.Ports;
using NLog;

namespace inSolution
{
	public class CnnPort
	{
		private SerialPort sport;

		public CnnPort (string port,
						int baudRate,
						Parity parity,
						int databits,
						StopBits stopbits,
						SerialDataReceivedEventHandler sport_DataReceived,
						SerialErrorReceivedEventHandler sport_ErrorReceived)
		{
			sport = new SerialPort (port, baudRate, parity, databits, stopbits);
			try {
				sport.Close ();	
			} catch (Exception) {}

			sport.DataReceived += sport_DataReceived;
			sport.ErrorReceived += sport_ErrorReceived;
		}

		public Boolean Open(out string message){
			Boolean result = false;
			message = null;
			try
			{
				sport.Open();
				result = true;
			}
			catch (Exception ex)
			{
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
				message = ex.Message;
			}
			return result;
		}

		public Boolean Close(){
			Boolean result = false;
			try
			{
				sport.Close();
				result = true;
			}
			catch (Exception ex)
			{
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
			}
			return result;
		}

	}
}


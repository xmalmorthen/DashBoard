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
			sport.DataReceived += sport_DataReceived;
			sport.ErrorReceived += sport_ErrorReceived;
		}

		public Boolean Open(){
			Boolean result = false;
			try
			{
				sport.Open();
			}
			catch (Exception ex)
			{
				Logger logger = LogManager.GetCurrentClassLogger();
				logger.Error(ex,ex.Message);
			}
			return result;
		}

		public Boolean Close(){
			Boolean result = false;
			try
			{
				sport.Close();
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


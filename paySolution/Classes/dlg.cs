﻿using System;
using Gtk;

namespace paySolution
{
	public static class dlg
	{
		private static MessageDialog _dlg;

		public static ResponseType show(Window parent_window, DialogFlags dialogFlags, MessageType messageType, ButtonsType buttonsType,string  message){
			_dlg = new MessageDialog (parent_window, dialogFlags, messageType, buttonsType, message);
			ResponseType response = (ResponseType)_dlg.Run ();
			_dlg.Destroy ();
			return response;
		}

		public static void show(Window parent_window, MessageType messageType, string  message, EventHandler OnDestroyedEvent = null, int? closeInterval = null){
			frmNotificationsWin FrmNotificationsWin = new frmNotificationsWin(parent_window,messageType,message,OnDestroyedEvent,closeInterval);
			FrmNotificationsWin.ShowAll ();
		}
	}
}


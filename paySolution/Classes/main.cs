using System;
using Gtk;

namespace paySolution
{
	public static class mainWindow
	{
		private static int winHeight;
		public static int Height (Gtk.Window win){
			getWindowSize (win);
			return winHeight;
		}

		private static int winWidth;
		public static int Width (Gtk.Window win){
			getWindowSize (win);
			return winWidth;
		}

		private static void getWindowSize(Gtk.Window win){
			win.GetSize(out winHeight , out winWidth);
		}

		public static void setBackgroundImage(Gtk.Window win, Gdk.Pixbuf image){			
			Gdk.Pixmap pixmap, pixmap_mask;
			image.RenderPixmapAndMask( out pixmap, out pixmap_mask, 255 );
			var style = win.Style;
			style.SetBgPixmap (StateType.Normal, pixmap);
			win.Style = style;
		}

	}
}


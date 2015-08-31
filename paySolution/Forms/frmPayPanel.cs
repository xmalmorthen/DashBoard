using System;

namespace paySolution
{
	public partial class frmPayPanel : Gtk.Window
	{

		public frmPayPanel () :base (Gtk.WindowType.Toplevel)
		{	
			this.Build ();
			this.Maximize ();
			mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (MainClass.imagesPath + @"backgrounds\backGround3.jpg"));
			imgLogo.Pixbuf = new Gdk.Pixbuf (MainClass.imagesPath + @"logo.png");

			btnEsp.Image = new Gtk.Image (MainClass.imagesPath + @"icons\Esp\esp.png");
			btnEng.Image = new Gtk.Image (MainClass.imagesPath + @"icons\Eng\eng.png");


			Gtk.Style style = entry1.Style;

			style.FontDescription.Size = 28000;
			entry1.ModifyFont (style.FontDescription);

		}


	}
}


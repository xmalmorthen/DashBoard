using System;
using Gtk;
using paySolution;

public partial class MainWindow: Gtk.Window
{
	public MainWindow () : base (Gtk.WindowType.Toplevel)
	{
		Build ();
		this.Maximize ();
		mainWindow.setBackgroundImage (this, new Gdk.Pixbuf (MainClass.imagesPath + "backGround2.jpg"));
		image1.PixbufAnimation = new Gdk.PixbufAnimation(MainClass.imagesPath + "ticket.png");
	}

	protected void OnDeleteEvent (object sender, DeleteEventArgs a)
	{
		Application.Quit ();
		a.RetVal = true;
	}

}

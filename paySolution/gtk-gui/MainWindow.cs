
// This file has been generated by the GUI designer. Do not modify.

public partial class MainWindow
{
	private global::Gtk.VBox vbox6;
	
	private global::Gtk.Image imgMain;
	
	private global::Gtk.Image imgNotifications;
	
	private global::Gtk.HBox hbox1;
	
	private global::Gtk.Alignment alignment1;
	
	private global::Gtk.Button button1;

	protected virtual void Build ()
	{
		global::Stetic.Gui.Initialize (this);
		// Widget MainWindow
		this.WidthRequest = 800;
		this.HeightRequest = 600;
		this.Name = "MainWindow";
		this.Title = "";
		this.TypeHint = ((global::Gdk.WindowTypeHint)(4));
		this.Resizable = false;
		this.Decorated = false;
		this.Gravity = ((global::Gdk.Gravity)(5));
		// Container child MainWindow.Gtk.Container+ContainerChild
		this.vbox6 = new global::Gtk.VBox ();
		this.vbox6.Name = "vbox6";
		this.vbox6.Spacing = 6;
		// Container child vbox6.Gtk.Box+BoxChild
		this.imgMain = new global::Gtk.Image ();
		this.imgMain.HeightRequest = 125;
		this.imgMain.Name = "imgMain";
		this.vbox6.Add (this.imgMain);
		global::Gtk.Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.imgMain]));
		w1.Position = 0;
		// Container child vbox6.Gtk.Box+BoxChild
		this.imgNotifications = new global::Gtk.Image ();
		this.imgNotifications.HeightRequest = 125;
		this.imgNotifications.Name = "imgNotifications";
		this.vbox6.Add (this.imgNotifications);
		global::Gtk.Box.BoxChild w2 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.imgNotifications]));
		w2.Position = 1;
		w2.Expand = false;
		w2.Fill = false;
		// Container child vbox6.Gtk.Box+BoxChild
		this.hbox1 = new global::Gtk.HBox ();
		this.hbox1.Name = "hbox1";
		this.hbox1.Spacing = 6;
		// Container child hbox1.Gtk.Box+BoxChild
		this.alignment1 = new global::Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
		this.alignment1.Name = "alignment1";
		this.hbox1.Add (this.alignment1);
		global::Gtk.Box.BoxChild w3 = ((global::Gtk.Box.BoxChild)(this.hbox1 [this.alignment1]));
		w3.Position = 0;
		// Container child hbox1.Gtk.Box+BoxChild
		this.button1 = new global::Gtk.Button ();
		this.button1.CanFocus = true;
		this.button1.Name = "button1";
		this.button1.UseUnderline = true;
		this.button1.Label = global::Mono.Unix.Catalog.GetString ("Continue");
		this.hbox1.Add (this.button1);
		global::Gtk.Box.BoxChild w4 = ((global::Gtk.Box.BoxChild)(this.hbox1 [this.button1]));
		w4.Position = 1;
		w4.Expand = false;
		w4.Fill = false;
		this.vbox6.Add (this.hbox1);
		global::Gtk.Box.BoxChild w5 = ((global::Gtk.Box.BoxChild)(this.vbox6 [this.hbox1]));
		w5.Position = 2;
		w5.Expand = false;
		w5.Fill = false;
		this.Add (this.vbox6);
		if ((this.Child != null)) {
			this.Child.ShowAll ();
		}
		this.DefaultWidth = 800;
		this.DefaultHeight = 600;
		this.Hide ();
		this.DeleteEvent += new global::Gtk.DeleteEventHandler (this.OnDeleteEvent);
		this.button1.Clicked += new global::System.EventHandler (this.OnButton1Clicked);
	}
}

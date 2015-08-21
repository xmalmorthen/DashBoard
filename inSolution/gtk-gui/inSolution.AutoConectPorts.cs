
// This file has been generated by the GUI designer. Do not modify.
namespace inSolution
{
	public partial class AutoConectPorts
	{
		private global::Gtk.VBox vbox2;
		
		private global::Gtk.HBox hbox2;
		
		private global::Gtk.VBox vbox3;
		
		private global::Gtk.HBox hbox3;
		
		private global::Gtk.Label label1;
		
		private global::Gtk.Entry txtPuerto;
		
		private global::Gtk.HBox hbox4;
		
		private global::Gtk.Label label2;
		
		private global::Gtk.Entry txtDesc;
		
		private global::Gtk.Button btnInsert;
		
		private global::Gtk.Frame frame1;
		
		private global::Gtk.Alignment GtkAlignment3;
		
		private global::Gtk.HBox hbox5;
		
		private global::Gtk.ScrolledWindow GtkScrolledWindow;
		
		private global::Gtk.TreeView tblData;
		
		private global::Gtk.VBox vbox4;
		
		private global::Gtk.Alignment alignment1;
		
		private global::Gtk.Button btnEdit;
		
		private global::Gtk.Button btnDelete;
		
		private global::Gtk.Label GtkLabel3;
		
		private global::Gtk.Button buttonOk;
		
		private global::Gtk.Button buttonCancel;

		protected virtual void Build ()
		{
			global::Stetic.Gui.Initialize (this);
			// Widget inSolution.AutoConectPorts
			this.Name = "inSolution.AutoConectPorts";
			this.Title = global::Mono.Unix.Catalog.GetString ("Configurar puertos de autoconexión");
			this.Icon = global::Stetic.IconLoader.LoadIcon (this, "gtk-execute", global::Gtk.IconSize.SmallToolbar);
			this.WindowPosition = ((global::Gtk.WindowPosition)(4));
			this.Modal = true;
			this.DestroyWithParent = true;
			// Internal child inSolution.AutoConectPorts.VBox
			global::Gtk.VBox w1 = this.VBox;
			w1.Name = "dialog1_VBox";
			w1.BorderWidth = ((uint)(2));
			// Container child dialog1_VBox.Gtk.Box+BoxChild
			this.vbox2 = new global::Gtk.VBox ();
			this.vbox2.Name = "vbox2";
			this.vbox2.Spacing = 6;
			// Container child vbox2.Gtk.Box+BoxChild
			this.hbox2 = new global::Gtk.HBox ();
			this.hbox2.Name = "hbox2";
			this.hbox2.Spacing = 6;
			// Container child hbox2.Gtk.Box+BoxChild
			this.vbox3 = new global::Gtk.VBox ();
			this.vbox3.Name = "vbox3";
			this.vbox3.Spacing = 6;
			this.vbox3.BorderWidth = ((uint)(6));
			// Container child vbox3.Gtk.Box+BoxChild
			this.hbox3 = new global::Gtk.HBox ();
			this.hbox3.Name = "hbox3";
			this.hbox3.Spacing = 6;
			// Container child hbox3.Gtk.Box+BoxChild
			this.label1 = new global::Gtk.Label ();
			this.label1.Name = "label1";
			this.label1.Xpad = 13;
			this.label1.LabelProp = global::Mono.Unix.Catalog.GetString ("Puerto");
			this.hbox3.Add (this.label1);
			global::Gtk.Box.BoxChild w2 = ((global::Gtk.Box.BoxChild)(this.hbox3 [this.label1]));
			w2.Position = 0;
			w2.Expand = false;
			w2.Fill = false;
			// Container child hbox3.Gtk.Box+BoxChild
			this.txtPuerto = new global::Gtk.Entry ();
			this.txtPuerto.CanFocus = true;
			this.txtPuerto.Name = "entry1";
			this.txtPuerto.IsEditable = true;
			this.txtPuerto.InvisibleChar = '●';
			this.hbox3.Add (this.txtPuerto);
			global::Gtk.Box.BoxChild w3 = ((global::Gtk.Box.BoxChild)(this.hbox3 [this.txtPuerto]));
			w3.Position = 1;
			this.vbox3.Add (this.hbox3);
			global::Gtk.Box.BoxChild w4 = ((global::Gtk.Box.BoxChild)(this.vbox3 [this.hbox3]));
			w4.Position = 0;
			w4.Expand = false;
			w4.Fill = false;
			// Container child vbox3.Gtk.Box+BoxChild
			this.hbox4 = new global::Gtk.HBox ();
			this.hbox4.Name = "hbox4";
			this.hbox4.Spacing = 6;
			// Container child hbox4.Gtk.Box+BoxChild
			this.label2 = new global::Gtk.Label ();
			this.label2.Name = "label2";
			this.label2.LabelProp = global::Mono.Unix.Catalog.GetString ("Descripción");
			this.hbox4.Add (this.label2);
			global::Gtk.Box.BoxChild w5 = ((global::Gtk.Box.BoxChild)(this.hbox4 [this.label2]));
			w5.Position = 0;
			w5.Expand = false;
			w5.Fill = false;
			// Container child hbox4.Gtk.Box+BoxChild
			this.txtDesc = new global::Gtk.Entry ();
			this.txtDesc.CanFocus = true;
			this.txtDesc.Name = "entry2";
			this.txtDesc.IsEditable = true;
			this.txtDesc.InvisibleChar = '●';
			this.hbox4.Add (this.txtDesc);
			global::Gtk.Box.BoxChild w6 = ((global::Gtk.Box.BoxChild)(this.hbox4 [this.txtDesc]));
			w6.Position = 1;
			this.vbox3.Add (this.hbox4);
			global::Gtk.Box.BoxChild w7 = ((global::Gtk.Box.BoxChild)(this.vbox3 [this.hbox4]));
			w7.Position = 1;
			w7.Expand = false;
			w7.Fill = false;
			this.hbox2.Add (this.vbox3);
			global::Gtk.Box.BoxChild w8 = ((global::Gtk.Box.BoxChild)(this.hbox2 [this.vbox3]));
			w8.Position = 0;
			// Container child hbox2.Gtk.Box+BoxChild
			this.btnInsert = new global::Gtk.Button ();
			this.btnInsert.CanFocus = true;
			this.btnInsert.Name = "button91";
			this.btnInsert.UseUnderline = true;
			global::Gtk.Image w9 = new global::Gtk.Image ();
			w9.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-add", global::Gtk.IconSize.LargeToolbar);
			this.btnInsert.Image = w9;
			this.hbox2.Add (this.btnInsert);
			global::Gtk.Box.BoxChild w10 = ((global::Gtk.Box.BoxChild)(this.hbox2 [this.btnInsert]));
			w10.Position = 1;
			w10.Expand = false;
			w10.Fill = false;
			this.vbox2.Add (this.hbox2);
			global::Gtk.Box.BoxChild w11 = ((global::Gtk.Box.BoxChild)(this.vbox2 [this.hbox2]));
			w11.Position = 0;
			w11.Expand = false;
			w11.Fill = false;
			// Container child vbox2.Gtk.Box+BoxChild
			this.frame1 = new global::Gtk.Frame ();
			this.frame1.Name = "frame1";
			this.frame1.ShadowType = ((global::Gtk.ShadowType)(0));
			// Container child frame1.Gtk.Container+ContainerChild
			this.GtkAlignment3 = new global::Gtk.Alignment (0F, 0F, 1F, 1F);
			this.GtkAlignment3.Name = "GtkAlignment3";
			this.GtkAlignment3.LeftPadding = ((uint)(12));
			// Container child GtkAlignment3.Gtk.Container+ContainerChild
			this.hbox5 = new global::Gtk.HBox ();
			this.hbox5.Name = "hbox5";
			this.hbox5.Spacing = 6;
			// Container child hbox5.Gtk.Box+BoxChild
			this.GtkScrolledWindow = new global::Gtk.ScrolledWindow ();
			this.GtkScrolledWindow.Name = "GtkScrolledWindow";
			this.GtkScrolledWindow.ShadowType = ((global::Gtk.ShadowType)(1));
			// Container child GtkScrolledWindow.Gtk.Container+ContainerChild
			this.tblData = new global::Gtk.TreeView ();
			this.tblData.CanFocus = true;
			this.tblData.Name = "treeview3";
			this.GtkScrolledWindow.Add (this.tblData);
			this.hbox5.Add (this.GtkScrolledWindow);
			global::Gtk.Box.BoxChild w13 = ((global::Gtk.Box.BoxChild)(this.hbox5 [this.GtkScrolledWindow]));
			w13.Position = 0;
			// Container child hbox5.Gtk.Box+BoxChild
			this.vbox4 = new global::Gtk.VBox ();
			this.vbox4.Name = "vbox4";
			this.vbox4.Spacing = 6;
			// Container child vbox4.Gtk.Box+BoxChild
			this.alignment1 = new global::Gtk.Alignment (0.5F, 0.5F, 1F, 1F);
			this.alignment1.Name = "alignment1";
			this.vbox4.Add (this.alignment1);
			global::Gtk.Box.BoxChild w14 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.alignment1]));
			w14.Position = 0;
			// Container child vbox4.Gtk.Box+BoxChild
			this.btnEdit = new global::Gtk.Button ();
			this.btnEdit.CanFocus = true;
			this.btnEdit.Name = "button113";
			this.btnEdit.UseUnderline = true;
			global::Gtk.Image w15 = new global::Gtk.Image ();
			w15.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-edit", global::Gtk.IconSize.Button);
			this.btnEdit.Image = w15;
			this.vbox4.Add (this.btnEdit);
			global::Gtk.Box.BoxChild w16 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.btnEdit]));
			w16.Position = 1;
			w16.Expand = false;
			w16.Fill = false;
			// Container child vbox4.Gtk.Box+BoxChild
			this.btnDelete = new global::Gtk.Button ();
			this.btnDelete.CanFocus = true;
			this.btnDelete.Name = "button112";
			this.btnDelete.UseUnderline = true;
			global::Gtk.Image w17 = new global::Gtk.Image ();
			w17.Pixbuf = global::Stetic.IconLoader.LoadIcon (this, "gtk-delete", global::Gtk.IconSize.Button);
			this.btnDelete.Image = w17;
			this.vbox4.Add (this.btnDelete);
			global::Gtk.Box.BoxChild w18 = ((global::Gtk.Box.BoxChild)(this.vbox4 [this.btnDelete]));
			w18.Position = 2;
			w18.Expand = false;
			w18.Fill = false;
			this.hbox5.Add (this.vbox4);
			global::Gtk.Box.BoxChild w19 = ((global::Gtk.Box.BoxChild)(this.hbox5 [this.vbox4]));
			w19.Position = 1;
			w19.Expand = false;
			w19.Fill = false;
			this.GtkAlignment3.Add (this.hbox5);
			this.frame1.Add (this.GtkAlignment3);
			this.GtkLabel3 = new global::Gtk.Label ();
			this.GtkLabel3.Name = "GtkLabel3";
			this.GtkLabel3.Xalign = 0F;
			this.GtkLabel3.LabelProp = global::Mono.Unix.Catalog.GetString ("<b>Puertos configurados</b>");
			this.GtkLabel3.UseMarkup = true;
			this.frame1.LabelWidget = this.GtkLabel3;
			this.vbox2.Add (this.frame1);
			global::Gtk.Box.BoxChild w22 = ((global::Gtk.Box.BoxChild)(this.vbox2 [this.frame1]));
			w22.Position = 1;
			w1.Add (this.vbox2);
			global::Gtk.Box.BoxChild w23 = ((global::Gtk.Box.BoxChild)(w1 [this.vbox2]));
			w23.Position = 0;
			// Internal child inSolution.AutoConectPorts.ActionArea
			global::Gtk.HButtonBox w24 = this.ActionArea;
			w24.Name = "dialog1_ActionArea";
			w24.Spacing = 10;
			w24.BorderWidth = ((uint)(5));
			w24.LayoutStyle = ((global::Gtk.ButtonBoxStyle)(4));
			// Container child dialog1_ActionArea.Gtk.ButtonBox+ButtonBoxChild
			this.buttonOk = new global::Gtk.Button ();
			this.buttonOk.CanDefault = true;
			this.buttonOk.CanFocus = true;
			this.buttonOk.Name = "buttonOk";
			this.buttonOk.UseStock = true;
			this.buttonOk.UseUnderline = true;
			this.buttonOk.Label = "gtk-ok";
			this.AddActionWidget (this.buttonOk, -5);
			global::Gtk.ButtonBox.ButtonBoxChild w25 = ((global::Gtk.ButtonBox.ButtonBoxChild)(w24 [this.buttonOk]));
			w25.Expand = false;
			w25.Fill = false;
			// Container child dialog1_ActionArea.Gtk.ButtonBox+ButtonBoxChild
			this.buttonCancel = new global::Gtk.Button ();
			this.buttonCancel.CanDefault = true;
			this.buttonCancel.CanFocus = true;
			this.buttonCancel.Name = "buttonCancel";
			this.buttonCancel.UseStock = true;
			this.buttonCancel.UseUnderline = true;
			this.buttonCancel.Label = "gtk-cancel";
			this.AddActionWidget (this.buttonCancel, -6);
			global::Gtk.ButtonBox.ButtonBoxChild w26 = ((global::Gtk.ButtonBox.ButtonBoxChild)(w24 [this.buttonCancel]));
			w26.Position = 1;
			w26.Expand = false;
			w26.Fill = false;
			if ((this.Child != null)) {
				this.Child.ShowAll ();
			}
			this.DefaultWidth = 400;
			this.DefaultHeight = 300;
			this.Show ();
			this.buttonOk.Clicked += new global::System.EventHandler (this.OnButtonOkClicked);
			this.buttonCancel.Clicked += new global::System.EventHandler (this.OnButtonCancelClicked);
		}
	}
}

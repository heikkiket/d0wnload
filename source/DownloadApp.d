
import std.stdio;
import core.stdc.stdlib;


import gtk.Builder;
import gtk.ApplicationWindow;
import gtk.Application;
import gio.Application: GioApplication = Application;
import gtk.Button;


import Controller;

class DownloadApp : Application {

  Controller controller;

  this() {
    super("org.ketoharju.download",
          GApplicationFlags.FLAGS_NONE);
    this.addOnActivate(&hookAllUp);
    this.controller = new Controller();
  }

  public void on_button_clicked() {
    writeln("clicked!");
  }

  void hookAllUp(GioApplication a) {
    auto ui = new Builder();
    if( ! ui.addFromFile("ui/download.glade")) {
      writeln("Could not load UI");
      exit(1);
    }

    auto window = cast(ApplicationWindow) ui.getObject("mainWindow");

    if( window !is null) {
      window.setApplication(this);
      auto button = cast(Button) ui.getObject("downloadButton");
      button.addOnClicked(delegate void (Button b){ controller.handleDlButton(); });
      window.showAll();
    } else {
      writeln("Could not load Window");
      exit(1);
    }
  }


}

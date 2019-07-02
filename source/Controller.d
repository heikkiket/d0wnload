import std.stdio;
import gtk.Entry;

import Downloader;

class Controller {

  private Downloader downloader;

  this() {
    this.downloader = new Downloader();
  }

  private bool isValidUrl(string str) {
    if(str == "") {
      return false;
    }

    if(str.length < 8) {
      return false;
    }

    if(str[0..7] == "http://" || str[0..8] == "https://") {
      return true;
    }

    return false;
  }

  public void handleDlButton(Entry entry) {
    auto text = entry.getBuffer().getText;
    // check input...
    writeln("Handler:" ~ text);
    if(isValidUrl(text)) {
        this.downloader.download(text);
      }
  }

}

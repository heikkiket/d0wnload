import std.stdio;
import Downloader;

class Controller {

  private Downloader downloader;

  this() {
    this.downloader = new Downloader();
  }

  public void handleDlButton() {
    writeln("Handler");
    this.downloader.download();
  }

}

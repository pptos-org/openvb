import 'package:web/web.dart' as web;

class Console {
  late web.HTMLDivElement debugger;

  Console() {
    debugger =
        web.document.querySelector('#debugger-content') as web.HTMLDivElement;
  }

  void printError(String message) {
    var div = web.HTMLParagraphElement();
    div.text = message;
    div.className = 'error';
    debugger.append(div);
    scrollToEnd();
  }

  void printWarning(String message) {
    var div = web.HTMLParagraphElement();
    div.text = message;
    div.className = 'warning';
    debugger.append(div);
    scrollToEnd();
  }

  void printMessage(String message) {
    var div = web.HTMLParagraphElement();
    div.text = message;
    debugger.append(div);
    scrollToEnd();
  }

  void clear() {
    while (debugger.firstChild != null) {
      debugger.removeChild(debugger.firstChild!);
    }
  }

  void scrollToEnd() {
    debugger.scrollTop = debugger.scrollHeight;
  }
}

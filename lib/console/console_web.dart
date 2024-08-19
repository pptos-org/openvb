import 'package:web/web.dart' as web;

class Console {
  late web.HTMLDivElement debugger;

  Console() {
    debugger =
        web.document.querySelector('#console-content') as web.HTMLDivElement;
  }

  Never printError(String message) {
    var div = web.HTMLParagraphElement();
    div.text = message;
    div.className = 'error';
    debugger.append(div);
    scrollToEnd();
    throw Exception(message);
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

import 'package:web/web.dart' as web;
import 'package:openvb/util/json.dart';

class Editor {
  late web.HTMLTextAreaElement editor;
  late web.HTMLTextAreaElement lineNumbers;
  Editor() {
    editor = web.document.querySelector('#code') as web.HTMLTextAreaElement;
    lineNumbers = web.document.querySelector('#code-line-numbers')
        as web.HTMLTextAreaElement;

    editor.onKeyUp.listen((event) {
      _updateLineNumbers();
    });

    editor.onClick.listen((event) {
      _updateLineNumbers();
    });

    _updateLineNumbers();
  }

  void _updateLineNumbers() {
    // remove all line numbers
    while (lineNumbers.firstChild != null) {
      lineNumbers.removeChild(lineNumbers.firstChild!);
    }

    // add line numbers
    List<String> lines = editor.value.split('\n');
    for (int i = 1; i <= lines.length; i++) {
      var p = web.document.createElement('p') as web.HTMLParagraphElement;
      p.text = i.toString();
      lineNumbers.appendChild(p);
    }

    // highlight current line
    int line = _getCurrentLine();
    var lineNumber =
        lineNumbers.children.item(line - 1) as web.HTMLParagraphElement;
    lineNumber.classList.add('selected-line-number');
  }

  int _getCurrentLine() {
    String code = editor.value;
    int cursorPosition = editor.selectionStart!;
    int line = 1;

    for (int i = 0; i < cursorPosition; i++) {
      if (code[i] == '\n') {
        line++;
      }
    }

    return line;
  }

  void setCode(String code) {
    editor.value = code;
    _updateLineNumbers();
  }

  String getCode() {
    return editor.value;
  }

  String getUrlFromCode() {
    String root = web.window.location.href.split('?')[0];
    String encodedCode = base64Encode(getCode());

    return '$root?code=$encodedCode';
  }

  void setCodeFromUrl() {
    String url = web.window.location.href;
    var uri = Uri.parse(url);
    String? code = uri.queryParameters['code'];
    if (code != null && code.isNotEmpty) {
      String decodedCode = base64Decode(code);
      setCode(decodedCode);
    }
  }
}

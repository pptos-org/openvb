import 'package:web/web.dart' as web;
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/openvb/parser.dart';
import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/values.dart';
import 'package:openvb/openvb/interpreter.dart';
import 'package:openvb/constants.dart';
import 'package:openvb/console/console.dart';
import 'package:openvb/util/json.dart';

/*
Const a As Integer = 5
Const b = a + a + 8 + (5 + 8) * 10
Const c As Integer = 8 + b
Const d As Integer = c
 */

Editor editor = Editor();
Console console = Console();

void main() {
  final runCodeButton =
      web.document.querySelector('#run-code') as web.HTMLDivElement;
  final ereaseCodeButton =
      web.document.querySelector('#erease-code') as web.HTMLDivElement;
  final shareButton =
      web.document.querySelector('#share') as web.HTMLDivElement;
  final infoBar =
      web.document.querySelector('#console-compile-time') as web.HTMLDivElement;

  runCodeButton.onClick.listen((event) {
    var compileTime = DateTime.now().millisecondsSinceEpoch;
    try {
      runCode();
    } catch (e) {
      print(e);
    }
    var runTime = DateTime.now().millisecondsSinceEpoch;
    infoBar.innerText = 'Compile Time: ${runTime - compileTime}ms';
  });

  ereaseCodeButton.onClick.listen((event) {
    console.clear();
  });

  editor.setCode(
      'Const a As Integer = 5\nConst b = a + a + 8 + (5 + 8) * 10\nConst c As Integer = 8 + b\nConst d As Integer = c');

  shareButton.onClick.listen((event) {
    String url = editor.getUrlFromCode();
    web.window.navigator.clipboard.writeText(url); // copy to clipboard
  });

  editor.setCodeFromUrl();
}

void runCode() {
  console.printMessage('OpenVisualBasic $version - By Quinten Van Damme');

  final env = Enviroment();
  Parser parser = Parser();
  String sourceCode = editor.getCode();
  Program program = parser.produceAST(sourceCode);
  RuntimeVal result = evaluate(program, env);

  console.printMessage(result.toString());

  Map<String, dynamic> programJson = program.toJson();
  // beautify json
  console.printMessage(prettyJson(programJson));
}

class Editor {
  late web.HTMLTextAreaElement editor;

  Editor() {
    editor = web.document.querySelector('#code') as web.HTMLTextAreaElement;
  }

  void setCode(String code) {
    editor.value = code;
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

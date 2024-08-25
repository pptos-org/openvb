import 'package:web/web.dart' as web;
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/openvb/parser.dart';
import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/values.dart';
import 'package:openvb/openvb/interpreter.dart';
import 'package:openvb/constants.dart';
import 'package:openvb/console/console.dart';
import 'package:openvb/util/json.dart';
import 'package:openvb/web_filesystem/filesystem.dart';
import 'package:openvb/web_editor/editor.dart';

/*
Const a As Integer = 5
Const b = a + a + 8 + (5 + 8) * 10
Const c As Integer = 8 + b
Const d As Integer = c
 */

FileSystem fileSystem = FileSystem();
Editor editor = Editor();
Console console = Console();

Future<void> main() async {
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

  shareButton.onClick.listen((event) {
    String url = editor.getUrlFromCode();
    web.window.navigator.clipboard.writeText(url); // copy to clipboard
  });

  editor.setCodeFromUrl();

  fileSystem.displayAsEmpty();
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

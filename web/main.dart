import 'package:web/web.dart' as web;
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/openvb/parser.dart';
import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/values.dart';
import 'package:openvb/openvb/interpreter.dart';
import 'package:openvb/constants.dart';

/*
Const a As Integer = 5
Const b = a + a + 8 + (5 + 8) * 10
Const c As Integer = 8 + b
Const d As Integer = c
 */

void main() {
  final now = DateTime.now();
  final editor = Editor();
  editor.setCode(
      'Const a As Integer = 5\nConst b = a + a + 8 + (5 + 8) * 10\nConst c As Integer = 8 + b\nConst d As Integer = c');
  final debugger = Debugger();
  debugger.print('OpenVisualBasic $version - By Quinten Van Damme');

  String sourceCode = editor.getCode();

  final env = Enviroment();
  Parser parser = Parser();
  Program program = parser.produceAST(sourceCode);

  var result = evaluate(program, env);

  debugger.print(result.toString());
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
}

class Debugger {
  late web.HTMLDivElement debugger;

  Debugger() {
    debugger =
        web.document.querySelector('#debugger-content') as web.HTMLDivElement;
  }

  void print(String message) {
    debugger.innerText += '$message\n';
  }
}

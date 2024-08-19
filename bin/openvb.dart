import 'package:openvb/io.dart';
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/openvb/parser.dart';
import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/interpreter.dart';
import 'package:openvb/constants.dart';
import 'package:openvb/console/console.dart';

Console console = Console();

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments[0] == '--help') {
    console.printMessage('OpenVisualBasic $version - By Quinten Van Damme');
    console.printMessage('Usage: openvb <file>.vb');
    return;
  } else if (arguments[0] == '--version') {
    console.printMessage('OpenVisualBasic $version - By Quinten Van Damme');
    return;
  } else if (arguments.length > 1) {
    console.printError('Too many arguments');
  }

  Enviroment env = Enviroment();

  String sourceCode = readFile(arguments[0]);
  Parser parser = Parser();
  Program program = parser.produceAST(sourceCode);

  var result = evaluate(program, env);
  console.printMessage(result.toString());
  console.printMessage(program.toString());
}

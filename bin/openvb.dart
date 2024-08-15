import 'package:openvb/error.dart';
import 'package:openvb/io.dart';
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/openvb/parser.dart';
import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/values.dart';
import 'package:openvb/openvb/interpreter.dart';
import 'package:openvb/constants.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments[0] == '--help') {
    print('OpenVisualBasic $version - By Quinten Van Damme');
    print('Usage: openvba <file>.vb');
    return;
  } else if (arguments.length > 1) {
    printError('Too many arguments');
    return;
  }

  Enviroment env = Enviroment();

  String sourceCode = readFile(arguments[0]);
  Parser parser = Parser();
  Program program = parser.produceAST(sourceCode);

  var result = evaluate(program, env);
  print(result);
}

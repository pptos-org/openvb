import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/values.dart';
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/error.dart';
import 'package:openvb/openvb/evaluate/statements.dart';

RuntimeVal evaluate(Stmt astNode, Enviroment env) {
  switch (astNode.kind) {
    case NodeType.numericLiteral:
      return NumberVal((astNode as NumericLiteral).value);
    case NodeType.nullLiteral:
      return NullVal();
    case NodeType.identifier:
      return evaluateIdentifier(astNode as Identifier, env);
    case NodeType.binaryExpr:
      return evaluateBinaryExpr(astNode as BinaryExpr, env);
    case NodeType.program:
      return evaluateProgram(astNode as Program, env);
    case NodeType.variableDeclaration:
      return evaluateVariableDeclaration(astNode as VariableDeclaration, env);
    default:
      printError('Unknown AST node type $astNode');
      throw Exception();
  }
}

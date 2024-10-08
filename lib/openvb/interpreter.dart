import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/values.dart';
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/openvb/evaluate/statements.dart';
import 'package:openvb/console/console.dart';

Console console = Console();

RuntimeVal evaluate(Stmt astNode, Enviroment env) {
  switch (astNode.kind) {
    case NodeType.numericLiteral:
      return NumberVal((astNode as NumericLiteral).value);
    case NodeType.nullLiteral:
      return NullVal();
    case NodeType.booleanLiteral:
      return BooleanVal((astNode as BooleanLiteral).value);
    case NodeType.identifier:
      return evaluateIdentifier(astNode as Identifier, env);
    case NodeType.assignmentExpr:
      return evaluateAssignmentExpr(astNode as AssignmentExpr, env);
    case NodeType.binaryExpr:
      return evaluateBinaryExpr(astNode as BinaryExpr, env);
    case NodeType.program:
      return evaluateProgram(astNode as Program, env);
    case NodeType.variableDeclaration:
      return evaluateVariableDeclaration(astNode as VariableDeclaration, env);
    default:
      console.printError('Unknown AST node type $astNode');
  }
}

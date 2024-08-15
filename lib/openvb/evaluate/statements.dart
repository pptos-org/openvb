import 'package:openvb/openvb/interpreter.dart';
import 'package:openvb/openvb/enviroment.dart';
import 'package:openvb/openvb/values.dart';
import 'package:openvb/openvb/ast.dart';

RuntimeVal evaluateProgram(Program program, Enviroment env) {
  RuntimeVal lastEvaluated = NullVal();

  for (var stmt in program.stmts) {
    lastEvaluated = evaluate(stmt, env);
  }

  return lastEvaluated;
}

RuntimeVal evaluateNumericBinaryExpr(
    RuntimeVal left, RuntimeVal right, String op) {
  double result = 0;

  switch (op) {
    case ('+'):
      result = (left as NumberVal).value + (right as NumberVal).value;
      break;
    case ('-'):
      result = (left as NumberVal).value - (right as NumberVal).value;
      break;
    case ('*'):
      result = (left as NumberVal).value * (right as NumberVal).value;
      break;
    case ('/'):
      if ((right as NumberVal).value == 0) {
        throw Exception('Division by zero');
      }

      result = (left as NumberVal).value / (right as NumberVal).value;
      break;
  }

  return NumberVal(result);
}

RuntimeVal evaluateBinaryExpr(BinaryExpr binop, Enviroment env) {
  RuntimeVal leftHandSide = evaluate(binop.left, env);
  RuntimeVal rightHandSide = evaluate(binop.right, env);

  if (leftHandSide.type == 'Number' && rightHandSide.type == 'Number') {
    return evaluateNumericBinaryExpr(leftHandSide, rightHandSide, binop.op);
  }

  // if one or both are null return null
  return NullVal();
}

RuntimeVal evaluateIdentifier(Identifier identifier, Enviroment env) {
  return env.lookupVar(identifier.symbol);
}

RuntimeVal evaluateVariableDeclaration(
    VariableDeclaration varDecl, Enviroment env) {
  var value = varDecl.value != null ? evaluate(varDecl.value!, env) : NullVal();
  return env.declareVar(varDecl.identifier, value, varDecl.isConstant);
}

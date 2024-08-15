enum NodeType {
  stmt,
  program,
  variableDeclaration,
  expr,
  binaryExpr,
  identifier,
  numericLiteral,
  nullLiteral,
}

class Stmt {
  NodeType kind = NodeType.stmt;

  @override
  String toString() {
    return {"type": "Stmt", "kind": kind}.toString() + '\n';
  }
}

class Program extends Stmt {
  NodeType kind = NodeType.program;
  late List<Stmt> stmts;

  Program(this.stmts);

  @override
  String toString() {
    return {"type": "Program", "stmts": stmts}.toString() + '\n';
  }
}

class VariableDeclaration extends Stmt {
  NodeType kind = NodeType.variableDeclaration;
  late bool isConstant;
  late String identifier;
  late Expr? value;

  VariableDeclaration(this.isConstant, this.identifier, this.value);

  @override
  String toString() {
    return {
          "type": "VariableDeclaration",
          "isConst": isConstant,
          "identifier": identifier,
          "value": value
        }.toString() +
        '\n';
  }
}

class Expr extends Stmt {}

class BinaryExpr extends Expr {
  NodeType kind = NodeType.binaryExpr;
  late Expr left;
  late Expr right;
  late String op;

  BinaryExpr(this.left, this.op, this.right);

  @override
  String toString() {
    return {"type": "BinaryExpr", "left": left, "op": op, "right": right}
            .toString() +
        '\n';
  }
}

class Identifier extends Expr {
  NodeType kind = NodeType.identifier;
  late String symbol;

  Identifier(this.symbol);

  @override
  String toString() {
    return {"type": "Identifier", "symbol": symbol}.toString();
  }
}

class NumericLiteral extends Expr {
  NodeType kind = NodeType.numericLiteral;
  late double value;

  NumericLiteral(this.value);

  @override
  String toString() {
    return {"type": "NumericLiteral", "value": value}.toString() + '\n';
  }
}

void main() {
  var program =
      Program([BinaryExpr(NumericLiteral(1), '+', NumericLiteral(2))]);

  print(program.stmts[0].kind);
  print((program.stmts[0] as BinaryExpr).left.kind);
  print((program.stmts[0] as BinaryExpr).right.kind);
  print((program.stmts[0] as BinaryExpr).op);
}

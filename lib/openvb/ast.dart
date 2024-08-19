import 'package:openvb/console/console.dart';

Console console = Console();

enum NodeType {
  stmt,
  program,
  variableDeclaration,
  expr,
  assignmentExpr,
  binaryExpr,
  identifier,
  numericLiteral,
  booleanLiteral,
  nullLiteral,
}

class Stmt {
  NodeType kind = NodeType.stmt;

  @override
  Map<String, dynamic> toJson() {
    return {"type": "Stmt", "kind": kind};
  }
}

class Program extends Stmt {
  NodeType kind = NodeType.program;
  late List<Stmt> stmts;

  Program(this.stmts);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> stmtsJson =
        stmts.map((stmt) => stmt.toJson()).toList();

    return {"type": "Program", "stmts": stmtsJson};
  }
}

class VariableDeclaration extends Stmt {
  NodeType kind = NodeType.variableDeclaration;
  late bool isConstant;
  late String identifier;
  late Expr? value;

  VariableDeclaration(this.isConstant, this.identifier, this.value);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "VariableDeclaration",
      "isConstant": isConstant,
      "identifier": identifier,
      "value": value == null ? {} : value!.toJson()
    };
  }
}

class Expr extends Stmt {
  @override
  Map<String, dynamic> toJson() {
    return {"type": "Expr", "kind": kind};
  }
}

class AssignmentExpr extends Expr {
  NodeType kind = NodeType.assignmentExpr;
  late Expr assigne;
  late Expr value;

  AssignmentExpr(this.assigne, this.value);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "AssignmentExpr",
      "assigne": assigne.toJson(),
      "value": value.toJson()
    };
  }
}

class BinaryExpr extends Expr {
  NodeType kind = NodeType.binaryExpr;
  late Expr left;
  late Expr right;
  late String op;

  BinaryExpr(this.left, this.op, this.right);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "BinaryExpr",
      "left": left.toJson(),
      "op": op,
      "right": right.toJson()
    };
  }
}

class Identifier extends Expr {
  NodeType kind = NodeType.identifier;
  late String symbol;

  Identifier(this.symbol);

  @override
  Map<String, dynamic> toJson() {
    return {"type": "Identifier", "symbol": symbol};
  }
}

class NumericLiteral extends Expr {
  NodeType kind = NodeType.numericLiteral;
  late double value;

  NumericLiteral(this.value);

  @override
  Map<String, dynamic> toJson() {
    return {"type": "NumericLiteral", "value": value};
  }
}

class BooleanLiteral extends Expr {
  NodeType kind = NodeType.booleanLiteral;
  late bool value;

  BooleanLiteral(String value) {
    value == 'TRUE' ? this.value = true : this.value = false;
  }

  @override
  Map<String, dynamic> toJson() {
    return {"type": "BooleanLiteral", "value": value};
  }
}

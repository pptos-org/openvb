import 'package:openvb/openvb/comments.dart';
import 'package:openvb/openvb/ast.dart';
import 'package:openvb/openvb/lexer.dart';
import 'package:openvb/error.dart';

class Parser {
  late Tokens tokens;
  late Token prevToken;

  bool eof() {
    return tokens.tokens[0].type == 'EOF';
  }

  Token at() {
    return tokens.tokens[0];
  }

  Token eat() {
    prevToken = at();
    tokens.tokens.removeAt(0);
    return at();
  }

  Token prev() {
    return prevToken;
  }

  Token expect(String type, String error) {
    String token =
        tokenMap.firstWhere((element) => element['type'] == type)['id'];

    if (at().type == type) {
      return eat();
    } else {
      printError("$error: Expected $token");
      throw Exception();
    }
  }

  void next() {
    prevToken = at();
    tokens.tokens.removeAt(0);
  }

  produceAST(String sourceCode) {
    sourceCode = removeCommentsFromSourceCode(sourceCode);

    tokens = lexer(sourceCode);

    Program program = Program([]);

    while (!eof()) {
      program.stmts.add(parseStmt());
    }

    return program;
  }

  Stmt parseStmt() {
    switch (at().type) {
      case 'DIM':
        return parseVariableDeclaration();
      case 'CONST':
        return parseConstantDeclaration();
      case 'IDENTIFIER':
        return parseVariableDeclaration();
      default:
        return parseExpr();
    }
  }

  Stmt parseVariableDeclaration() {
    bool isDefined = false;
    if (at().type == 'DIM') {
      eat();
    } else {
      isDefined = true;
    }

    String identifier = at().id;
    expect("IDENTIFIER", "Expected identifier after declaration.");
    if (!isDefined) {
      // Dim a As Integer
      expect("AS", "Expected As token after declaration.");
      eat();

      if (at().type == 'EQUALS') {
        printError("Unexpected token = after declaration.");
        throw Exception();
      }

      return VariableDeclaration(false, identifier, null);
    } else {
      // a = 1
      expect("EQUALS", "Expected = token after declaration.");
      return VariableDeclaration(false, identifier, parseExpr());
    }
  }

  // Const test = 5
  // Const test As Integer = 5

  Stmt parseConstantDeclaration() {
    eat();
    String identifier = at().id;
    expect("IDENTIFIER", "Expected identifier after declaration.");

    if (at().type != 'AS' && at().type != 'EQUALS') {
      printError("Expected As or = token after declaration.");
      throw ();
    }

    if (at().type == 'EQUALS') {
      eat();
      return VariableDeclaration(true, identifier, parseExpr());
    }

    eat();
    eat();

    expect("EQUALS", "Expected = token after declaration.");

    return VariableDeclaration(true, identifier, parseExpr());
  }

  Expr parseExpr() {
    return parseAdditiveExpr();
  }

  Expr parseAdditiveExpr() {
    Expr left = parseMultiplicitaveExpr();

    while (at().type == 'PLUS' || at().type == 'MINUS') {
      String operator = at().id;
      eat();
      Expr right = parseMultiplicitaveExpr();
      left = BinaryExpr(left, operator, right);
    }

    return left;
  }

  Expr parseMultiplicitaveExpr() {
    Expr left = parsePrimaryExpr();

    while (at().type == 'DIVIDE' || at().type == 'MULTIPLY') {
      String operator = at().id;
      eat();
      Expr right = parsePrimaryExpr();
      left = BinaryExpr(left, operator, right);
    }

    return left;
  }

  Expr parsePrimaryExpr() {
    late Expr expr;
    Token token = at();
    String tokenType = token.type;

    print('Parsing primary expression: $tokenType');

    switch (tokenType) {
      case 'DIM':
        expr = Identifier(eat().id);
        next();
        return expr;
      case 'IDENTIFIER':
        expr = Identifier(at().id);
        next();
        return expr;
      case 'NUMBER':
        expr = NumericLiteral(at().value);
        next();
        return expr;
      case 'LPAREN':
        eat();
        if (at().type == 'RPAREN') {
          return Expr();
        }
        expr = parseExpr();
        expect('RPAREN', 'Expected closing parenthesis');
        return expr;

      default:
        printWarning('Unexpected token: $token');
        next();
        return Expr();

      //exit(0);
    }
  }
}

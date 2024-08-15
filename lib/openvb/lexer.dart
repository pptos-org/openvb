Set<Map<String, dynamic>> tokenMap = {
  {'id': 'As', 'type': 'AS', 'value': null},
  {'id': 'Const', 'type': 'CONST', 'value': null},
  {'id': 'Declare', 'type': 'DECLARE', 'value': null},
  {'id': 'Dim', 'type': 'DIM', 'value': null},
  {'id': 'Function', 'type': 'FUNCTION', 'value': null},
  {'id': 'Name', 'type': 'NAME', 'value': null},
  {'id': 'Open', 'type': 'OPEN', 'value': null},
  {'id': 'Private', 'type': 'PRIVATE', 'value': null},
  {'id': 'Property Get', 'type': 'PROPERTY_GET', 'value': null},
  {'id': 'Property Let', 'type': 'PROPERTY_LET', 'value': null},
  {'id': 'Property Set', 'type': 'PROPERTY_SET', 'value': null},
  {'id': 'ReDim', 'type': 'REDIM', 'value': null},
  {'id': 'Sub', 'type': 'SUB', 'value': null},
  {'id': 'Type', 'type': 'TYPE', 'value': null},
  {'id': 'Binary', 'type': 'BINARY', 'value': null},
  {'id': 'ByRef', 'type': 'BYREF', 'value': null},
  {'id': 'Call', 'type': 'CALL', 'value': null},
  {'id': 'ByVal', 'type': 'BYVAL', 'value': null},
  {'id': 'Date', 'type': 'DATE', 'value': null},
  {'id': 'Else', 'type': 'ELSE', 'value': null},
  {'id': 'Empty', 'type': 'EMPTY', 'value': null},
  {'id': 'Error', 'type': 'ERROR', 'value': null},
  {'id': 'False', 'type': 'FALSE', 'value': null}, // int = 0 string = false
  {'id': 'For', 'type': 'FOR', 'value': null},
  {'id': 'Each', 'type': 'EACH', 'value': null},
  {'id': 'Friend', 'type': 'FRIEND', 'value': null},
  {'id': 'Get', 'type': 'GET', 'value': null},
  {'id': 'Input', 'type': 'INPUT', 'value': null},
  {'id': 'Is', 'type': 'IS', 'value': null},
  {'id': 'Case', 'type': 'CASE', 'value': null},
  {'id': 'Len', 'type': 'LEN', 'value': null},
  {'id': 'Let', 'type': 'LET', 'value': null},
  {'id': 'Lock', 'type': 'LOCK', 'value': null},
  {'id': 'Unlock', 'type': 'UNLOCK', 'value': null},
  {'id': 'Me', 'type': 'ME', 'value': null},
  {'id': 'Mid', 'type': 'MID', 'value': null},
  {'id': 'Med', 'type': 'MED', 'value': null},
  {'id': 'New', 'type': 'NEW', 'value': null},
  {'id': 'Next', 'type': 'NEXT', 'value': null},
  {'id': 'Nothing', 'type': 'NOTHING', 'value': null},
  {'id': 'Null', 'type': 'NULL', 'value': null},
  {'id': 'On', 'type': 'ON', 'value': null},
  {'id': 'GoSub', 'type': 'GOSUB', 'value': null},
  {'id': 'GoTo', 'type': 'GOTO', 'value': null},
  {'id': 'Option', 'type': 'OPTION', 'value': null},
  {'id': 'Optional', 'type': 'OPTIONAL', 'value': null},
  {'id': 'ParamArray', 'type': 'PARAMARRAY', 'value': null},
  {'id': 'Print', 'type': 'PRINT', 'value': null},
  {'id': 'Property', 'type': 'PROPERTY', 'value': null},
  {'id': 'PtrSafe', 'type': 'PTRSAFE', 'value': null},
  {'id': 'Public', 'type': 'PUBLIC', 'value': null},
  {'id': 'Resume', 'type': 'RESUME', 'value': null},
  {'id': 'Seek', 'type': 'SEEK', 'value': null},
  {'id': 'Set', 'type': 'SET', 'value': null},
  {'id': 'Static', 'type': 'STATIC', 'value': null},
  {'id': 'Step', 'type': 'STEP', 'value': null},
  {'id': 'String', 'type': 'STRING', 'value': null},
  {'id': 'Then', 'type': 'THEN', 'value': null},
  {'id': 'Time', 'type': 'TIME', 'value': null},
  {'id': 'To', 'type': 'TO', 'value': null},
  {'id': 'True', 'type': 'TRUE', 'value': null}, // int = -1 string = true
  {'id': 'WithEvents', 'type': 'WITHEVENTS', 'value': null},
  {'id': 'End', 'type': 'END', 'value': null},
  {'id': 'Boolean', 'type': "BOOLEAN", 'value': null},
  {'id': 'Byte', 'type': "BYTE", 'value': null},
  {'id': 'Collection', 'type': "COLLECTION", 'value': null},
  {'id': 'Currency', 'type': "CURRENCY", 'value': null},
  {'id': 'Date', 'type': "DATE", 'value': null},
  {'id': 'Decimal', 'type': "DECIMAL", 'value': null},
  {'id': 'Dictionary', 'type': "DICTIONARY", 'value': null},
  {'id': 'Double', 'type': "DOUBLE", 'value': null},
  {'id': 'Integer', 'type': "INTEGER", 'value': null},
  {'id': 'Long', 'type': "LONG", 'value': null},
  {'id': 'LongLong', 'type': "LONGLONG", 'value': null},
  {'id': 'LongPtr', 'type': "LONGPTR", 'value': null},
  {'id': 'Object', 'type': "OBJECT", 'value': null},
  {'id': 'Single', 'type': "SINGLE", 'value': null},
  {'id': 'String', 'type': "STRING", 'value': null},
  {'id': 'Variant', 'type': "VARIANT", 'value': null},
  {'id': 'User-defined', 'type': "USERDEFINED", 'value': null},
  {'id': '=', 'type': 'EQUALS', 'value': null},
  {'id': '+', 'type': 'PLUS', 'value': null},
  {'id': '-', 'type': 'MINUS', 'value': null},
  {'id': '*', 'type': 'MULTIPLY', 'value': null},
  {'id': '/', 'type': 'DIVIDE', 'value': null},
  {'id': '^', 'type': 'POWER', 'value': null},
  {'id': '(', 'type': 'LPAREN', 'value': null},
  {'id': ')', 'type': 'RPAREN', 'value': null},
  {'id': ',', 'type': 'COMMA', 'value': null},
  {'id': ';', 'type': 'SEMICOLON', 'value': null},
  {'id': ':', 'type': 'COLON', 'value': null},
  {'id': '<', 'type': 'LESS', 'value': null},
  {'id': '>', 'type': 'GREATER', 'value': null},
  {'id': '<=', 'type': 'LESS_EQUAL', 'value': null},
  {'id': '>=', 'type': 'GREATER_EQUAL', 'value': null},
  {'id': '#', 'type': 'HASH', 'value': null},
  {'id': '"', 'type': 'QUOTE', 'value': null},
  {'id': "'", 'type': 'APOSTROPHE', 'value': null},
  {'id': '!', 'type': 'NOT_APOSTROPHE', 'value': null},
  {'id': '%', 'type': 'PERCENT', 'value': null},
  {'id': "\$", 'type': 'DOLLAR_SIGN', 'value': null},
  {'id': '&', 'type': 'AMPERSAND', 'value': null},
  {'id': '|', 'type': 'PIPE', 'value': null},
  {'id': '@', 'type': 'AT', 'value': null},
  {'id': '^', 'type': 'CARET', 'value': null},
  {'id': 'MsgBox', 'type': 'BUILDIN_MSGBOX', 'value': null},
  {'id': 'IDENTIFIER', 'type': 'IDENTIFIER', 'value': null},
  {'id': '', 'type': 'NUMBER', 'value': null},
  {'id': 'EOF', 'type': 'EOF', 'value': 'EOF'},
};

class Token {
  late String id;
  late String type;
  late dynamic value;
  late int index;
  late int startIndex;
  late int endIndex;
  late int line;

  Token(this.id, this.type, this.value,
      {this.startIndex = 0, this.endIndex = 0, this.line = 0});

  set setIndex(int index) {
    this.index = index;
  }

  @override
  String toString() {
    return {
      'id': id,
      'type': type,
      'value': value,
      'index': index,
      'startIndex': startIndex,
      'endIndex': endIndex,
      'line': line
    }.toString();
  }
}

class Tokens {
  List<Token> tokens = [];
  int index = 0;

  void add(Token token) {
    token.setIndex = index;
    tokens.add(token);
    index++;
  }

  void sort() {
    tokens.sort((a, b) => a.index.compareTo(b.index));

    for (int i = 0; i < tokens.length; i++) {
      tokens[i].setIndex = i;
    }
  }

  Token getAt(int index) {
    return tokens[index];
  }

  List<Token> getRange(int start, int end) {
    List<Token> tokenList = [];
    for (int i = start; i < end; i++) {
      tokenList.add(tokens[i]);
    }

    return tokenList;
  }

  List<Token> getAll() {
    return tokens;
  }

  int size() {
    return tokens.length;
  }
}

Tokens lexer(String program) {
  Tokens tokens = Tokens();
  List<String> lines = program.split('\n');
  String wordBuffer = '';
  int startIndex = 0;
  int endIndex = 0;
  int lineIndex = 1;

  for (String line in lines) {
    for (int i = 0; i < line.length; i++) {
      String char = line[i];

      if (char == ' ' || char == '\t') {
        if (wordBuffer.isNotEmpty) {
          addToken(wordBuffer, tokens, startIndex, endIndex, lineIndex);
          wordBuffer = '';
          startIndex = i + 1;
          endIndex = startIndex;
        }
      } else if (isSymbol(char)) {
        if (wordBuffer.isNotEmpty) {
          addToken(wordBuffer, tokens, startIndex, endIndex, lineIndex);
          wordBuffer = '';
          startIndex = i + 1;
          endIndex = startIndex;
        }
        addToken(char, tokens, i, i + 1, lineIndex);
      } else {
        wordBuffer += char;
        endIndex++;
      }
    }

    if (wordBuffer.isNotEmpty) {
      addToken(wordBuffer, tokens, startIndex, endIndex, lineIndex);
      wordBuffer = '';
      startIndex = 0;
      endIndex = 0;
    }

    lineIndex++;
  }

  // add EOF token
  addToken('EOF', tokens, 0, 0, lineIndex);

  return tokens;
}

void addToken(
    String word, Tokens tokens, int startIndex, int endIndex, int lineIndex) {
  word = word.replaceAll('\r', '');

  if (word.isEmpty) {
    return;
  }

  var token = tokenMap
      .firstWhere((element) => element['id'] == word || element['type'] == word,
          orElse: () {
    var parsedValue = double.tryParse(word);
    if (parsedValue == null) {
      return {'id': word, 'type': 'IDENTIFIER', 'value': null};
    } else {
      return {'id': '', 'type': 'NUMBER', 'value': parsedValue};
    }
  });

  tokens.add(Token(token['id'], token['type'], token['value'],
      startIndex: startIndex, endIndex: endIndex, line: lineIndex));
}

bool isSymbol(String char) {
  return tokenMap.any((element) => element['id'] == char);
}

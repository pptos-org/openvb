class ValueType {
  final String type;

  ValueType(this.type);
}

class RuntimeVal {
  final ValueType valueType;

  RuntimeVal(this.valueType);

  get type => valueType.type;

  @override
  String toString() {
    return {"type": type}.toString();
  }
}

class NullVal extends RuntimeVal {
  final String value = 'null';

  NullVal() : super(ValueType('Null'));

  @override
  String toString() {
    return {"type": "$type", "value": value}.toString();
  }
}

class NumberVal extends RuntimeVal {
  final double value;

  NumberVal(this.value) : super(ValueType('Number'));

  @override
  String toString() {
    return {"type": "$type", "value": value}.toString();
  }
}

class BooleanVal extends RuntimeVal {
  final bool value;

  BooleanVal(this.value) : super(ValueType('Boolean'));

  @override
  String toString() {
    return {"type": type, "value": value}.toString();
  }
}

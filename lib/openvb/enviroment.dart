import 'package:openvb/error.dart';
import 'package:openvb/openvb/values.dart';

class Enviroment {
  final Enviroment? _parent;
  Map<String, RuntimeVal> _variables = {};

  Enviroment([this._parent]) {
    _variables = {};
  }

  RuntimeVal declareVar(String name, RuntimeVal value, bool isConstant) {
    if (_variables.containsKey(name) && isConstant) {
      printError('Variable $name already declared');
      throw Exception();
    }

    _variables[name] = value;
    return value;
  }

  RuntimeVal assignVar(String name, RuntimeVal value) {
    Enviroment env = reslove(name);
    env._variables[name] = value;
    return value;
  }

  RuntimeVal lookupVar(String name) {
    var env = reslove(name);
    return env._variables[name] as RuntimeVal;
  }

  Enviroment reslove(String name) {
    if (_variables.containsKey(name)) {
      return this;
    }

    if (_parent == null) {
      printError('Variable "$name" not found');
      throw Exception();
    }

    return _parent.reslove(name);
  }

  @override
  String toString() {
    String output = '';
    for (var key in _variables.keys) {
      output += '$key: ${_variables[key]}\n';
    }
    return output;
  }
}

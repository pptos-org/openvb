import 'package:openvb/openvb/values.dart';
import 'package:openvb/console/console.dart';

Console console = Console();

class Enviroment {
  final Enviroment? _parent;
  Map<String, RuntimeVal> _variables = {};
  Map<String, RuntimeVal> _constants = {};

  Enviroment([this._parent]) {
    _variables = {};
    _constants = {};
  }

  RuntimeVal declareVar(String name, RuntimeVal value, bool isConstant) {
    if ((_variables.containsKey(name) && isConstant) ||
        (_constants.containsKey(name) && isConstant)) {
      console.printError('Variable $name already declared');
    }

    if (isConstant) {
      _constants[name] = value;
    } else {
      _variables[name] = value;
    }

    return value;
  }

  RuntimeVal assignVar(String name, RuntimeVal value) {
    Enviroment env = reslove(name);

    if (env._constants.containsKey(name)) {
      console.printError('Cannot reassign constant "$name"');
    }

    env._variables[name] = value;
    return value;
  }

  RuntimeVal lookupVar(String name) {
    var env = reslove(name);

    if (env._constants.containsKey(name)) {
      return env._constants[name] as RuntimeVal;
    } else if (env._variables.containsKey(name)) {
      return env._variables[name] as RuntimeVal;
    } else {
      console.printError('Variable "$name" not found');
    }
  }

  Enviroment reslove(String name) {
    if (_variables.containsKey(name)) {
      return this;
    } else if (_constants.containsKey(name)) {
      return this;
    }

    if (_parent == null) {
      console.printError('Variable "$name" not found');
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

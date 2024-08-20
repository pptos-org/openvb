import 'dart:convert';
import 'package:openvb/console/console.dart';

Console console = Console();

String prettyJson(dynamic json) {
  var spaces = ' ' * 4;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

String base64Encode(String input) {
  try {
    return base64.encode(utf8.encode(input));
  } catch (e) {
    console.printError('Error encoding base64: $e');
  }
}

String base64Decode(String input) {
  try {
    return utf8.decode(base64.decode(input));
  } catch (e) {
    console.printError('Error decoding base64: $e');
  }
}

import 'dart:io';
import 'package:openvb/error.dart';

String readFile(String path) {
  if (!File(path).existsSync()) {
    printError('File not found: $path');
    throw Exception();
  }

  File file = File(path);
  return file.readAsStringSync();
}

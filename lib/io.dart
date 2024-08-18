import 'dart:io';
import 'package:openvb/console/console.dart';

Console console = Console();

String readFile(String path) {
  if (!File(path).existsSync()) {
    console.printError('File not found: $path');
  }

  File file = File(path);
  return file.readAsStringSync();
}

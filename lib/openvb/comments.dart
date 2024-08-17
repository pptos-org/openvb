String removeCommentsFromSourceCode(String text) {
  List<String> lines = text.split('\n');
  bool isCommend = false;

  for (int i = 0; i < lines.length; i++) {
    if (isCommend) {
      if (lines[i].endsWith(' _\r')) {
        isCommend = true;
        lines[i] = '';
      } else {
        isCommend = false;
        lines[i] = '';
      }
    }

    if (lines[i].contains("'")) {
      if (lines[i].endsWith(' _\r') || lines[i].endsWith(' _\n')) {
        isCommend = true;
      } else {
        isCommend = false;
      }

      lines[i] = lines[i].split("'")[0];
    }
  }

  return lines.join('\n');
}

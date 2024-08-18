class Console {
  void printError(String message) {
    print('\x1B[31m$message\x1B[0m');
  }

  void printWarning(String message) {
    print('\x1B[33m$message\x1B[0m');
  }

  void printMessage(String message) {
    print(message);
  }

  void clear() {
    print('\x1B[2J\x1B[H');
  }

  void scrollToEnd() {
    throw UnsupportedError('Cannot scroll to end in console');
  }
}

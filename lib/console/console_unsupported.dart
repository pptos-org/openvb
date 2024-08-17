class Console {
  void printError(String message) {
    throw UnsupportedError('Cannot print error in console');
  }

  void printWarning(String message) {
    throw UnsupportedError('Cannot print warning in console');
  }

  void printMessage(String message) {
    throw UnsupportedError('Cannot print message in console');
  }
}

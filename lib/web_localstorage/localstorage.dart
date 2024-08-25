import 'package:web/web.dart' as web;

class LocalStorage {
  late web.Storage storage;

  LocalStorage() {
    storage = web.window.localStorage;
  }

  void setItem(String key, dynamic value) {
    storage.setItem(key, value);
  }

  dynamic getItem(String key) {
    return storage.getItem(key);
  }
}

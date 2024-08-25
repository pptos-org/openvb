import 'package:web/web.dart' as web;
import 'package:openvb/util/json.dart';

class Editor {
  late web.HTMLTextAreaElement editor;

  Editor() {
    editor = web.document.querySelector('#code') as web.HTMLTextAreaElement;
  }

  void setCode(String code) {
    editor.value = code;
  }

  String getCode() {
    return editor.value;
  }

  String getUrlFromCode() {
    String root = web.window.location.href.split('?')[0];
    String encodedCode = base64Encode(getCode());

    return '$root?code=$encodedCode';
  }

  void setCodeFromUrl() {
    String url = web.window.location.href;
    var uri = Uri.parse(url);
    String? code = uri.queryParameters['code'];
    if (code != null && code.isNotEmpty) {
      String decodedCode = base64Decode(code);
      setCode(decodedCode);
    }
  }
}

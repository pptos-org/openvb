export 'console_unsupported.dart'
    if (dart.library.js_interop) 'console_web.dart'
    if (dart.library.io) 'console_io.dart';

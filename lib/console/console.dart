export 'console_unsupported.dart'
    if (dart.library.js) 'console_web.dart'
    if (dart.library.io) 'console_io.dart';

// ignore_for_file: unused_import

export 'navit_stub_adapter.dart'
    if (dart.library.io) 'navit_io_adapter.dart'
    if (dart.library.js) 'navit_web_adapter.dart';
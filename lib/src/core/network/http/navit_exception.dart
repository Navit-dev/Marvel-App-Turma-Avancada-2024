import 'package:marvel_app/src/core/core.dart';

class NavitHttpException extends MarvelAppException {
  NavitHttpException(this._statusCode, this._statusMessage, [this._data])
      : super(
          code: _statusCode,
          message: _statusMessage,
          data: _data,
        );

  final int _statusCode;
  int get statusCode => _statusCode;
  final String _statusMessage;
  String get statusMessage => _statusMessage;
  final Map<String, dynamic>? _data;

  @override
  String toString() {
    return '[$_statusCode] $_statusMessage - $_data';
  }
}

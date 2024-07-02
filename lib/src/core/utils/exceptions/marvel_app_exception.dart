class MarvelAppException implements Exception {
  final int code;
  final String message;
  final String? errorMessage;
  final StackTrace? stackTrace;
  final Map<String, dynamic>? data;

  MarvelAppException({
    this.code = 0,
    required this.message,
    this.errorMessage,
    this.stackTrace,
    this.data,
  });

  @override
  String toString() {
    return "MarvelAppException: [$code] - $message";
  }
}

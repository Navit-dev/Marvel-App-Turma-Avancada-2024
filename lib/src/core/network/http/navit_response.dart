class NavitResponse {
  NavitResponse(
    this.statusCode,
    this.statusMessage,
    this.data,
    this.headers,
  );

  final int statusCode;
  final String statusMessage;
  final Map<String, dynamic> headers;
  final dynamic data;

  NavitResponse copyWith({
    int? statusCode,
    String? statusMessage,
    Map<String, dynamic>? headers,
    dynamic data,
  }) =>
      NavitResponse(
        statusCode ?? this.statusCode,
        statusMessage ?? this.statusMessage,
        data ?? this.data,
        headers ?? this.headers,
      );
}

abstract class INavitRequest {
  NavitHttpMethod get method => NavitHttpMethod.get;
  String get path;
  Map<String, dynamic> get headers => {};
  dynamic get body => {};
  Map<String, String>? get queryParams => null;
  Map<String, dynamic> get extras => {};
}

enum NavitHttpMethod {
  get,
  post;

  @override
  String toString() {
    return name.toUpperCase();
  }
}

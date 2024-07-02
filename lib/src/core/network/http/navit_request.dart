abstract class INavitRequest {
  NavitHttpMethod get method => NavitHttpMethod.get;
  String get path;
  Map<String, dynamic> get headers => {};
  dynamic get body => {};
  Map<String, String> get queryParams => {};
 
}


enum NavitHttpMethod {
  get,
  post;

  @override
  String toString() {
    return name.toUpperCase();
  }
}
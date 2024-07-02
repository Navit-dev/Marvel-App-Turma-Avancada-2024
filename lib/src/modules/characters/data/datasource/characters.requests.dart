import 'package:marvel_app/src/core/core.dart';

class CharactersRequest extends INavitRequest {
  @override
  String get path => '/v1/public/characters';
}

class CharacterIDRequest extends INavitRequest {
  final String id;

  CharacterIDRequest({required this.id});
  @override
  String get path => '/v1/public/characters/$id';
}

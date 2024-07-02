import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/characters/data/datasource/characters.datasource.interface.dart';
import 'package:marvel_app/src/modules/characters/data/datasource/characters.requests.dart';

class CharactersDatasourceRemote implements ICharactersDatasource {
  final NavitHttpClient http;

  CharactersDatasourceRemote(this.http);

  @override
  Future<Either<MarvelAppException, CharacterData>> getCharacterById(
      String id) async {
    return resolveRequest<CharacterData>(
      http.request,
      CharacterIDRequest(id: id),
      (data) {
        CharactersResult result = CharactersResult.fromJson(data);
        return result.data.results.first;
      },
    );
  }

  @override
  Future<Either<MarvelAppException, List<CharacterData>>>
      getCharacters() async {
    return resolveRequest<List<CharacterData>>(
      http.request,
      CharactersRequest(),
      (data) {
        CharactersResult result = CharactersResult.fromJson(data);
        return result.data.results;
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/characters/data/datasource/characters.datasource.interface.dart';

import 'characters.repository.interface.dart';

class CharactersRepository implements ICharactersRepository {
  final ICharactersDatasource datasource;

  CharactersRepository(this.datasource);

  @override
  Future<Either<MarvelAppException, CharacterData>> getCharacterById(
      String id) async {
    return datasource.getCharacterById(id);
  }

  @override
  Future<Either<MarvelAppException, List<CharacterData>>>
      getCharacters() async {
    return datasource.getCharacters();
  }
}

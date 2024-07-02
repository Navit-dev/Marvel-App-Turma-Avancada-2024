import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/core.dart';

abstract class ICharactersRepository {
  Future<Either<MarvelAppException, CharacterData>> getCharacterById(String id);
  Future<Either<MarvelAppException, List<CharacterData>>> getCharacters();
}

import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/core.dart';

abstract class ICharactersDatasource {
  Future<Either<MarvelAppException, List<CharacterData>>> getCharacters();
  Future<Either<MarvelAppException, CharacterData>> getCharacterById(String id);
}

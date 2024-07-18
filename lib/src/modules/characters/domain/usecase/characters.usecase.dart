import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/characters/data/repository/characters.repository.interface.dart';

class CharactersUsecase extends UseCase<List<CharacterData>, NoParams> {
  final ICharactersRepository repository;

  CharactersUsecase(this.repository);

  @override
  Future<Either<MarvelAppException, List<CharacterData>>> call(
      NoParams params) {

    return repository.getCharacters();
  }
}

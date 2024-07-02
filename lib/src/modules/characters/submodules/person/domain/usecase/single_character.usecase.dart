import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/characters/data/repository/characters.repository.interface.dart';

class SingleCharacterUsecase
    extends UseCase<CharacterData, SingleCharacterUseCaseParams> {
  final ICharactersRepository repository;

  SingleCharacterUsecase(this.repository);

  @override
  Future<Either<MarvelAppException, CharacterData>> call(
      SingleCharacterUseCaseParams params) {
    return repository.getCharacterById(params.id);
  }
}

class SingleCharacterUseCaseParams extends Params {
  final String id;

  SingleCharacterUseCaseParams(this.id);
}

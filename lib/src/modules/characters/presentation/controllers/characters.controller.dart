import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/characters/presentation/bloc/characters.bloc.dart';

class CharactersController {
  final UseCase<List<CharacterData>, NoParams> useCase;

  CharactersController(this.useCase);

  Future<void> getCharacters() async {
    marvelDI<CharactersBloc>().add(OnLoadingCharactersEvent());
    final result = await useCase.call(NoParams());
    result.fold((error) {
      marvelDI<CharactersBloc>().add(OnErrorCharactersEvent(error));
    }, (value) {
      marvelDI<CharactersBloc>().add(OnSuccessCharactersEvent(value));
    });
  }
}

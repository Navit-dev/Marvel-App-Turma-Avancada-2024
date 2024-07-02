part of 'characters.bloc.dart';

abstract class CharactersState {
  const CharactersState();
}

class IdleCharactersState extends CharactersState {}

class LoadingCharactersState extends CharactersState {}

class SuccessCharactersState extends CharactersState
    with SuccessMarvelState<List<CharacterData>> {
  @override
  final List<CharacterData> value;

  SuccessCharactersState(this.value);
}

class ErrorCharactersState extends CharactersState with ErrorMarvelState<MarvelAppException> {
  @override
  final MarvelAppException error;

  ErrorCharactersState(this.error);
}

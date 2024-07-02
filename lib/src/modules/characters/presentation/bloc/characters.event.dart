part of 'characters.bloc.dart';

abstract class CharactersEvent {
  const CharactersEvent();
}

class OnIdleCharactersEvent extends CharactersEvent {}

class OnLoadingCharactersEvent extends CharactersEvent {}

class OnSuccessCharactersEvent extends CharactersEvent {
  final List<CharacterData> value;

  OnSuccessCharactersEvent(this.value);
}

class OnErrorCharactersEvent extends CharactersEvent {
  final MarvelAppException error;

  OnErrorCharactersEvent(this.error);
}

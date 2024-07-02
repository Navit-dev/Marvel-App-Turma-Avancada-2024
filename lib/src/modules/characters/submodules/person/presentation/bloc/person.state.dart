part of 'person.bloc.dart';

abstract class PersonState {
  const PersonState();
}

class IdlePersonState extends PersonState {}

class LoadingPersonState extends PersonState {}

class SuccessPersonState extends PersonState
    with SuccessMarvelState<CharacterData> {
  @override
  final CharacterData value;

  SuccessPersonState(this.value);
}

class ErrorPersonState extends PersonState with ErrorMarvelState<MarvelAppException> {
  @override
  final MarvelAppException error;

  ErrorPersonState(this.error);
}

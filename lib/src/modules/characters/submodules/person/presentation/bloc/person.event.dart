part of 'person.bloc.dart';

abstract class PersonEvent {
  const PersonEvent();
}

class OnIdlePersonEvent extends PersonEvent {}

class OnLoadingPersonEvent extends PersonEvent {}

class OnSuccessPersonEvent extends PersonEvent {
  final CharacterData value;

  OnSuccessPersonEvent(this.value);
}

class OnErrorPersonEvent extends PersonEvent {
  final MarvelAppException error;

  OnErrorPersonEvent(this.error);
}

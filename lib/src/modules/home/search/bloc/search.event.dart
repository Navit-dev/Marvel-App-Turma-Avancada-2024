part of 'search.bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class OnIdleSearchEvent extends SearchEvent {}

class OnLoadingSearchEvent extends SearchEvent {}

class OnSuccessSearchEvent extends SearchEvent {
  final List<ChampionModel> value;

  OnSuccessSearchEvent(this.value);
}

class OnErrorSearchEvent extends SearchEvent {
  final MarvelAppException error;

  OnErrorSearchEvent(this.error);
}

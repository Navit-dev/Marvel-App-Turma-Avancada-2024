part of 'search.bloc.dart';

abstract class SearchState {
  const SearchState();
}

class IdleSearchState extends SearchState {}

class LoadingSearchState extends SearchState {}

class SuccessSearchState extends SearchState
    with SuccessMarvelState<List<ChampionModel>> {
  @override
  final List<ChampionModel> value;

  SuccessSearchState(this.value);
}

class ErrorSearchState extends SearchState with ErrorMarvelState<MarvelAppException> {
  @override
  final MarvelAppException error;

  ErrorSearchState(this.error);
}

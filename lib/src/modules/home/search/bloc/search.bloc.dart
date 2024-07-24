import 'package:marvel_app/src/core/core.dart';
import 'package:bloc/bloc.dart';

part 'search.event.dart';
part 'search.state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(IdleSearchState()) {
    on<OnIdleSearchEvent>(_onIdle);
    on<OnLoadingSearchEvent>(_onLoading);
    on<OnSuccessSearchEvent>(_onSuccessResult);
    on<OnErrorSearchEvent>(_onErrorResult);
  }

  _onIdle(OnIdleSearchEvent event, Emitter<SearchState> emitter) {
    emitter(IdleSearchState());
  }

  _onLoading(OnLoadingSearchEvent event, Emitter<SearchState> emitter) {
    emitter(LoadingSearchState());
  }

  _onSuccessResult(
      OnSuccessSearchEvent event, Emitter<SearchState> emitter) {
    emitter(SuccessSearchState(event.value));
  }

  _onErrorResult(
      OnErrorSearchEvent event, Emitter<SearchState> emitter) {
    emitter(ErrorSearchState(event.error));
  }
}

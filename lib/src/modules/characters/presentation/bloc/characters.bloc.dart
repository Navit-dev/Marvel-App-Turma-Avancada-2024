import 'package:marvel_app/src/core/core.dart';
import 'package:bloc/bloc.dart';

part 'characters.event.dart';
part 'characters.state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(IdleCharactersState()) {
    on<OnIdleCharactersEvent>(_onIdle);
    on<OnLoadingCharactersEvent>(_onLoading);
    on<OnSuccessCharactersEvent>(_onSuccessResult);
    on<OnErrorCharactersEvent>(_onErrorResult);
  }

  _onIdle(OnIdleCharactersEvent event, Emitter<CharactersState> emitter) {
    emitter(IdleCharactersState());
  }

  _onLoading(OnLoadingCharactersEvent event, Emitter<CharactersState> emitter) {
    emitter(LoadingCharactersState());
  }

  _onSuccessResult(
      OnSuccessCharactersEvent event, Emitter<CharactersState> emitter) {
    emitter(SuccessCharactersState(event.value));
  }

  _onErrorResult(
      OnErrorCharactersEvent event, Emitter<CharactersState> emitter) {
    emitter(ErrorCharactersState(event.error));
  }
}

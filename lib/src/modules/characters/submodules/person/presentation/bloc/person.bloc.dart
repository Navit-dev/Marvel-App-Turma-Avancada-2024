import 'package:marvel_app/src/core/core.dart';
import 'package:bloc/bloc.dart';

part 'person.event.dart';
part 'person.state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(IdlePersonState()) {
    on<OnIdlePersonEvent>(_onIdle);
    on<OnLoadingPersonEvent>(_onLoading);
    on<OnSuccessPersonEvent>(_onSuccessResult);
    on<OnErrorPersonEvent>(_onErrorResult);
  }

  _onIdle(OnIdlePersonEvent event, Emitter<PersonState> emitter) {
    emitter(IdlePersonState());
  }

  _onLoading(OnLoadingPersonEvent event, Emitter<PersonState> emitter) {
    emitter(LoadingPersonState());
  }

  _onSuccessResult(
      OnSuccessPersonEvent event, Emitter<PersonState> emitter) {
    emitter(SuccessPersonState(event.value));
  }

  _onErrorResult(
      OnErrorPersonEvent event, Emitter<PersonState> emitter) {
    emitter(ErrorPersonState(event.error));
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/domain/usecase/single_character.usecase.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/presentation/bloc/person.bloc.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/presentation/controller/person.controller.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/presentation/view/person.page.dart';

class PersonModule extends Module {
  @override
  void binds(i) {
    // domain
    i.addInstance<SingleCharacterUsecase>(SingleCharacterUsecase(marvelDI()));
    // presentation
    i.addInstance<PersonBloc>(PersonBloc());
    // i.addInstance<CharactersResult>(CharactersResult.fromJson(API_MOCK_MAP));
    i.addInstance<PersonController>(PersonController(
      useCase: i<SingleCharacterUsecase>(),
      // i<SingleCharacterUsecase>()
    ));
  }

  @override
  void routes(r) {
    r.child(
      '/:id',
      child: (_) => PersonPage(
        id: r.args.params['id'],
      ),
    );
  }
}

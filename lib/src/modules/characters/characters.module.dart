import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/characters/data/datasource/characters.datasource.interface.dart';
import 'package:marvel_app/src/modules/characters/data/datasource/characters.datasource.remote.dart';
import 'package:marvel_app/src/modules/characters/data/repository/characters.repository.dart';
import 'package:marvel_app/src/modules/characters/data/repository/characters.repository.interface.dart';
import 'package:marvel_app/src/modules/characters/domain/usecase/characters.usecase.dart';
import 'package:marvel_app/src/modules/characters/presentation/bloc/characters.bloc.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/person.module.dart';
import 'package:marvel_app/src/modules/characters/presentation/controllers/characters.controller.dart';
import 'package:marvel_app/src/modules/characters/presentation/view/characters.page.dart';

class CharactersModule extends Module {
  @override
  void binds(i) {
    // data
    i.addInstance<ICharactersDatasource>(
        CharactersDatasourceRemote(marvelDI()));
    i.addInstance<ICharactersRepository>(CharactersRepository(i()));
    // domain
    i.addInstance<CharactersUsecase>(CharactersUsecase(i()));
    // presentation
    i.addInstance<CharactersBloc>(CharactersBloc());
    i.addInstance<CharactersController>(CharactersController(i<CharactersUsecase>()));
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => CharactersPage(
        charactersBloc: marvelDI(),
      ),
    );
    r.module('/person', module: PersonModule());
  }
}

import 'package:marvel_app/src/modules/characters/presentation/bloc/characters.bloc.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/domain/usecase/single_character.usecase.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/presentation/bloc/person.bloc.dart';

import 'package:marvel_app/src/core/core.dart';

class PersonController {
  final UseCase<CharacterData, SingleCharacterUseCaseParams> useCase;

  PersonController({
    required this.useCase,
  });

  Future<void> getCharacterLocal(String id) async {
    try {
      CharactersState charactersState = marvelDI<CharactersBloc>().state;

      if (charactersState is SuccessCharactersState) {
        try {
          CharacterData characterData =
              charactersState.value.firstWhere((c) => '${c.id}' == id);

          marvelDI<PersonBloc>().add(OnSuccessPersonEvent(characterData));
          return;
        } catch (e){}
      }

      marvelDI<PersonBloc>().add(OnLoadingPersonEvent());
      final result = await useCase.call(SingleCharacterUseCaseParams(id));
      result.fold((error) {
        marvelDI<PersonBloc>().add(OnErrorPersonEvent(error));
      }, (value) {
        marvelDI<PersonBloc>().add(OnSuccessPersonEvent(value));
      });
    } catch (e, s) {
      marvelDI<PersonBloc>().add(
        OnErrorPersonEvent(
          MarvelAppException(
            message: e.toString(),
            errorMessage: e.toString(),
            stackTrace: s,
          ),
        ),
      );
      // cache = (await charactersBloc.getCharacters(id: id))
      //     .firstWhere((p) => '${p.id}' == id);
    }
    // return cache!;
  }

  Future<void> getCharacterInfoPlus(String id) async {
    // try {
    //   NavitResponse response =
    //       await httpClient.request(ComicsIDRequest(id: id));
    //   Map<String, dynamic> data = response.data;
    //   if (data["data"]["results"] != null) {
    //     List<ComicsItem> comics = (data["data"]["results"] as List?)
    //             ?.map((x) => ComicsItem.fromJson(x))
    //             .toList() ??
    //         [];
    //     cache = cache?.copyWith(comics: cache?.comics.copyWith(items: comics));
    //     notifyListeners();
    //   }
    // } catch (e, s) {
    //   print(s);
    // }
    // return cache!;
  }

  // CharacterData? cache;
}

class ComicsIDRequest extends INavitRequest {
  final String id;

  ComicsIDRequest({required this.id});
  @override
  String get path => '/v1/public/characters/$id/comics';
}

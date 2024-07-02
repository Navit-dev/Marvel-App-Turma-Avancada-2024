import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/modules/characters/presentation/bloc/characters.bloc.dart';
import 'package:marvel_app/src/modules/characters/presentation/controllers/characters.controller.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';

class CharactersPage extends StatefulWidget {
  final CharactersBloc charactersBloc;

  const CharactersPage({super.key, required this.charactersBloc});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late CharactersController _charactersController;

  @override
  void initState() {
    _charactersController = marvelDI<CharactersController>();
    _charactersController.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Characters'),
        ),
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        bloc: marvelDI<CharactersBloc>(),
        builder: (BuildContext context, CharactersState state) {
          if (state is LoadingCharactersState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ErrorCharactersState) {
            String value = state.error.toString();
            return Center(
              child: Text(value),
            );
          }
          if (state is IdleCharactersState ||
              state is! SuccessCharactersState) {
            return const Center(
              child: SizedBox(),
            );
          }
          List<CharacterData> characters = state.value;
          return ListView.separated(
            itemBuilder: (context, i) {
              CharacterData character = characters[i];

              return HeroControllerScope(
                controller: HeroController(),
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: character.id.toString(),
                  child: PersonHorizontalCard(
                    id: character.id.toString(),
                    imageUrl: character.thumbnail.toString(),
                    title: character.name,
                    description: character.description,
                    onTap: () {
                      // _charactersController.lastSelectedCharacter = character;
                      MarvelRouter.pushNamed(
                          '/characters/person/${character.id}');
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (context, i) => const SizedBox(
              height: 12,
            ),
            itemCount: characters.length,
          );
        },
      ),
    );
  }
}

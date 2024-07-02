import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/presentation/bloc/person.bloc.dart';
import 'package:marvel_app/src/modules/characters/submodules/person/presentation/controller/person.controller.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';

class PersonPage extends StatefulWidget {
  final String id;

  const PersonPage({super.key, required this.id});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  late PersonController _personController;

  @override
  void initState() {
    _personController = marvelDI<PersonController>();
    _personController.getCharacterLocal(widget.id).whenComplete(() async {
      await _personController.getCharacterInfoPlus(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Character'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<PersonBloc, PersonState>(
              bloc: marvelDI<PersonBloc>(),
              builder: (context, state) {
                if (state is LoadingPersonState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is ErrorPersonState) {
                  String value = state.error.toString();
                  return Center(
                    child: Text(value),
                  );
                }
                if (state is IdlePersonState || state is! SuccessPersonState) {
                  return const Center(
                    child: SizedBox(),
                  );
                }
                CharacterData character = state.value;
                return Hero(
                  transitionOnUserGestures: true,
                  tag: character.id.toString(),
                  child: PersonHorizontalCard(
                    id: character.id.toString(),
                    imageUrl: character.thumbnail.toString(),
                    title: character.name,
                    description: character.description,
                    children: [
                      ListPersonHorizontalCard<ComicsItem>(
                        title: 'Comics',
                        children: character.comics.items,
                        itemBuilder: (context, item) {
                          return ItemPersonHorizontalCard(
                            title: item.name,
                            imageUrl: item.thumbnail?.toString(),
                          );
                        },
                      ),
                      ListPersonHorizontalCard<ComicsItem>(
                        title: 'Series',
                        children: character.series.items,
                        // listenable: _personController,
                        itemBuilder: (context, item) {
                          return ItemPersonHorizontalCard(title: item.name);
                        },
                      ),
                      ListPersonHorizontalCard<ComicsItem>(
                        title: 'Events',
                        children: character.events.items,
                        // listenable: _personController,
                        itemBuilder: (context, item) {
                          return ItemPersonHorizontalCard(title: item.name);
                        },
                      ),
                      ListPersonHorizontalCard<StoriesItem>(
                        title: 'Stories',
                        children: character.stories.items,
                        // listenable: _personController,
                        itemBuilder: (context, item) {
                          return ItemPersonHorizontalCard(title: item.name);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

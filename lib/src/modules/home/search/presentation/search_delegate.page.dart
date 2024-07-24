import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/home/search/bloc/search.bloc.dart';
import 'package:marvel_app/src/modules/home/search/search.controller.dart';

class SearchDelegatePage extends SearchDelegate<String> {
  final SearchChampionController controller;

  final List<ChampionModel> searchList = [];

  SearchDelegatePage(this.controller);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          controller.search(query);
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        MarvelRouter.pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // controller.search(query);
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: controller.bloc,
      builder: (context, state) {
        if (state is LoadingSearchState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is ErrorSearchState) {
          String value = state.error.toString();
          return Center(
            child: Text(value),
          );
        }
        if (state is IdleSearchState || state is! SuccessSearchState) {
          return const Center(
            child: SizedBox(),
          );
        }
        return ListView.builder(
          itemCount: state.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.value[index].name),
              onTap: () {
                // Handle the selected search result.
                // close(context, state.value[index].name);
                showDialog(
                    context: context,
                    builder: (_) => Center(
                          child: Text(
                            "Results: ${state.value[index].name}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ));
              },
            );
          },
        );
      },
    );
  }

// SearchBuildresultWidget
// SearchSugestionsWidget
  @override
  Widget buildSuggestions(BuildContext context) {
    controller.search(query);
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: controller.bloc,
      builder: (context, state) {
        if (state is LoadingSearchState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is ErrorSearchState) {
          String value = state.error.toString();
          return Center(
            child: Text(value),
          );
        }
        if (state is IdleSearchState || state is! SuccessSearchState) {
          return const Center(
            child: SizedBox(),
          );
        }
        return ListView.builder(
          itemCount: state.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.value[index].name),
              onTap: () {
                // Handle the selected search result.
                showDialog(
                    context: context,
                    builder: (_) => Center(
                          child: Text(
                            "Suggestions: ${state.value[index].name}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ));
              },
            );
          },
        );
      },
    );
  }
}

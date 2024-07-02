import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Marvel App'),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await showSearch(
                  context: context,
                  delegate: marvelDI<SearchDelegate<String>>(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: StaggeredGrid.count(
          crossAxisCount: 2,
          children: [
            HomeItemCard(
              label: 'A-Bomb',
              onPressed: () {
                MarvelRouter.pushNamed('/characters/person/1017100');
              },
            ),
            HomeItemCard(
              label: 'Apocalypse (Ultimate)',
              onPressed: () {
                MarvelRouter.pushNamed('/characters/person/1011253');
              },
            ),
            HomeItemCard(
              label: r'''Ant-Man (Eric O'Grady)''',
              onPressed: () {
                MarvelRouter.pushNamed('/characters/person/1010802');
              },
            ),
            HomeItemCard(
              label: 'Characters',
              onPressed: () {
                MarvelRouter.pushNamed('/characters/');
              },
            ),
            HomeItemCard(
              label: 'Comics',
              onPressed: () {},
            ),
            HomeItemCard(
              label: 'Creators',
              onPressed: () {},
            ),
            HomeItemCard(
              label: 'Series',
              onPressed: () {},
            ),
            HomeItemCard(
              label: 'Stories',
              onPressed: () {},
            ),
            HomeItemCard(
              label: 'Events',
              onPressed: () {},
            ),
          ],
        )
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        // HomeItemCard(
        //   label: 'A-Bomb',
        //   onPressed: () {
        //     MarvelRouter.pushNamed('/characters/person/1017100');
        //   },
        // ),
        // HomeItemCard(
        //   label: 'Characters',
        //   onPressed: () {
        //     MarvelRouter.pushNamed('/characters/');
        //   },
        // ),
        // HomeItemCard(
        //   label: 'Comics',
        //   onPressed: () {},
        // ),
        // HomeItemCard(
        //   label: 'Creators',
        //   onPressed: () {},
        // ),
        // HomeItemCard(
        //   label: 'Series',
        //   onPressed: () {},
        // ),
        // HomeItemCard(
        //   label: 'Stories',
        //   onPressed: () {},
        // ),
        // HomeItemCard(
        //   label: 'Events',
        //   onPressed: () {},
        // ),
        //   ],
        // ),
        );
  }
}

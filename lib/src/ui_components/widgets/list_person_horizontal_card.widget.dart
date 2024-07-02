import 'package:flutter/cupertino.dart';
import 'package:marvel_app/src/ui_style/ui_style.dart';

class ListPersonHorizontalCard<T> extends StatelessWidget {
  final String title;
  final List<T> children;
  final Widget? Function(BuildContext, T) itemBuilder;

  const ListPersonHorizontalCard({
    super.key,
    required this.title,
    required this.children,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: children.isNotEmpty,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  title,
                  style: characterListItemSectionTitle,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: children.length,
              itemBuilder: (context, i) {
                return itemBuilder(context, children[i]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

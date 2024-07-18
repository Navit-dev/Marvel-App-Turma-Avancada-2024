import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';
import 'package:marvel_app/src/ui_style/ui_style.dart';

class PersonHorizontalCard extends StatelessWidget {
  final String? imageUrl;
  final String? id;
  final String title;
  final String description;
  final List<ListPersonHorizontalCard> children;
  final Function()? onTap;

  const PersonHorizontalCard({
    super.key,
    this.imageUrl,
    this.id,
    required this.title,
    required this.description,
    this.children = const [],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  if (imageUrl != null) ...{
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: (3 / 4) - 0.1,
                        child: SingleItemCard(
                          onPressed: onTap,
                          backgroundImage: NetworkImage(imageUrl!),
                        ),
                      ),
                    ),
                  } else ...{
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: (3 / 4) - 0.1,
                        child: SingleItemCard(
                          onPressed: onTap,
                          backgroundImage:
                              randonBackgroundImage().imageProvider,
                        ),
                      ),
                    ),
                  },
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          if (id != null) ...{
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SelectableText(
                                  "#$id",
                                  style: characterID,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            )
                          },
                          Text(
                            title,
                            style: characterTitle,
                            textAlign: TextAlign.justify,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (description.isNotEmpty) ...{
                            Text(
                              description,
                              style: characterDescription,
                              textAlign: TextAlign.justify,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          } else ...{
                            const Text('TOP SECRET'),
                          }
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

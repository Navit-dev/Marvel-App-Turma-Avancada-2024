import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';
import 'package:marvel_app/src/ui_style/ui_style.dart';

const int titleFlex = 1;
const int imageFlex = 4;
const int descriptionFlex = 1;

class PersonVerticalCard extends StatelessWidget {
  final String? imageUrl;
  final String? id;
  final String title;
  final String description;
  final List<ListPersonHorizontalCard> children;
  final Function()? onTap;
  final double proporcional;

  const PersonVerticalCard({
    super.key,
    this.imageUrl,
    this.id,
    required this.title,
    required this.description,
    this.children = const [],
    this.onTap,
    this.proporcional = 2.6
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / proporcional,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: titleFlex,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    title,
                                    style: characterTitle,
                                    textAlign: TextAlign.justify,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (id != null) ...{
                                  SelectableText(
                                    "#$id",
                                    style: characterID,
                                    textAlign: TextAlign.end,
                                  ),
                                },
                              ],
                            ),
                          ),
                        ),
                        if (imageUrl != null) ...{
                          Expanded(
                            flex: imageFlex,
                            child: AspectRatio(
                              aspectRatio: (8 / 5) - 0.1,
                              child: SingleItemCard(
                                onPressed: onTap,
                                backgroundImage: NetworkImage(imageUrl!),
                              ),
                            ),
                          ),
                        } else ...{
                          Expanded(
                            flex: imageFlex,
                            child: AspectRatio(
                              aspectRatio: (8 / 5) - 0.1,
                              child: SingleItemCard(
                                onPressed: onTap,
                                backgroundImage:
                                    randonBackgroundImage().imageProvider,
                              ),
                            ),
                          ),
                        },
                        if (description.isNotEmpty) ...{
                          Expanded(
                            flex: descriptionFlex,
                            child: Text(
                              description,
                              style: characterDescription,
                              textAlign: TextAlign.justify,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        } else ...{
                          const Expanded(
                            flex: descriptionFlex,
                            child: Text('TOP SECRET'),
                          ),
                        }
                      ],
                    ),
                  ),
                ),
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

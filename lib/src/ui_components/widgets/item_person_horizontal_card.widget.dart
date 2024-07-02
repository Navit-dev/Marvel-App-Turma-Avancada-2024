import 'package:flutter/cupertino.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';
import 'package:marvel_app/src/ui_style/ui_style.dart';

class ItemPersonHorizontalCard extends StatelessWidget {
  final String? imageUrl;
  final String title;

  const ItemPersonHorizontalCard({
    super.key,
    this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.4,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: AspectRatio(
              aspectRatio: (3 / 4) + 0.1,
              child: (imageUrl != null)
                  ? SingleItemCard(
                      backgroundImage: NetworkImage(imageUrl!),
                    )
                  : SingleItemCard(
                      backgroundImage: randonBackgroundImage().imageProvider,
                    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: characterListItemName,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

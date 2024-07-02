
import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';

class HomeItemCard extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final NavitMarvelAssets? backgroundImage;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const HomeItemCard({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundImage,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
  });

  @override
  Widget build(BuildContext context) {
    return SingleItemCard(
      padding: padding,
      margin: margin,
      label: label,
      onPressed: onPressed,
      backgroundImage: (backgroundImage != null)
          ? backgroundImage!.imageProvider
          : randonBackgroundImage().imageProvider,
    );
  }
}

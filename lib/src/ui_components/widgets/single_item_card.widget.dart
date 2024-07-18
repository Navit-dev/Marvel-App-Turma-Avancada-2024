import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/ui_style/ui_style.dart';

class SingleItemCard extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;
  final ImageProvider backgroundImage;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const SingleItemCard({
    super.key,
    this.label,
    this.onPressed,
    required this.backgroundImage,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DpadWidget(
        onTapOrClick: onPressed,
        builder: (context, isFocus) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: (isFocus) ? secondaryColor : primaryColor,
                width: 4,
              ),
              borderRadius: defaultBorderRadius,
            ),
            child: Padding(
              padding: margin,
              child: Text(
                label ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: lightTextPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

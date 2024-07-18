import 'package:flutter/material.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';
export 'package:flutter_adaptive_layout/flutter_adaptive_layout.dart';

class LayoutAdapterWidget extends AdaptiveLayout {
  LayoutAdapterWidget({
    super.key,
    super.largeBuilder,
    super.mediumBuilder,
    super.smallBuilder,
    super.child,
    super.qualifier,
  }) {
    assert(
        super.smallBuilder != null ||
            super.largeBuilder != null ||
            super.mediumBuilder != null,
        "Preencha pelo menos 1 dos builders");
  }

  @override
  Widget build(BuildContext context) {
    final screenSize =
        (super.qualifier ?? LayoutBreakpointQualifier()).qualify(context);

    final Widget? result;
    switch (screenSize) {
      case ScreenSize.small:
        result = smallBuilder?.call(context, child) ?? child;
        break;
      case ScreenSize.medium:
        result = mediumBuilder?.call(context, child) ?? child;
        break;
      case ScreenSize.large:
        result = largeBuilder?.call(context, child) ?? child;
        break;
      default:
        result = child;
        break;
    }
    if (result == null) {
      throw UnimplementedError(
          'Either a builder or child for screen size of $screenSize should return a value');
    }
    return result;
  }
}

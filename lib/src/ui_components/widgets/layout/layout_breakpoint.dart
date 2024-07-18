import 'package:flutter/material.dart';
import 'package:marvel_app/src/ui_components/ui_components.dart';

const _defaultSmallBreakpoint = 600;
const _defaultMediumBreakpoint = 1000;

class LayoutBreakpointQualifier extends BreakpointsQualifier {
  /// [ScreenSize.small] to [ScreenSize.medium] breakpoint size. Defaults to `600`
  @override
  final num? smallBreakpoint;

  /// [ScreenSize.medium] to [ScreenSize.large] breakpoint size. Defaults to `1000`
  @override
  final num? mediumBreakpoint;

  /// The default qualifier that will fall back to `600` for [ScreenSize.small] screens and `1000` for [ScreenSize.medium], all the rest will be treated as [ScreenSize.large]
  /// Optionally you can override the defaults be wrapping your widget tree with [BreakpointsSetting]
  LayoutBreakpointQualifier({
    this.smallBreakpoint,
    this.mediumBreakpoint,
  });

  @override
  ScreenSize qualify(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.width;
    final breakpoints =
        context.dependOnInheritedWidgetOfExactType<BreakpointsSetting>();

    final smallBreakpoint = this.smallBreakpoint ??
        breakpoints?.smallScreenBreakpoint ??
        _defaultSmallBreakpoint;
    final mediumBreakpoint = this.mediumBreakpoint ??
        breakpoints?.mediumScreenBreakpoint ??
        _defaultMediumBreakpoint;

    if (shortestSide <= smallBreakpoint) {
      return ScreenSize.small;
    }
    if (shortestSide <= mediumBreakpoint) {
      return ScreenSize.medium;
    }
    return ScreenSize.large;
  }
}

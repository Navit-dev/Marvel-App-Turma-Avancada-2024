import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:marvel_app/src/core/core.dart';

const String keyUp = 'Arrow Up';
const String keyDown = 'Arrow Down';
const String keyLeft = 'Arrow Left';
const String keyRight = 'Arrow Right';
const String keyCenter1 = 'Select';
const String keyCenter2 = 'Enter';
const String keyCenter3 = ' ';

class DpadWidget extends HookWidget {
  final Widget Function(BuildContext, bool isSelected) builder;
  final void Function()? onTapOrClick;
  const DpadWidget(
      {super.key, required this.builder, required this.onTapOrClick});

  DpadController get controller => marvelDI<DpadController>();

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = useFocusNode();
    useEffect(() {
      return focusNode.requestFocus;
    }, []);

    /// On focus state
    var isFocused = useState(false);

    return MouseRegion(
      onHover: (event) {
        isFocused.value = !isFocused.value;
        if (isFocused.value) {
          controller.updateFocus(builder.hashCode);
        }
      },
      child: GestureDetector(
        onTap: onTapOrClick,
        child: KeyboardListener(
          focusNode: focusNode,
          onKeyEvent: (KeyEvent event) {
            if (event is KeyDownEvent) {
              /// Action label
              var label = event.logicalKey.keyLabel;

              /// If label equal to Key Event which arrow up, down, right, left or on Enter
              if ([keyCenter1, keyCenter2, keyCenter3]
                  .any((keyCenter) => keyCenter == label)) {
                onTapOrClick?.call();
              }
            } else {
              isFocused.value = !isFocused.value;
              if (isFocused.value) {
                controller.updateFocus(builder.hashCode);
              }
            }
          },
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, w) => builder(
              context,
              controller.isFocus(builder.hashCode),
            ),
          ),
        ),
      ),
    );
  }
}

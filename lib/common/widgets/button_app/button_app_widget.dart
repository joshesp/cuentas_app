import 'package:flutter/material.dart';

enum ButtonStyleType { elevate, outline, clear }

enum ButtonSize { normal, small }

enum IconPosition { left, right }

class ButtonAppWidget extends StatelessWidget {
  final void Function()? onPressed;
  final ButtonStyleType styleType;
  final ButtonSize size;
  final String? text;
  final IconData? icon;
  final IconPosition iconPosition;
  final bool fullWidth;

  const ButtonAppWidget({
    super.key,
    this.styleType = ButtonStyleType.elevate,
    this.size = ButtonSize.normal,
    this.text,
    this.icon,
    this.onPressed,
    this.iconPosition = IconPosition.right,
    this.fullWidth = false,
  }) : assert(
          text != null || icon != null,
          'You must provide text or an icon.',
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: _buildStyleButton(),
    );
  }

  Widget _buildStyleButton() {
    final buttonChild = _buildButtonChild();

    switch (styleType) {
      case ButtonStyleType.elevate:
        return ElevatedButton(
          onPressed: onPressed,
          child: buttonChild,
        );
      case ButtonStyleType.outline:
        return OutlinedButton(
          onPressed: onPressed,
          child: buttonChild,
        );
      case ButtonStyleType.clear:
        return TextButton(
          onPressed: onPressed,
          child: buttonChild,
        );
    }
  }

  Widget _buildButtonChild() {
    const spaceTextIcon = SizedBox(width: 8);
    final iconWidget = Icon(
      icon,
      size: size == ButtonSize.small ? 16.0 : 22.0,
    );
    final textSize = TextStyle(
      fontSize: size == ButtonSize.small ? 12.0 : 16.0,
    );

    if (text != null && icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPosition == IconPosition.left) ...[iconWidget, spaceTextIcon],
          Text(
            text!.toUpperCase(),
            style: textSize,
          ),
          if (iconPosition == IconPosition.right) ...[spaceTextIcon, iconWidget]
        ],
      );
    } else if (text != null) {
      return Text(
        text!.toUpperCase(),
        style: textSize,
      );
    } else {
      return iconWidget;
    }
  }
}

import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';

class InputCustomWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String helperText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;

  const InputCustomWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.helperText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Use the controller here
      validator: validator, // And the validator here
      focusNode: focusNode, // And the focusNode here
      keyboardType: keyboardType, // And the keyboardType here
      textInputAction: textInputAction,
      onChanged: onChanged,
      style: TextStyleTheme.bodyHintText.copyWith(
        color: Coolors.dark,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? iconInput(prefixIcon!) : null,
        suffixIcon: suffixIcon != null ? iconInput(suffixIcon!) : null,
        labelText: labelText.toUpperCase(),
        labelStyle: TextStyleTheme.inputLabel.copyWith(
          color: Coolors.gray,
        ),
        hintText: hintText,
        hintMaxLines: 1,
        hintStyle: TextStyleTheme.bodyHintText.copyWith(
          color: Coolors.grayLight,
        ),
        helperText: helperText,
        helperMaxLines: 1,
        helperStyle: TextStyleTheme.bodySmall.copyWith(
          color: Coolors.gray,
        ),
        filled: false,
        contentPadding: const EdgeInsets.all(0),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coolors.primary, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coolors.accent, width: 1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Coolors.dangerStrong,
            width: 1,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Coolors.dangerStrong,
            width: 1,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coolors.primary, width: 1),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coolors.grayLight, width: 1),
        ),
      ),
    );
  }

  Icon iconInput(IconData icon) {
    return Icon(
      icon,
      size: 24,
      color: Coolors.dark,
    );
  }
}

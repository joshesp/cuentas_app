import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
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
  final FocusNode? focusNodeNext;
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
    this.focusNodeNext,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: (_) {
        if (focusNodeNext != null) {
          FocusScope.of(context).requestFocus(focusNodeNext);
        }
      },
      style: TextStyleTheme.bodyHintText,
      decoration: _decorationInput(context),
    );
  }

  InputDecoration _decorationInput(BuildContext context) {
    return InputDecoration(
      prefixIconColor: context.theme.textColor,
      suffixIconColor: context.theme.textColor,
      focusColor: Coolors.accent,
      prefixIcon: prefixIcon != null ? _iconInput(prefixIcon!) : null,
      suffixIcon: suffixIcon != null ? _iconInput(suffixIcon!) : null,
      labelText: labelText.toUpperCase(),
      labelStyle: TextStyleTheme.inputLabel.copyWith(
        color: context.theme.textColor,
      ),
      hintText: hintText,
      hintMaxLines: 1,
      hintStyle: TextStyleTheme.bodyHintText,
      helperText: helperText,
      helperMaxLines: 1,
      helperStyle: TextStyleTheme.bodySmall,
      filled: false,
      contentPadding: const EdgeInsets.all(0),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Coolors.primaryDark, width: 1),
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
        borderSide: BorderSide(color: Coolors.primaryDark, width: 1),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Coolors.grayLight, width: 1),
      ),
    );
  }

  Icon _iconInput(IconData icon) {
    return Icon(
      icon,
      size: 24,
    );
  }
}

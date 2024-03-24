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
  final bool obscureText;
  final bool readOnly;
  final AutovalidateMode autovalidateMode;

  const InputCustomWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.helperText = '',
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.focusNode,
    this.focusNodeNext,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: (_) {
        if (focusNodeNext != null) {
          FocusScope.of(context).requestFocus(focusNodeNext);
        }
      },
      inputFormatters: const [],
      obscureText: obscureText,
      style: TextStyleTheme.bodyHintText,
      decoration: _decorationInput(context),
    );
  }

  InputDecoration _decorationInput(BuildContext context) {
    return InputDecoration(
      focusColor: Coolors.dangerDarker,
      prefixIcon: prefixIcon != null ? _iconInput(prefixIcon!, context) : null,
      suffixIcon: suffixIcon != null ? _iconInput(suffixIcon!, context) : null,
      labelText: labelText.toUpperCase(),
      labelStyle: TextStyleTheme.inputLabel.copyWith(
        color: context.theme.textGray,
      ),
      errorStyle: TextStyleTheme.inputLabel.copyWith(
        color: context.theme.textError,
      ),
      hintText: hintText,
      hintMaxLines: 1,
      hintStyle: TextStyleTheme.bodyHintText,
      helperText: helperText,
      helperMaxLines: 1,
      helperStyle: TextStyleTheme.bodySmall,
      filled: false,
      contentPadding: const EdgeInsets.all(0),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Coolors.primary, width: 1),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Coolors.dangerDarker,
          width: 1,
        ),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Coolors.dangerDarker,
          width: 1,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.theme.textGray!, width: 0.5),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Coolors.grayLight, width: 1),
      ),
    );
  }

  Icon _iconInput(IconData icon, BuildContext context) {
    return Icon(
      icon,
      color: context.theme.textGray,
      size: 22,
    );
  }
}

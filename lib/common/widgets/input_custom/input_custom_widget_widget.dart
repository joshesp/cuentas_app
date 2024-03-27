import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';

class InputCustomWidget extends StatefulWidget {
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
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final bool readOnly;
  final AutovalidateMode autovalidateMode;

  const InputCustomWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.helperText = '',
    this.isPassword = false,
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
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<InputCustomWidget> createState() => _InputCustomWidgetState();
}

class _InputCustomWidgetState extends State<InputCustomWidget> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: (_) {
        if (widget.focusNodeNext != null) {
          FocusScope.of(context).requestFocus(widget.focusNodeNext);
        }
      },
      inputFormatters: const [],
      obscureText: _obscureText,
      style: TextStyleTheme.bodyHintText,
      decoration: _decorationInput(context),
    );
  }

  InputDecoration _decorationInput(BuildContext context) {
    return InputDecoration(
      focusColor: context.theme.textBase,
      prefixIcon: widget.prefixIcon != null
          ? _iconInput(widget.prefixIcon!, context)
          : null,
      suffixIcon: widget.suffixIcon != null
          ? _iconInput(widget.suffixIcon!, context, true)
          : null,
      labelText: widget.labelText.toUpperCase(),
      labelStyle: TextStyleTheme.inputLabel.copyWith(
        color: context.theme.textBase,
      ),
      errorStyle: TextStyleTheme.inputLabel.copyWith(
        color: context.theme.textError,
      ),
      hintText: widget.hintText,
      hintMaxLines: 1,
      hintStyle: TextStyleTheme.bodyHintText.copyWith(
        color: context.theme.textBase,
      ),
      helperText: widget.helperText,
      helperMaxLines: 1,
      helperStyle: TextStyleTheme.bodySmall,
      filled: false,
      contentPadding: const EdgeInsets.all(0),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Coolors.accent, width: 1),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.theme.textError!,
          width: 0.5,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.theme.textError!,
          width: 0.5,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: context.theme.textBase!,
          width: 0.5,
        ),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Coolors.gray, width: 1),
      ),
    );
  }

  Widget _iconInput(
    IconData icon,
    BuildContext context, [
    isSufixIcon = false,
  ]) {
    return IconButton(
      icon: Icon(
        icon,
        color: context.theme.textBase,
        size: 22,
      ),
      onPressed:
          isSufixIcon && widget.isPassword ? _togglePasswordVisibility : null,
    );
  }

  _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

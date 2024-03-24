import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

AppBar headerApp({required BuildContext context, required String title}) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Icon(
            Icons.account_circle,
            size: 34,
            color: context.theme.textColor,
          ),
        ],
      ),
    ),
  );
}

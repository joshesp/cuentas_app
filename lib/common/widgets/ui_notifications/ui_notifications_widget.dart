import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

void showModalBottomSheetCustom({
  required BuildContext context,
  required Widget contentWidgets,
  List<Widget> buttonActions = const [],
}) {
  final sizeScreen = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: sizeScreen.height * 0.2, // Minimum height
            maxHeight: sizeScreen.height * 0.6, // Maximum height
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 24,
                      color: context.theme.textBase,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: maxSpacing),
                child: contentWidgets,
              ),
              if (buttonActions.isNotEmpty) ...[
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: maxSpacing,
                    vertical: 12,
                  ),
                  child: Column(
                    children: buttonActions.asMap().entries.map((entry) {
                      int idx = entry.key;
                      Widget widget = entry.value;

                      return idx != buttonActions.length - 1
                          ? Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                              ), // adjust the space as needed
                              child: widget,
                            )
                          : widget;
                    }).toList(),
                  ),
                )
              ],
            ],
          ),
        ),
      );
    },
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: context.theme.backgroundColor,
    elevation: 5.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  );
}

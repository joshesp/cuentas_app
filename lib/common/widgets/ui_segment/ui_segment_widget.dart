import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

uiSegmentWidget({
  required void Function(int) onValueChanged,
  required List<String> options,
}) {
  final Map<int, Widget> children = {};

  for (var i = 0; i < options.length; i++) {
    children[i] = Text(
      options[i],
      style: const TextStyle(color: Coolors.dark),
    );
  }

  return CustomSlidingSegmentedControl<int>(
    initialValue: 0,
    children: children,
    padding: 10,
    height: 40,
    decoration: BoxDecoration(
      color: Coolors.accent,
      borderRadius: BorderRadius.circular(12),
    ),
    thumbDecoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInToLinear,
    onValueChanged: onValueChanged,
  );
}

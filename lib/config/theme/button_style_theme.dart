import 'package:flutter/material.dart';

import 'coolors.dart';

final basePrimaryBtnStyle = ButtonStyle(
  padding: MaterialStateProperty.all(
    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  ),
  backgroundColor: MaterialStateProperty.all(
    Coolors.dark,
  ),
  foregroundColor: MaterialStateProperty.all(
    Colors.white,
  ),
  shadowColor: MaterialStateProperty.all(
    const Color(0xCCD7D7D7),
  ),
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  ),
);

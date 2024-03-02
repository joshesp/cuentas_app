import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';

class TypeTransactionIcon extends StatelessWidget {
  final bool isExpense;
  final bool whiteBg;
  final bool small;

  const TypeTransactionIcon({
    super.key,
    required this.isExpense,
    this.whiteBg = false,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: small ? 24 : 40,
      width: small ? 24 : 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: whiteBg
            ? Colors.white
            : isExpense
                ? Coolors.dangerLight
                : Coolors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          isExpense ? Icons.south_outlined : Icons.north_outlined,
          color: isExpense ? Coolors.dangerStrong : Coolors.primaryDark,
          size: small ? 16 : 24,
        ),
      ),
    );
  }
}

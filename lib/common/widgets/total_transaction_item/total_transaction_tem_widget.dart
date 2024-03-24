import 'package:cuentas_app/common/widgets/ui_icons/type_transaction_icon.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalTransactionItemWidget extends StatelessWidget {
  final bool isExpense;
  final bool clear;
  final double total;

  const TotalTransactionItemWidget({
    super.key,
    required this.isExpense,
    required this.total,
    this.clear = false,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency();

    var typeTransactionIcon = TypeTransactionIcon(
      isExpense: isExpense,
      small: true,
    );

    var typeTransactionLabel = Text(
      (isExpense ? 'Gasto' : 'Ingreso').toUpperCase(),
      style: TextStyleTheme.captionMedium.copyWith(
        color: context.theme.textGray,
      ),
    );

    var transactionAmount = FittedBox(
      child: Text(
        formatter.format(total),
        style: TextStyleTheme.titleSmall.copyWith(
          color: context.theme.textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(minSpacing),
        border: clear
            ? null
            : Border.all(
                color: isExpense ? Coolors.danger : Coolors.primary,
                width: 1,
              ),
      ),
      child: clear
          ? Row(
              children: [
                typeTransactionIcon,
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    typeTransactionLabel,
                    const SizedBox(height: 8),
                    transactionAmount,
                  ],
                )
              ],
            )
          : Column(
              children: [
                typeTransactionIcon,
                const SizedBox(height: 8),
                typeTransactionLabel,
                const SizedBox(height: 8),
                transactionAmount,
              ],
            ),
    );
  }
}

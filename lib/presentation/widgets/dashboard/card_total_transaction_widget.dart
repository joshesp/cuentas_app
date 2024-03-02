import 'package:cuentas_app/common/widgets/ui_icons/type_transaction_icon.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTotalTransactionWidget extends StatelessWidget {
  final bool isExpense;
  final double total;

  const CardTotalTransactionWidget({
    super.key,
    required this.isExpense,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(minSpacing),
        border: Border.all(
          color: isExpense ? Coolors.danger : Coolors.primaryDark,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          TypeTransactionIcon(
            isExpense: isExpense,
            small: true,
          ),
          const SizedBox(height: 8),
          Text(
            (isExpense ? 'Gasto' : 'Ingreso').toUpperCase(),
            style: TextStyleTheme.captionMedium.copyWith(
              color: context.theme.textGray,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(
              formatter.format(total),
              style: TextStyleTheme.titleSmall.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

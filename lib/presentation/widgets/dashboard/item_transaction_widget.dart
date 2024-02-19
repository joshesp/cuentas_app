import 'package:cuentas_app/common/widgets/ui_icons/type_transaction_icon.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemTrasactionWidget extends StatelessWidget {
  final String concept;
  final double amount;
  final DateTime date;
  final bool isExpense;

  const ItemTrasactionWidget({
    super.key,
    required this.concept,
    required this.amount,
    required this.date,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency();

    return Container(
      height: 70,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isExpense ? Coolors.dangerLight : Coolors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 32,
            child: TypeTransactionIcon(
              isExpense: isExpense,
              whiteBg: true,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                concept,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleTheme.bodyMedium.copyWith(
                  color: Coolors.dark,
                ),
              ),
              Text(
                'Hoy',
                textAlign: TextAlign.end,
                style: TextStyleTheme.bodySmall.copyWith(
                  color: Coolors.gray,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Text(
            formatter.format(amount),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleTheme.bodyLarge.copyWith(
              color: Coolors.dark,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Coolors.dark,
              ),
            ),
          )
        ],
      ),
    );
  }
}

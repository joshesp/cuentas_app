import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/constants/texts_constants.dart';
import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerApp(context: context, title: 'Hola Jonh Smith!'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: maxSpacing,
            right: maxSpacing,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: defaultSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    uiSegmentWidget(
                      onValueChanged: (int val) {},
                      options: ['Todos', 'Ingresos', 'Gastos'],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonWidget(options: monthsList),
                    ),
                  ],
                ),
                const SizedBox(height: defaultSpacing),
                const TextSection(
                  subtitle: 'Transacciones',
                  headline1: 'Enero',
                ),
                const SizedBox(height: defaultSpacing),
                const SizedBox(height: maxSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

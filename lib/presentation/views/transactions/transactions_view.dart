import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

List<String> months = <String>[
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre'
];

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
                    CustomSlidingSegmentedControl<int>(
                      initialValue: 1,
                      children: const <int, Widget>{
                        1: Text(
                          'Todos',
                          style: TextStyle(color: Coolors.dark),
                        ),
                        2: Text(
                          'Ingresos',
                          style: TextStyle(color: Coolors.dark),
                        ),
                        3: Text(
                          'Gastos',
                          style: TextStyle(color: Coolors.dark),
                        ),
                      },
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
                      onValueChanged: (v) {},
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonWidget(options: months),
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

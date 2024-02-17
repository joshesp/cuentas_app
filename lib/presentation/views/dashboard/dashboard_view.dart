import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:cuentas_app/presentation/widgets/dashboard/card_total_transaction_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: maxSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hola Jonh Smith!'),
              Icon(
                Icons.account_circle,
                size: 34,
                color: context.theme.primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(maxSpacing),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'En este mes',
                  style: themeText.bodyLarge,
                ),
                Text(
                  'Tu balance',
                  style: themeText.headlineLarge!.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
                const SizedBox(height: defaultSpacing),
                const Row(
                  children: [
                    Expanded(
                      child: CardTotalTransactionWidget(
                        isExpense: false,
                        total: 100000,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CardTotalTransactionWidget(
                        isExpense: true,
                        total: 100000,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultSpacing),
                const _BarChartWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BarChartWidget extends StatefulWidget {
  const _BarChartWidget();

  @override
  State<_BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<_BarChartWidget> {
  final double width = 10;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();

    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => BarTooltipItem(
                        'Nada',
                        const TextStyle(),
                      ),
                    ),
                  ),
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: true),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Coolors.primaryDark,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: Coolors.danger,
          width: width,
        ),
      ],
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final formatter = NumberFormat.compactSimpleCurrency();

    final style = TextStyleTheme.captionMedium.copyWith(
      color: Coolors.gray,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(formatter.format(value), style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    DateTime date = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      value.toInt(),
    );

    String dayText = DateFormat('EE').format(date);

    final Widget text = Text(
      dayText,
      style: const TextStyle(
        color: Coolors.gray,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      angle: 120,
      space: 10, //margin top
      child: text,
    );
  }
}

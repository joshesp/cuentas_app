import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/cupertino.dart';
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
                MySegmentedControl(),
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

class MySegmentedControl extends StatefulWidget {
  const MySegmentedControl({super.key});

  @override
  State<MySegmentedControl> createState() => _MySegmentedControlState();
}

class _MySegmentedControlState extends State<MySegmentedControl> {
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text(
      'Todos',
      style: TextStyle(),
    ),
    1: Text('Ingresos'),
    3: Text('Gastos'),
  };

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        primaryColor: context.theme.primaryColor, // Changes the border color
        brightness: Brightness.dark, // Changes the text color
      ),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoSegmentedControl<int>(
          children: myTabs,
          onValueChanged: (int val) {
            setState(() {
              sharedValue = val;
            });
          },
          groupValue: sharedValue,
          borderColor: Coolors.accent, // Changes the border color
          selectedColor:
              Colors.white, // Changes the background color of the selected tab
          unselectedColor: Coolors
              .accent, // Changes the background color of the unselected tabs
          pressedColor: Coolors
              .primary, // Changes the background color when a tab is pressed
        ),
      ),
    );
  }
}

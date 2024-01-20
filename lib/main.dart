import 'package:flutter/material.dart';
import 'package:cuentas_app/config/theme/dark_theme.dart';
import 'package:cuentas_app/config/theme/light_theme.dart';
import 'package:cuentas_app/presentation/views/slide_intro/slide_intro_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      locale: const Locale('es', 'MX'),
      home: const SlideIntroView(),
    );
  }
}

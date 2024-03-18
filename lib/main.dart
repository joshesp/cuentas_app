import 'package:cuentas_app/config/theme/dark_theme.dart';
import 'package:cuentas_app/config/theme/light_theme.dart';
import 'package:cuentas_app/presentation/views/splashscreen/splascreen_view.dart';
import 'package:flutter/material.dart';

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
      home: const SplashscreenView(),
    );
  }
}

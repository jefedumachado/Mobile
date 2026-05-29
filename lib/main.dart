import 'package:dev_venture/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dev_venture/theme/dark_theme.dart';
import 'package:dev_venture/theme/light_theme.dart';
import 'package:dev_venture/screens/theme_demo.dart';
import 'package:dev_venture/screens/activities_screen.dart';
import 'package:dev_venture/screens/cadastro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Venture',
      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: ThemeMode.system,

      // TELA INICIAL
      home: const CadastroScreen(),

      // ROTAS
      routes: {
        '/home': (context) => const HomeScreen(),
        '/activities': (context) => ActivitiesScreen(),
        '/theme-demo': (context) => const ThemeDemoPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dev_venture/theme/dark_theme.dart';
import 'package:dev_venture/theme/light_theme.dart';
import 'package:dev_venture/screens/home_screen.dart';
import 'package:dev_venture/providers/atividade_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _onThemeChanged() {
    setState(() {
      if (_themeMode == ThemeMode.system) {
        _themeMode = ThemeMode.light;
      } else if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.system;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Só o AtividadeProvider entra aqui. O AuthProvider fica por conta
    // do PR de login/cadastro (G3-N2-12) do Welligton.
    return ChangeNotifierProvider(
      create: (_) => AtividadeProvider(),
      child: MaterialApp(
        title: 'Dev Venture',
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.theme,
        darkTheme: AppDarkTheme.theme,
        themeMode: _themeMode,
        home: HomeScreen(
          onThemeChanged: _onThemeChanged,
          themeMode: _themeMode,
        ),
      ),
    );
  }
}

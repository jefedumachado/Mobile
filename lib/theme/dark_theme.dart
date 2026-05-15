import 'package:flutter/material.dart';
import 'package:dev_venture/theme/base_theme.dart';

/// Tema escuro do DevVenture.
///
/// Inspirado na estética de editores de código dark (VS Code Dark+, Neovim,
/// terminal). Superfícies em tons de preto esverdeado com accent ciano,
/// simulando o ambiente de um editor de código em uso.
///
/// Todos os valores de cor vêm exclusivamente de [AppThemeTokens].
abstract class AppDarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: AppThemeTokens.neutral900,
    canvasColor: AppThemeTokens.neutral900,
    appBarTheme: _appBarTheme,
    cardTheme: _cardTheme,
    dialogTheme: _dialogTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    floatingActionButtonTheme: _fabTheme,
    inputDecorationTheme: _inputTheme,
    chipTheme: _chipTheme,
    navigationBarTheme: _navigationBarTheme,
    tabBarTheme: _tabBarTheme,
    dividerTheme: _dividerTheme,
    switchTheme: _switchTheme,
    checkboxTheme: _checkboxTheme,
    snackBarTheme: _snackBarTheme,
    badgeTheme: _badgeTheme,
  );

  // ── ColorScheme ──────────────────────────────────────────────────
  //
  // Mapeamento semântico Material 3 → tokens DevVenture:
  //
  // primary            → syntaxKeyword (ciano) — ações principais
  // secondary          → neutral300            — ações secundárias
  // tertiary           → syntaxWarning (âmbar) — alertas e avisos
  // error              → syntaxError (verm.)   — estados de falha
  // surface            → neutral800            — cards e superfícies
  // onSurface          → neutral100            — texto sobre superfície

  static const _colorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Primary → syntaxKeyword (ciano): botões, FAB, indicadores ativos
    primary: AppThemeTokens.syntaxKeyword,
    onPrimary: AppThemeTokens.brandDark,
    primaryContainer: AppThemeTokens.primaryContainerDark,
    onPrimaryContainer: AppThemeTokens.syntaxKeyword,

    // Secondary → neutros: ações e chips secundários
    secondary: AppThemeTokens.neutral300,
    onSecondary: AppThemeTokens.neutral900,
    secondaryContainer: AppThemeTokens.neutral700,
    onSecondaryContainer: AppThemeTokens.neutral100,

    // Tertiary → syntaxWarning (âmbar): alertas, avisos, atenção
    tertiary: AppThemeTokens.syntaxWarning,
    onTertiary: AppThemeTokens.brandDark,
    tertiaryContainer: AppThemeTokens.amberContainerDark,
    onTertiaryContainer: AppThemeTokens.syntaxWarning,

    // Error → syntaxError (vermelho): erros, senha inválida, negações
    error: AppThemeTokens.errorDark,
    onError: AppThemeTokens.brandDark,
    errorContainer: AppThemeTokens.errorContainerDark,
    onErrorContainer: Color(0xFFFFDAD6),

    // Surface → escala de neutros dark: fundos de cards e containers
    surface: AppThemeTokens.neutral800,
    onSurface: AppThemeTokens.neutral100,
    surfaceContainerLowest: AppThemeTokens.neutral900,
    surfaceContainerLow: AppThemeTokens.neutral800,
    surfaceContainer: AppThemeTokens.neutral700,
    surfaceContainerHigh: AppThemeTokens.neutral600,
    surfaceContainerHighest: AppThemeTokens.neutral600,
    onSurfaceVariant: AppThemeTokens.neutral300,

    // Outline → branco com baixa opacidade: bordas e divisores sutis
    outline: Color(0x30FFFFFF),
    outlineVariant: Color(0x18FFFFFF),

    // Inverse → para SnackBars e tooltips invertidos
    inverseSurface: AppThemeTokens.neutral100,
    onInverseSurface: AppThemeTokens.neutral900,
    inversePrimary: AppThemeTokens.brandDark,

    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    surfaceTint: AppThemeTokens.syntaxKeyword,
  );

  // ── AppBar ───────────────────────────────────────────────────────
  // Fundo igual ao scaffold (neutral900) para efeito de continuidade,
  // simulando a barra de título de um editor de código.
  static const _appBarTheme = AppBarTheme(
    backgroundColor: AppThemeTokens.neutral900,
    foregroundColor: AppThemeTokens.neutral100,
    elevation: 0,
    scrolledUnderElevation: 1,
    surfaceTintColor: Colors.transparent,
  );

  // ── Card ─────────────────────────────────────────────────────────
  // neutral800 para simular painéis/abas de um editor.
  // Bordas arredondadas sutis (12px) mantêm a estética tech sem ser fria.
  static final _cardTheme = CardThemeData(
    color: AppThemeTokens.neutral800,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Color(0x20FFFFFF), width: 0.5),
    ),
  );

  // ── Dialog ───────────────────────────────────────────────────────
  // Dialogs em neutral800 com borda ciano sutil — como um popup de
  // autocomplete de editor.
  static final _dialogTheme = DialogThemeData(
    backgroundColor: AppThemeTokens.neutral800,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(
        color: Color(0x4000FFB2), // brandAccent 25% opacidade
        width: 1,
      ),
    ),
  );

  // ── ElevatedButton ───────────────────────────────────────────────
  // Botão primário em ciano (syntaxKeyword) com texto escuro —
  // o "keyword" mais destacado da interface.
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppThemeTokens.syntaxKeyword,
      foregroundColor: AppThemeTokens.brandDark,
      elevation: 0,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  );

  // ── OutlinedButton ───────────────────────────────────────────────
  // Botão secundário com borda ciano sutil — como uma função não chamada.
  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppThemeTokens.syntaxKeyword,
      side: const BorderSide(color: Color(0x6000FFB2)), // ciano 38%
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  );

  // ── TextButton ───────────────────────────────────────────────────
  // Ações terciárias em ciano puro.
  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppThemeTokens.syntaxKeyword),
  );

  // ── FAB ──────────────────────────────────────────────────────────
  // FAB em ciano com bordas levemente arredondadas (não circular)
  // para manter a estética de editor.
  static const _fabTheme = FloatingActionButtonThemeData(
    backgroundColor: AppThemeTokens.syntaxKeyword,
    foregroundColor: AppThemeTokens.brandDark,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  );

  // ── Input ────────────────────────────────────────────────────────
  // Campo de texto simulando uma linha de input de terminal.
  // Fundo neutral700, borda de foco em ciano.
  static final _inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppThemeTokens.neutral700,
    hintStyle: const TextStyle(color: AppThemeTokens.neutral400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0x30FFFFFF), width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppThemeTokens.syntaxKeyword,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppThemeTokens.syntaxError, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppThemeTokens.syntaxError,
        width: 1.5,
      ),
    ),
  );

  // ── Chip ─────────────────────────────────────────────────────────
  // Chips para categorias (Dart, Flutter, Firebase) com cor de fundo
  // neutra e label em syntaxFunction (laranja dourado).
  static final _chipTheme = ChipThemeData(
    backgroundColor: AppThemeTokens.neutral700,
    labelStyle: const TextStyle(
      color: AppThemeTokens.syntaxFunction,
      fontSize: 12,
    ),
    side: const BorderSide(color: Color(0x30FFCB6B)), // laranja 19%
    shape: const StadiumBorder(),
  );

  // ── NavigationBar ────────────────────────────────────────────────
  // Barra de navegação em neutral800 com indicador ciano translúcido.
  static final _navigationBarTheme = NavigationBarThemeData(
    backgroundColor: AppThemeTokens.neutral800,
    indicatorColor: const Color(0x2500FFB2), // ciano 15%
    iconTheme: WidgetStateProperty.resolveWith(
      (s) => IconThemeData(
        color: s.contains(WidgetState.selected)
            ? AppThemeTokens.syntaxKeyword
            : AppThemeTokens.neutral400,
      ),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith(
      (s) => TextStyle(
        color: s.contains(WidgetState.selected)
            ? AppThemeTokens.syntaxKeyword
            : AppThemeTokens.neutral400,
        fontSize: 12,
      ),
    ),
  );

  // ── TabBar ───────────────────────────────────────────────────────
  // Abas simulando as tabs de arquivos de um editor de código.
  static const _tabBarTheme = TabBarThemeData(
    labelColor: AppThemeTokens.syntaxKeyword,
    unselectedLabelColor: AppThemeTokens.neutral400,
    indicatorColor: AppThemeTokens.syntaxKeyword,
  );

  // ── Divider ──────────────────────────────────────────────────────
  // Divisores sutis como as linhas de separação de painéis de editor.
  static const _dividerTheme = DividerThemeData(
    color: Color(0x15FFFFFF),
    thickness: 0.5,
  );

  // ── Switch ───────────────────────────────────────────────────────
  // Toggle em ciano quando ativo — como ligar um feature flag.
  static final _switchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.selected)
          ? AppThemeTokens.brandDark
          : AppThemeTokens.neutral400,
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.selected)
          ? AppThemeTokens.syntaxKeyword
          : AppThemeTokens.neutral700,
    ),
  );

  // ── Checkbox ─────────────────────────────────────────────────────
  // Checkbox em ciano — para atividades de seleção múltipla (Somatório).
  static final _checkboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.selected)
          ? AppThemeTokens.syntaxKeyword
          : Colors.transparent,
    ),
    checkColor: WidgetStateProperty.all(AppThemeTokens.brandDark),
    side: const BorderSide(color: AppThemeTokens.neutral400),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  // ── SnackBar ─────────────────────────────────────────────────────
  // SnackBars flutuantes em neutral700 — como mensagens de log no terminal.
  static const _snackBarTheme = SnackBarThemeData(
    backgroundColor: AppThemeTokens.neutral700,
    contentTextStyle: TextStyle(color: AppThemeTokens.neutral100),
    actionTextColor: AppThemeTokens.syntaxKeyword,
    behavior: SnackBarBehavior.floating,
    shape: StadiumBorder(),
  );

  // ── Badge ────────────────────────────────────────────────────────
  // Badges em roxo (syntaxNumber) para valores numéricos como XP e pontos.
  static const _badgeTheme = BadgeThemeData(
    backgroundColor: AppThemeTokens.syntaxNumber,
    textColor: AppThemeTokens.brandDark,
  );
}

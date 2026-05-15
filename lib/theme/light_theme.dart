import 'package:flutter/material.dart';
import 'package:dev_venture/theme/base_theme.dart';

/// Tema claro do DevVenture.
///
/// Inspirado na estética de editores de código light (VS Code Light+,
/// IntelliJ Light). Superfícies em tons de branco esverdeado com accent
/// ciano mais escuro para garantir contraste adequado sobre fundos claros.
///
/// Os tokens de syntax highlight são os mesmos do tema dark — apenas
/// as superfícies e textos mudam para garantir legibilidade no light.
///
/// Todos os valores de cor vêm exclusivamente de [AppThemeTokens].
abstract class AppLightTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: AppThemeTokens.surface50,
    canvasColor: AppThemeTokens.surface50,
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
  // No tema light, o ciano puro (#00FFB2) não tem contraste suficiente
  // sobre fundos claros. Por isso, usamos brandDark como cor primária
  // (o verde escuro garante WCAG AA sobre surface50/100) e reservamos
  // o ciano para highlights e estados hover.
  //
  // primary            → brandDark (verde escuro)  — ações principais
  // secondary          → neutralLight400           — ações secundárias
  // tertiary           → syntaxWarning (âmbar)     — alertas e avisos
  // error              → errorLight (verm. sat.)   — estados de falha
  // surface            → surface100               — cards e superfícies

  static const _colorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary → brandDark: garante contraste sobre fundos claros
    primary: AppThemeTokens.brandDark,
    onPrimary: AppThemeTokens.surface50,
    primaryContainer: AppThemeTokens.primaryContainerLight,
    onPrimaryContainer: AppThemeTokens.brandDark,

    // Secondary → neutros light: ações e chips secundários
    secondary: AppThemeTokens.neutralLight400,
    onSecondary: AppThemeTokens.surface50,
    secondaryContainer: AppThemeTokens.surface200,
    onSecondaryContainer: AppThemeTokens.neutralLight600,

    // Tertiary → syntaxWarning (âmbar): alertas, avisos, atenção
    tertiary: AppThemeTokens.syntaxWarning,
    onTertiary: AppThemeTokens.brandDark,
    tertiaryContainer: AppThemeTokens.amberContainerLight,
    onTertiaryContainer: AppThemeTokens.brandDark,

    // Error → errorLight (vermelho saturado): legível sobre claro
    error: AppThemeTokens.errorLight,
    onError: AppThemeTokens.surface50,
    errorContainer: AppThemeTokens.errorContainerLight,
    onErrorContainer: AppThemeTokens.brandDark,

    // Surface → escala de surface: fundos de cards e containers
    surface: AppThemeTokens.surface100,
    onSurface: AppThemeTokens.neutralLight600,
    surfaceContainerLowest: AppThemeTokens.surface50,
    surfaceContainerLow: AppThemeTokens.surface100,
    surfaceContainer: AppThemeTokens.surface200,
    surfaceContainerHigh: Color(0xFFC8E0DC),
    surfaceContainerHighest: Color(0xFFBDD8D4),
    onSurfaceVariant: AppThemeTokens.neutralLight400,

    // Outline → preto com baixa opacidade: bordas e divisores sutis
    outline: Color(0x30000000),
    outlineVariant: Color(0x18000000),

    // Inverse → para SnackBars e tooltips invertidos
    inverseSurface: AppThemeTokens.neutralLight600,
    onInverseSurface: AppThemeTokens.surface50,
    inversePrimary: AppThemeTokens.syntaxKeyword,

    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    surfaceTint: AppThemeTokens.brandDark,
  );

  // ── AppBar ───────────────────────────────────────────────────────
  // Fundo igual ao scaffold (surface50) para continuidade visual,
  // simulando a barra de título de um editor light.
  static const _appBarTheme = AppBarTheme(
    backgroundColor: AppThemeTokens.surface50,
    foregroundColor: AppThemeTokens.neutralLight600,
    elevation: 0,
    scrolledUnderElevation: 1,
    surfaceTintColor: Colors.transparent,
  );

  // ── Card ─────────────────────────────────────────────────────────
  // surface100 com borda sutil escura — painéis de editor light.
  static final _cardTheme = CardThemeData(
    color: AppThemeTokens.surface100,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Color(0x20000000), width: 0.5),
    ),
  );

  // ── Dialog ───────────────────────────────────────────────────────
  // Dialog em surface100 com borda brandDark sutil.
  static final _dialogTheme = DialogThemeData(
    backgroundColor: AppThemeTokens.surface100,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(
        color: Color(0x40001A14), // brandDark 25% opacidade
        width: 1,
      ),
    ),
  );

  // ── ElevatedButton ───────────────────────────────────────────────
  // Botão primário em brandDark com texto claro — alto contraste no light.
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppThemeTokens.brandDark,
      foregroundColor: AppThemeTokens.surface50,
      elevation: 0,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  );

  // ── OutlinedButton ───────────────────────────────────────────────
  // Botão secundário com borda brandDark — ação secundária clara.
  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppThemeTokens.brandDark,
      side: const BorderSide(color: AppThemeTokens.brandDark),
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  );

  // ── TextButton ───────────────────────────────────────────────────
  // Ações terciárias em brandDark — garante contraste no light.
  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppThemeTokens.brandDark),
  );

  // ── FAB ──────────────────────────────────────────────────────────
  // FAB em brandDark com bordas arredondadas — estética de editor light.
  static const _fabTheme = FloatingActionButtonThemeData(
    backgroundColor: AppThemeTokens.brandDark,
    foregroundColor: AppThemeTokens.surface50,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  );

  // ── Input ────────────────────────────────────────────────────────
  // Campo de texto em surface200 com borda de foco em brandDark.
  static final _inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppThemeTokens.surface200,
    hintStyle: const TextStyle(color: AppThemeTokens.neutralLight300),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0x30000000), width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppThemeTokens.brandDark, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppThemeTokens.errorLight, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppThemeTokens.errorLight,
        width: 1.5,
      ),
    ),
  );

  // ── Chip ─────────────────────────────────────────────────────────
  // Chips para categorias em surface200 com label em brandDark.
  // No light o laranja (syntaxFunction) não tem contraste suficiente,
  // então usamos brandDark para legibilidade.
  static final _chipTheme = ChipThemeData(
    backgroundColor: AppThemeTokens.surface200,
    labelStyle: const TextStyle(color: AppThemeTokens.brandDark, fontSize: 12),
    side: const BorderSide(color: Color(0x30001A14)),
    shape: const StadiumBorder(),
  );

  // ── NavigationBar ────────────────────────────────────────────────
  // Barra de navegação em surface100 com indicador brandDark translúcido.
  static final _navigationBarTheme = NavigationBarThemeData(
    backgroundColor: AppThemeTokens.surface100,
    indicatorColor: const Color(0x25001A14), // brandDark 15%
    iconTheme: WidgetStateProperty.resolveWith(
      (s) => IconThemeData(
        color: s.contains(WidgetState.selected)
            ? AppThemeTokens.brandDark
            : AppThemeTokens.neutralLight300,
      ),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith(
      (s) => TextStyle(
        color: s.contains(WidgetState.selected)
            ? AppThemeTokens.brandDark
            : AppThemeTokens.neutralLight300,
        fontSize: 12,
      ),
    ),
  );

  // ── TabBar ───────────────────────────────────────────────────────
  // Abas simulando tabs de arquivos de um editor light.
  static const _tabBarTheme = TabBarThemeData(
    labelColor: AppThemeTokens.brandDark,
    unselectedLabelColor: AppThemeTokens.neutralLight300,
    indicatorColor: AppThemeTokens.brandDark,
  );

  // ── Divider ──────────────────────────────────────────────────────
  // Divisores sutis como linhas de separação de painéis em editor light.
  static const _dividerTheme = DividerThemeData(
    color: Color(0x15000000),
    thickness: 0.5,
  );

  // ── Switch ───────────────────────────────────────────────────────
  // Toggle em brandDark quando ativo.
  static final _switchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.selected)
          ? AppThemeTokens.surface50
          : AppThemeTokens.neutralLight300,
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.selected)
          ? AppThemeTokens.brandDark
          : AppThemeTokens.surface200,
    ),
  );

  // ── Checkbox ─────────────────────────────────────────────────────
  // Checkbox em brandDark — contraste adequado no light.
  static final _checkboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.selected)
          ? AppThemeTokens.brandDark
          : Colors.transparent,
    ),
    checkColor: WidgetStateProperty.all(AppThemeTokens.surface50),
    side: const BorderSide(color: AppThemeTokens.neutralLight300),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  // ── SnackBar ─────────────────────────────────────────────────────
  // SnackBars flutuantes em neutralLight600 — como logs de terminal light.
  static const _snackBarTheme = SnackBarThemeData(
    backgroundColor: AppThemeTokens.neutralLight600,
    contentTextStyle: TextStyle(color: AppThemeTokens.surface50),
    actionTextColor: AppThemeTokens.syntaxKeyword,
    behavior: SnackBarBehavior.floating,
    shape: StadiumBorder(),
  );

  // ── Badge ────────────────────────────────────────────────────────
  // Badges em roxo (syntaxNumber) — consistente com o tema dark.
  static const _badgeTheme = BadgeThemeData(
    backgroundColor: AppThemeTokens.syntaxNumber,
    textColor: AppThemeTokens.surface50,
  );
}

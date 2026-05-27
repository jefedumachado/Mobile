import 'package:flutter/material.dart';

/// Design tokens for DevVenture.
/// Single source of truth for app colors. Sections: Brand, Syntax,
/// Neutrals (dark/light), Status, Containers. (UI-REF-2026-001)
abstract class AppThemeTokens {
  // 1. Brand
  static const brandAccent = Color(0xFF00FFB2); // ciano - sistema operante
  static const brandDark = Color(0xFF001A14); // canvas/texto escuro no light

  // 2. Syntax Tokens
  static const syntaxKeyword = Color(0xFF00FFB2); // ciano - ações primárias
  static const syntaxString = Color(0xFF4EC994); // verde - sucesso
  static const syntaxComment = Color(0xFF4D6560); // cinza azulado - muted
  static const syntaxError = Color(0xFFFF5C5C); // vermelho - erro
  static const syntaxWarning = Color(0xFFFFC06A); // âmbar - aviso
  static const syntaxNumber = Color(0xFFC792EA); // roxo - números
  static const syntaxType = Color(0xFF7AB8FF); // azul - info/links
  static const syntaxFunction = Color(0xFFFFCB6B); // laranja - categorias

  // 3. Neutrals Dark
  static const neutral900 = Color(0xFF0C0F0E);
  static const neutral800 = Color(0xFF121918);
  static const neutral700 = Color(0xFF1A2220);
  static const neutral600 = Color(0xFF222E2B);
  static const neutral400 = Color(0xFF4A6B65);
  static const neutral300 = Color(0xFF8AA09B);
  static const neutral100 = Color(0xFFE2EAE8);
  static const borderDefault = Color(0x14FFFFFF); // 8% white
  static const borderEmphasis = Color(0x21FFFFFF); // 13% white

  // 4. Neutrals Light
  static const surface50 = Color(0xFFF0F7F6);
  static const surface100 = Color(0xFFE3F0EE);
  static const surface200 = Color(0xFFD4E8E5);
  static const neutralLight600 = Color(0xFF2C4A45);
  static const neutralLight400 = Color(0xFF4A7A73);
  static const neutralLight300 = Color(0xFF7AADA6);

  // 5. Status
  static const errorDark = Color(0xFFFF5C5C);
  static const errorLight = Color(0xFFC0392B);
  static const amber = Color(0xFFFFC06A);
  static const blue = Color(0xFF7AB8FF);

  // 6. Containers (derived)
  static const keywordContainerDark = Color(0x1F00FFB2);
  static const keywordContainerLight = Color(0xFFB2FFF0);
  static const typeContainerDark = Color(0x1A7AB8FF);
  static const typeContainerLight = Color(0xFFDCEEFF);
  static const numberContainerDark = Color(0x1FC792EA);
  static const numberContainerLight = Color(0xFFF3E8FF);
  static const warningContainerDark = Color(0x1FFFC06A);
  static const warningContainerLight = Color(0xFFFFF3E0);
  static const stringContainerDark = Color(0x1A4EC994);
  static const stringContainerLight = Color(0xFFDCF5EB);
  static const errorContainerDark = Color(0x1AFF5C5C);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const primaryContainerDark = Color(0xFF013D3B);
  static const primaryContainerLight = Color(0xFFB2FFF0);
  static const amberContainerDark = Color(0xFF3D2E10);
  static const amberContainerLight = Color(0xFFFFF3E0);
}

import 'package:flutter/material.dart';

/// Tokens de design do DevVenture.
///
/// Este arquivo é a **única fonte de verdade** para todas as cores do app.
/// Os temas dark e light apenas consomem estas constantes — nunca definem
/// cores próprias. Isso garante consistência e facilita a futura adição de
/// temas alternativos (ex: escolha de accent pelo usuário).
///
/// Organização das seções:
///   1. Brand          → cores de identidade do app
///   2. Syntax         → paleta inspirada em syntax highlight de editores
///   3. Neutros Dark   → superfícies e textos do tema escuro
///   4. Neutros Light  → superfícies e textos do tema claro
///   5. Status         → cores semânticas compartilhadas entre temas
abstract class AppThemeTokens {
  // ── 1. Brand ────────────────────────────────────────────────────
  //
  // brandAccent: o ciano principal do app. Usado como cor primária em
  // botões, indicadores ativos, bordas de foco e elementos interativos.
  // É o equivalente à cor de "keyword" de um editor de código — a cor
  // mais saliente da interface.
  //
  // brandDark: o fundo mais profundo do tema escuro. Funciona como o
  // "canvas" do editor, onde o código (conteúdo) é escrito.
  static const brandAccent = Color(0xFF00FFB2); // Ciano keyword
  static const brandDark = Color(0xFF001A14); // Canvas do editor

  // ── 2. Syntax Tokens ────────────────────────────────────────────
  //
  // A paleta de cores do DevVenture é mapeada diretamente a partir da
  // lógica de syntax highlighting de editores de código (VS Code, Neovim,
  // terminal). Cada token tem uma semântica clara na UI:
  //
  // syntaxKeyword  → ciano  → ações primárias, botões ativos, accent
  // syntaxString   → verde  → sucesso, acerto, presença confirmada
  // syntaxComment  → cinza  → textos secundários, placeholders, hints
  // syntaxError    → verm.  → erros, acesso negado, senha inválida
  // syntaxWarning  → âmbar  → alertas, avisos, tentativas restantes
  // syntaxNumber   → roxo   → XP, pontuação, badges numéricos
  // syntaxType     → azul   → nível do aluno, informações, links
  // syntaxFunction → laran. → categorias (Dart, Flutter, Firebase)

  /// Keyword → ciano. Ações primárias e elementos ativos.
  static const syntaxKeyword = Color(0xFF00FFB2);

  /// String → verde médio. Sucesso, acerto, confirmação.
  static const syntaxString = Color(0xFF4EC994);

  /// Comment → cinza esverdeado. Textos secundários e placeholders.
  static const syntaxComment = Color(0xFF5A7A75);

  /// Error → vermelho. Erros, negações e estados de falha.
  static const syntaxError = Color(0xFFFF5C5C);

  /// Warning → âmbar. Alertas, avisos e atenção do usuário.
  static const syntaxWarning = Color(0xFFFFC06A);

  /// Number → roxo. Valores numéricos: XP, pontuação, badges.
  static const syntaxNumber = Color(0xFFC792EA);

  /// Type → azul claro. Nível do aluno, informações e links.
  static const syntaxType = Color(0xFF7AB8FF);

  /// Function → laranja dourado. Categorias: Dart, Flutter, Firebase.
  static const syntaxFunction = Color(0xFFFFCB6B);

  // ── 3. Neutros Dark (superfícies do tema escuro) ─────────────────
  //
  // Escala de cinzas esverdeados que simulam o fundo de um editor dark.
  // neutral900 é o mais escuro (scaffold), neutral100 é o texto principal.
  //
  // Como usar:
  //   scaffold background → neutral900
  //   surface (cards)     → neutral800
  //   surface container   → neutral700
  //   ícones inativos     → neutral400
  //   texto secundário    → neutral300
  //   texto principal     → neutral100

  static const neutral900 = Color(0xFF0A1412); // Scaffold background
  static const neutral800 = Color(0xFF111E1B); // Surface / cards
  static const neutral700 = Color(0xFF1A2C28); // Surface container
  static const neutral600 = Color(0xFF243D38); // Surface container high
  static const neutral400 = Color(0xFF4A6B65); // Ícones e textos inativos
  static const neutral300 = Color(0xFF6B8F89); // Textos secundários
  static const neutral100 = Color(0xFFD6EDEA); // Texto principal dark

  // ── 4. Neutros Light (superfícies do tema claro) ─────────────────
  //
  // Escala de tons claros com leve tint esverdeado, mantendo a identidade
  // do editor sem perder legibilidade no modo light.
  //
  // Como usar:
  //   scaffold background → surface50
  //   surface (cards)     → surface100
  //   surface container   → surface200
  //   texto principal     → neutralLight600
  //   texto secundário    → neutralLight400
  //   textos inativos     → neutralLight300

  static const surface50 = Color(0xFFF0F7F6); // Scaffold background light
  static const surface100 = Color(0xFFE3F0EE); // Surface / cards light
  static const surface200 = Color(0xFFD4E8E5); // Surface container light
  static const neutralLight600 = Color(0xFF2C4A45); // Texto principal light
  static const neutralLight400 = Color(0xFF4A7A73); // Textos secundários light
  static const neutralLight300 = Color(0xFF7AADA6); // Textos inativos light

  // ── 5. Status (compartilhados entre temas) ───────────────────────
  //
  // Cores semânticas usadas em ambos os temas para manter consistência
  // de significado independentemente do brilho da interface.
  //
  // errorDark  → vermelho mais suave, legível sobre fundos escuros
  // errorLight → vermelho mais saturado, legível sobre fundos claros
  // amber      → âmbar para alertas em ambos os temas
  // blue       → azul info para ambos os temas

  static const errorDark = Color(0xFFFF5C5C); // Erro tema dark
  static const errorLight = Color(0xFFC0392B); // Erro tema light
  static const amber = Color(0xFFFFC06A); // Alerta ambos os temas
  static const blue = Color(0xFF7AB8FF); // Info ambos os temas

  // ── Containers derivados (uso interno nos temas) ─────────────────
  //
  // Versões com opacidade reduzida dos tokens principais, usadas em
  // containers, indicadores e estados hover/selected.

  static const primaryContainerDark = Color(
    0xFF013D3B,
  ); // brandAccent escurecido
  static const primaryContainerLight = Color(
    0xFFB2FFF0,
  ); // brandAccent clareado

  static const amberContainerDark = Color(0xFF3D2E10); // amber escurecido
  static const amberContainerLight = Color(0xFFFFF3E0); // amber clareado

  static const errorContainerDark = Color(0xFF3D0808); // error escurecido
  static const errorContainerLight = Color(0xFFFFDAD6); // error clareado

  static const numberContainerDark = Color(
    0xFF2A1A3D,
  ); // syntaxNumber escurecido
  static const numberContainerLight = Color(
    0xFFF3E8FF,
  ); // syntaxNumber clareado
}

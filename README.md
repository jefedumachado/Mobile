# Dev Venture

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Arquitetura da diretórios — Dev Venture

Este documento descreve o propósito e responsabilidades das pastas encontradas no projeto Flutter Dev Venture. Use este guia para saber onde colocar código novo e como organizar responsabilidades.

### Visão geral rápida

- `lib/main.dart` — ponto de entrada da aplicação.
- `lib/components/` — componentes visuais reutilizáveis (widgets que podem ser usados por várias telas).
- `lib/models/` — classes que representam modelos de dados (entidades, DTOs, serialização).
- `lib/providers/` — provedores de estado (por exemplo, ChangeNotifier, Riverpod providers, Bloc providers).
- `lib/repositories/` — abstração de acesso a dados (APIs, bases locais, caches). Repositórios encapsulam fontes de dados.
- `lib/routes/` — definição das rotas/navegação da aplicação (named routes, router config).
- `lib/screens/` — telas (pages) da aplicação; composição de componentes e ligação ao estado.
- `lib/services/` — serviços de infraestrutura (autenticação, analytics, notificações, chamadas HTTP auxiliares).
- `lib/theme/` — temas, cores, tipografia, e estilos compartilhados (Dark/Light/base themes).
- `lib/utils/` — utilitários e helpers genéricos (formatters, validators, constantes).

---

### Descrições detalhadas

#### `main.dart`
- Ponto de entrada do app. Inicializa bindings, dependências (DI), configura providers e monta `MaterialApp`/`CupertinoApp`.
- Recomendações: manter apenas bootstrapping aqui; toda lógica deve viver em `services/`, `providers/` ou `repositories/`.

#### `components/`
- Widgets pequenos a médios e reutilizáveis (botões customizados, avatares, cards, loaders, inputs especializados).
- Organização sugerida: agrupar por domínio ou por tipo (por exemplo `components/buttons/`, `components/cards/`).
- Evite lógica pesada; componentes devem receber dados e callbacks via parâmetros.

#### `models/`
- Definições de entidades usadas pela UI e camadas de dados (ex.: `User`, `Task`, `Session`).
- Incluir serialização (fromJson/toJson) e conversores, além de validações simples quando aplicável.

#### `providers/`
- Implementações de gerenciamento de estado (ChangeNotifier, Provider, Riverpod, Bloc, MobX, etc.).
- Cada provider deve expor um pequeno contrato: estado atual, métodos para ações e stream/notifier quando aplicável.
- Mantenha UI livre de lógica de negócio — chame providers para ações e leia estados.

#### `repositories/`
- Responsáveis por obter e persistir dados. Encapsulam fontes (REST, GraphQL, SQLite, SecureStorage, SharedPreferences).
- Exemplo: `UserRepository` expõe `Future<User> fetchProfile()`; internamente pode combinar cache + network.
- Favor interfaces (abstrações) para facilitar testes e mocks.

#### `routes/`
- Centraliza as rotas e a configuração do roteador. Pode conter gerador de rotas (`onGenerateRoute`) ou configuração do `go_router`/`beamer`.
- Incluir nomes constantes de rotas e, quando necessário, builders de argumentos tipados.

#### `screens/`
- Pastas por feature/screen, ex.: `screens/home/`, `screens/profile/`.
- Cada tela combina `components/` e consome `providers/` para apresentar dados.
- Mantenha telas focadas em composição e navegação; delegue lógica para providers e serviços.

#### `services/`
- Código de integração e infraestrutura: clientes HTTP configurados, armazenamento seguro, gestão de sessão, serviços de terceiros.
- Serviços são singletons (ou via DI). Evitar dependências da UI aqui.

#### `theme/`
- Contém `base_theme.dart`, `light_theme.dart`, `dark_theme.dart` e quaisquer utilitários de tema.
- Centralize cores, text styles e dimensões reutilizáveis.

#### `utils/`
- Funções e classes utilitárias independentes de UI (formatadores de data, validações, extensões, constantes globais).
- Evitar dependências cruzadas com providers ou services; se necessário, reavalie a localização.

---
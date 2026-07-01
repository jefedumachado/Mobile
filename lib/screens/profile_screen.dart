import 'package:dev_venture/models/enums.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/atividade_model.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel _mockUser;
  late List<AtividadeModel> _mockActivities;

  @override
  void initState() {
    super.initState();
    _carregarDadosMockados();
  }

  void _carregarDadosMockados() {
    // Novo exemplo de usuário de teste
    _mockUser = UserModel(
      id: widget.userId,
      nome: "Gabriel Kovalenko",
      level: UserLevels.junior,
      points: 620,
      role: UserRoles.student,
      criadoEm: DateTime.now().subtract(const Duration(days: 20)),
    );

    // Lista de atividades atualizada com novos exemplos
    _mockActivities = [
      AtividadeModel(
        id: "act_101",
        titulo: "Integração do Layout Claro no Flutter",
        descricao:
            "Implementação de ajustes visuais e componentes no fluxo de perfil.",
        concluida: true,
        pontos: 120,
        pontosGanhos: 120,
        data: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      AtividadeModel(
        id: "act_102",
        titulo: "Mapeamento de Enums no FromMap",
        descricao: "Correção no parsing de enums para o modelo de usuário.",
        concluida: true,
        pontos: 80,
        pontosGanhos: 80,
        data: DateTime.now().subtract(const Duration(days: 2)),
      ),
      AtividadeModel(
        id: "act_103",
        titulo: "Correção de LateInitializationError no Future",
        descricao:
            "Tratamento de inicialização tardia em chamadas assíncronas.",
        concluida: true,
        pontos: 150,
        pontosGanhos: 150,
        data: DateTime.now().subtract(const Duration(days: 4)),
      ),
    ];
  }

  int _getMaxPointsForLevel(UserLevels level) {
    switch (level) {
      case UserLevels.junior:
        return 1000;
      case UserLevels.pleno:
        return 3000;
      case UserLevels.senior:
        return 5000;
      default:
        return 1000;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    int maxPoints = _getMaxPointsForLevel(_mockUser.level);
    double progressFactor = (_mockUser.points / maxPoints).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow ?? colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Perfil do Desenvolvedor',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CARD DE IDENTIFICAÇÃO E SENIORIDADE
            Card(
              color: colorScheme.surfaceContainer ?? colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: colorScheme.primaryContainer,
                      child: Icon(
                        Icons.code,
                        size: 45,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _mockUser.nome,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Chip(
                      label: Text(
                        'Nível: ${_mockUser.level.name.toUpperCase()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      backgroundColor: colorScheme.primary,
                    ),
                    const SizedBox(height: 8),

                    // Modificado aqui: De "Role:" para "Função:" apenas no display da interface
                    Text(
                      'Função: ${_mockUser.role.name}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant.withOpacity(0.8),
                      ),
                    ),
                    Divider(
                      height: 32,
                      color: colorScheme.outlineVariant,
                      thickness: 0.5,
                    ),

                    // BARRA DE PROGRESSO DE XP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progresso de Senioridade',
                          style: TextStyle(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${_mockUser.points} / $maxPoints XP',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progressFactor,
                        minHeight: 12,
                        backgroundColor:
                            colorScheme.surfaceContainerHighest ??
                            Colors.grey.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // SEÇÃO: HISTÓRICO DE ATIVIDADES
            Text(
              'Últimas Atividades Concluídas',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),

            _mockActivities.isEmpty
                ? Text(
                    'Nenhuma atividade recente encontrada.',
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _mockActivities.length,
                    itemBuilder: (context, index) {
                      final atividade = _mockActivities[index];
                      String dataFormatada =
                          "${atividade.data.day}/${atividade.data.month}/${atividade.data.year}";

                      return Card(
                        color: colorScheme.surface,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color:
                                colorScheme.outlineVariant ??
                                colorScheme.outline.withOpacity(0.1),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: colorScheme.tertiaryContainer,
                            child: Icon(
                              Icons.bolt,
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                          title: Text(
                            atividade.titulo,
                            style: TextStyle(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            'Concluída em $dataFormatada',
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          trailing: Text(
                            '+${atividade.pontosGanhos} XP',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

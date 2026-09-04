import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../navigation/app_routes.dart';

class MenuLateralDoadora extends StatelessWidget {
  final String nomeUsuario;
  final String status;
  final String rotaAtual;

  const MenuLateralDoadora({
    super.key,
    required this.nomeUsuario,
    required this.status,
    required this.rotaAtual,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.azulEscuro,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppTheme.azulClaro.withOpacity(0.3),
                    child: Text(
                      nomeUsuario.isNotEmpty
                          ? nomeUsuario[0].toUpperCase()
                          : 'N',
                      style: const TextStyle(
                        color: AppTheme.branco,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nomeUsuario,
                          style: const TextStyle(
                            color: AppTheme.branco,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.verde.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '● $status',
                            style: const TextStyle(
                              color: Color(0xFF86EFAC),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white24),
            _buildMenuItem(
              context,
              icone: Icons.route,
              titulo: 'Jornada guiada',
              rota: AppRoutes.homeDoadora,
            ),
            _buildMenuItem(
              context,
              icone: Icons.history,
              titulo: 'Histórico de doações',
              rota: AppRoutes.historicoDoadora,
            ),
            _buildMenuItem(
              context,
              icone: Icons.water_drop,
              titulo: 'Registro de coleta',
              rota: AppRoutes.registroColeta,
            ),
            _buildMenuItem(
              context,
              icone: Icons.calendar_month,
              titulo: 'Agendamento',
              rota: AppRoutes.agendamentoDoadora,
            ),
            _buildMenuItem(
              context,
              icone: Icons.notifications_outlined,
              titulo: 'Notificações',
              rota: AppRoutes.notificacoesDoadora,
            ),
            _buildMenuItem(
              context,
              icone: Icons.person_outline,
              titulo: 'Meus dados',
              rota: AppRoutes.meusDadosDoadora,
            ),
            _buildMenuItem(
              context,
              icone: Icons.star_outline,
              titulo: 'Feedback',
              rota: AppRoutes.feedbackDoadora,
            ),
            const Spacer(),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white54,
                size: 20,
              ),
              title: const Text(
                'Voltar para o site',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.selecaoPerfil,
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icone,
    required String titulo,
    required String rota,
  }) {
    final isAtual = rotaAtual == rota;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isAtual ? AppTheme.azulMedio.withOpacity(0.4) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icone,
          color: isAtual ? AppTheme.azulClaro : Colors.white70,
          size: 20,
        ),
        title: Text(
          titulo,
          style: TextStyle(
            color: isAtual ? AppTheme.azulClaro : Colors.white70,
            fontSize: 14,
            fontWeight: isAtual ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          if (rotaAtual != rota) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              rota,
              (route) => route.isFirst,
            );
          }
        },
      ),
    );
  }
}

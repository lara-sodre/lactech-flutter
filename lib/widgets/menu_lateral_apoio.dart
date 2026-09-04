import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../navigation/app_routes.dart';

class MenuLateralApoio extends StatelessWidget {
  final String nomeUsuario;
  final String rotaAtual;

  const MenuLateralApoio({
    super.key,
    required this.nomeUsuario,
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
                          : 'F',
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
                          child: const Text(
                            '● Família cadastrada',
                            style: TextStyle(
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
              icone: Icons.support_agent,
              titulo: 'Suporte',
              rota: AppRoutes.homeApoio,
            ),
            _buildMenuItem(
              context,
              icone: Icons.calendar_month,
              titulo: 'Agendamento',
              rota: AppRoutes.agendamentoApoio,
            ),
            _buildMenuItem(
              context,
              icone: Icons.history,
              titulo: 'Histórico de consultas',
              rota: AppRoutes.historicoApoio,
            ),
            _buildMenuItem(
              context,
              icone: Icons.star_outline,
              titulo: 'Feedback',
              rota: AppRoutes.feedbackApoio,
            ),
            _buildMenuItem(
              context,
              icone: Icons.notifications_outlined,
              titulo: 'Notificações',
              rota: AppRoutes.notificacoesApoio,
            ),
            _buildMenuItem(
              context,
              icone: Icons.person_outline,
              titulo: 'Meus dados',
              rota: AppRoutes.meusDadosApoio,
            ),
            const Spacer(),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white54, size: 20),
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
        color: isAtual
            ? AppTheme.azulMedio.withOpacity(0.4)
            : Colors.transparent,
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

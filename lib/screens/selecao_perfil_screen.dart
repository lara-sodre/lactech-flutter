import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../navigation/app_routes.dart';

class SelecaoPerfilScreen extends StatelessWidget {
  const SelecaoPerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 56,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/imagens/logo_lactare.webp',
                        width: 270,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        'Como podemos ajudar você?',
                        style: TextStyle(
                          color: AppTheme.azulEscuro,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'Escolha uma opção para continuar',
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 26),

                      _buildPerfilCard(
                        context,
                        icone: Icons.volunteer_activism,
                        titulo: 'Pessoa Doadora',
                        subtitulo: 'Doe leite. Ajude a transformar vidas.',
                        cor: AppTheme.azulClaro,
                        perfil: 'doadora',
                      ),

                      const SizedBox(height: 14),

                      _buildPerfilCard(
                        context,
                        icone: Icons.family_restroom,
                        titulo: 'Rede de Apoio',
                        subtitulo: 'Cuide de quem cuida da vida.',
                        cor: const Color(0xFF4DD0E1),
                        perfil: 'apoio',
                      ),

                      const SizedBox(height: 14),

                      _buildPerfilCard(
                        context,
                        icone: Icons.groups,
                        titulo: 'Equipe Lactare',
                        subtitulo:
                            'Gerencie e transforme vidas através do leite.',
                        cor: const Color(0xFF90CAF9),
                        perfil: 'equipe',
                      ),

                      const SizedBox(height: 32),

                      Container(
                        width: 58,
                        height: 58,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEAF6FC),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.water_drop_outlined,
                          color: AppTheme.azulClaro,
                          size: 30,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Leite que alimenta. Cuidado que transforma.',
                        style: TextStyle(
                          color: AppTheme.azulEscuro,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 28,
                            height: 1,
                            color: const Color(0xFFB9DDF2),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.favorite,
                            color: AppTheme.azulClaro,
                            size: 13,
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 28,
                            height: 1,
                            color: const Color(0xFFB9DDF2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPerfilCard(
    BuildContext context, {
    required IconData icone,
    required String titulo,
    required String subtitulo,
    required Color cor,
    required String perfil,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.login,
          arguments: perfil,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xFFD8EAF6),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFFEAF6FC),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icone,
                color: cor,
                size: 27,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: AppTheme.azulEscuro,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      color: Color(0xFF718096),
                      fontSize: 12,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.chevron_right,
              color: AppTheme.azulClaro,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}

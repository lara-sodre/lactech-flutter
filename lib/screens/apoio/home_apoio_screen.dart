import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../data/mock_data.dart';
import '../../navigation/app_routes.dart';

class HomeApoioScreen extends StatelessWidget {
  final VoidCallback? onAgendar;

  const HomeApoioScreen({super.key, this.onAgendar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cinzaClaro,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.azulEscuro,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá, ${familiaLogada.nome.split(' ').first}! 💙',
                    style: const TextStyle(
                      color: AppTheme.branco,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Essa jornada tem seus desafios, e você não precisa enfrentá-los sozinha.',
                    style: TextStyle(
                      color: AppTheme.branco.withOpacity(0.75),
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Como podemos te ajudar:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppTheme.azulEscuro,
              ),
            ),
            const SizedBox(height: 14),

            _buildServicoCard(
              context,
              icone: Icons.psychology_outlined,
              titulo: 'Apoio Psicológico',
              descricao:
                  'A chegada de um bebê transforma tudo. Nossas psicólogas oferecem um espaço seguro e sem julgamentos para você falar sobre o que está sentindo.',
              cor: const Color(0xFF7B2D8B),
            ),
            const SizedBox(height: 12),

            _buildServicoCard(
              context,
              icone: Icons.healing_outlined,
              titulo: 'Assistência Técnica',
              descricao:
                  'Dificuldades na pega, dúvidas sobre a sucção do bebê ou técnicas de ordenha? Nossa equipe de enfermeiras e médicos oferece orientações práticas.',
              cor: AppTheme.azulMedio,
            ),
            const SizedBox(height: 12),

            _buildServicoCard(
              context,
              icone: Icons.favorite_outline,
              titulo: 'Acolhimento Emocional',
              descricao:
                  'Um espaço de escuta ativa, sem julgamentos, onde você pode falar sobre o que está sentindo. Nossa equipe está aqui para fortalecer sua autoconfiança.',
              cor: const Color(0xFF00897B),
            ),
            const SizedBox(height: 20),

            const Text(
              'Serviços de Saúde',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppTheme.azulEscuro,
              ),
            ),
            const SizedBox(height: 14),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
              children: [
                _buildSaudeCard(
                  icone: Icons.child_care,
                  titulo: 'Pediatria',
                  descricao: 'Cuidamos do crescimento e desenvolvimento do seu bebê.',
                  cor: AppTheme.azulMedio,
                ),
                _buildSaudeCard(
                  icone: Icons.psychology,
                  titulo: 'Apoio Psicológico',
                  descricao: 'Suporte e acolhimento para mães em todas as fases.',
                  cor: const Color(0xFF7B2D8B),
                ),
                _buildSaudeCard(
                  icone: Icons.local_hospital,
                  titulo: 'Atendimento Infantil',
                  descricao: 'Atendimento médico completo para bebês e crianças.',
                  cor: AppTheme.vermelho,
                ),
                _buildSaudeCard(
                  icone: Icons.medical_services,
                  titulo: 'Odontologia',
                  descricao: 'Cuidando da saúde bucal desde os primeiros dentes.',
                  cor: AppTheme.verde,
                ),
              ],
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAgendar ?? () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.agendamentoApoio,
                  );
                },
                icon: const Icon(Icons.calendar_month),
                label: const Text(
                  'Agendar Serviço',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicoCard(
    BuildContext context, {
    required IconData icone,
    required String titulo,
    required String descricao,
    required Color cor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cor.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: cor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icone, color: cor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: cor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descricao,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.cinzaTexto,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaudeCard({
    required IconData icone,
    required String titulo,
    required String descricao,
    required Color cor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: cor, size: 24),
          const SizedBox(height: 6),
          Text(
            titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: cor,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            descricao,
            style: const TextStyle(
              fontSize: 10,
              color: AppTheme.cinzaTexto,
              height: 1.3,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

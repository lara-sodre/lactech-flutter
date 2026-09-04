import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../data/mock_data.dart';
import '../../widgets/consulta_card.dart';

class HistoricoApoioScreen extends StatelessWidget {
  const HistoricoApoioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final realizadas =
        consultasMockadas.where((c) => c.status == 'Realizada').length;
    final agendadas =
        consultasMockadas.where((c) => c.status == 'Agendada').length;
    final canceladas =
        consultasMockadas.where((c) => c.status == 'Cancelada').length;

    return Scaffold(
      backgroundColor: AppTheme.cinzaClaro,
      body: Column(
        children: [
          Container(
            color: AppTheme.branco,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _buildResumo(
                    '$realizadas',
                    'Realizadas',
                    AppTheme.verde,
                  ),
                ),
                Container(
                    width: 1,
                    height: 40,
                    color: const Color(0xFFE5E7EB)),
                Expanded(
                  child: _buildResumo(
                    '$agendadas',
                    'Agendadas',
                    AppTheme.azulMedio,
                  ),
                ),
                Container(
                    width: 1,
                    height: 40,
                    color: const Color(0xFFE5E7EB)),
                Expanded(
                  child: _buildResumo(
                    '$canceladas',
                    'Canceladas',
                    AppTheme.vermelho,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: consultasMockadas.length,
              itemBuilder: (context, index) =>
                  ConsultaCard(consulta: consultasMockadas[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResumo(String valor, String label, Color cor) {
    return Column(
      children: [
        Text(
          valor,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: cor,
          ),
        ),
        Text(
          label,
          style:
              const TextStyle(fontSize: 11, color: AppTheme.cinzaTexto),
        ),
      ],
    );
  }
}

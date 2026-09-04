import 'package:flutter/material.dart';
import '../models/consulta.dart';
import '../app_theme.dart';

class ConsultaCard extends StatelessWidget {
  final Consulta consulta;

  const ConsultaCard({super.key, required this.consulta});

  Color get _corStatus {
    switch (consulta.status) {
      case 'Realizada':
        return AppTheme.verde;
      case 'Agendada':
        return AppTheme.azulMedio;
      case 'Cancelada':
        return AppTheme.vermelho;
      default:
        return AppTheme.cinzaTexto;
    }
  }

  Color get _corTipo {
    switch (consulta.tipoServico) {
      case 'Apoio psicológico':
        return const Color(0xFF7B2D8B);
      case 'Assistência técnica':
        return AppTheme.azulMedio;
      case 'Acolhimento emocional':
        return const Color(0xFF00897B);
      default:
        return AppTheme.azulEscuro;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    consulta.data,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _corStatus.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _corStatus.withOpacity(0.3)),
                  ),
                  child: Text(
                    consulta.status,
                    style: TextStyle(
                      color: _corStatus,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              consulta.horario,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.cinzaTexto,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: _corTipo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                consulta.tipoServico,
                style: TextStyle(
                  color: _corTipo,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              consulta.profissional,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.cinzaTexto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

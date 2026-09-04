import 'package:flutter/material.dart';
import '../models/coleta.dart';
import '../app_theme.dart';

class ColetaCard extends StatelessWidget {
  final Coleta coleta;

  const ColetaCard({super.key, required this.coleta});

  Color get _corStatus {
    switch (coleta.status) {
      case 'Recebido com sucesso!':
        return AppTheme.verde;
      case 'A caminho do hospital':
        return AppTheme.amarelo;
      default:
        return AppTheme.azulMedio;
    }
  }

  IconData get _iconeStatus {
    switch (coleta.status) {
      case 'Recebido com sucesso!':
        return Icons.check_circle;
      case 'A caminho do hospital':
        return Icons.local_shipping;
      default:
        return Icons.science;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _corStatus.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(_iconeStatus, color: _corStatus, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coleta.data,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${coleta.volumeMl} ml · ${coleta.turno}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.cinzaTexto,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: _corStatus.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _corStatus.withOpacity(0.3)),
              ),
              child: Text(
                coleta.status,
                style: TextStyle(
                  color: _corStatus,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/notificacao.dart';
import '../app_theme.dart';

class NotificacaoItem extends StatelessWidget {
  final Notificacao notificacao;

  const NotificacaoItem({super.key, required this.notificacao});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: notificacao.lida
            ? AppTheme.branco
            : AppTheme.azulFundo,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: notificacao.lida
              ? const Color(0xFFE5E7EB)
              : AppTheme.azulClaro.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: notificacao.lida
                  ? Colors.transparent
                  : AppTheme.azulMedio,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificacao.titulo,
                  style: TextStyle(
                    fontWeight: notificacao.lida
                        ? FontWeight.normal
                        : FontWeight.bold,
                    fontSize: 13,
                    color: AppTheme.azulEscuro,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  notificacao.descricao,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.cinzaTexto,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notificacao.horario,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppTheme.cinzaTexto,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../app_theme.dart';

class HistoricoDoadoraScreen extends StatelessWidget {
  const HistoricoDoadoraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Doações',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Acompanhe seu histórico e seu impacto.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF7B8BA5),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Resumo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
              ),
            ),

            const SizedBox(height: 12),


            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFE1E8F0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _resumoCard(
                      Icons.water_drop_outlined,
                      '6',
                      'Coletas realizadas',
                      'Desde o cadastro',
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: _resumoCard(
                      Icons.local_drink_outlined,
                      '1.0 L',
                      'Leite doado',
                      'Volume total',
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: _resumoCard(
                      Icons.calendar_month_outlined,
                      '28/05',
                      'Próxima coleta',
                      '09h00 • Agendada',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Histórico de doações',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.azulEscuro,
                  ),
                ),

                Row(
                  children: [
                    const Text(
                      'Filtrar',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.azulEscuro,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.filter_alt_outlined,
                      color: AppTheme.azulEscuro,
                      size: 21,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            _doacao(
              data: '20/05/2026',
              quantidade: '180 ml',
              status: 'Recebido com sucesso',
              sucesso: true,
            ),

            _doacao(
              data: '13/05/2026',
              quantidade: '210 ml',
              status: 'Recebido com sucesso',
              sucesso: true,
            ),

            _doacao(
              data: '06/05/2026',
              quantidade: '95 ml',
              status: 'A caminho do hospital',
              sucesso: false,
            ),

            _doacao(
              data: '29/04/2026',
              quantidade: '160 ml',
              status: 'Recebido com sucesso',
              sucesso: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _resumoCard(
    IconData icone,
    String valor,
    String titulo,
    String subtitulo,
  ) {
    return Container(
      height: 205,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFCFE),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFB8C9DC),
              ),
            ),
            child: Icon(
              icone,
              color: AppTheme.azulEscuro,
              size: 25,
            ),
          ),

          const Spacer(),

          Text(
            valor,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500,
              color: AppTheme.azulEscuro,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            titulo,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.azulEscuro,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            subtitulo,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF718096),
            ),
          ),
        ],
      ),
    );
  }

  Widget _doacao({
    required String data,
    required String quantidade,
    required String status,
    required bool sucesso,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE1E8F0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFF0F3F7),
              shape: BoxShape.circle,
            ),
            child: Icon(
              sucesso
                  ? Icons.check_rounded
                  : Icons.local_shipping_outlined,
              color: AppTheme.azulEscuro,
              size: 25,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.azulEscuro,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  quantidade,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FC),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFD6DEE8),
              ),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: AppTheme.azulEscuro,
              ),
            ),
          ),

          const SizedBox(width: 7),

          const Icon(
            Icons.chevron_right_rounded,
            color: AppTheme.azulEscuro,
          ),
        ],
      ),
    );
  }
}

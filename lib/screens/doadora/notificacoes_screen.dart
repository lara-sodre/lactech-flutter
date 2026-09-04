import 'package:flutter/material.dart';

import '../../app_theme.dart';

class NotificacoesScreen extends StatelessWidget {
  const NotificacoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      appBar: AppBar(
        backgroundColor: AppTheme.azulEscuro,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Voltar',
        ),

        title: const Text(
          'Notificações',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),

        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 14,
              top: 13,
              bottom: 13,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE45545),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '2 novas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            16,
            0,
            16,
            30,
          ),
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: const Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: AppTheme.azulMedio,
                      size: 21,
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        'Acompanhe tudo que acontece por aqui.',
                        style: TextStyle(
                          color: Color(0xFF7A8491),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              _notificacao(
                titulo:
                    'Coleta de 20/05 chegou ao hospital!',
                descricao:
                    'Seu leite foi entregue ao banco de leite com sucesso.',
                horario: 'Hoje, 10:32',
                nova: true,
              ),


              _notificacao(
                titulo:
                    'Consulta confirmada para 28/05 às 09h00.',
                descricao:
                    'Lembre-se de estar disponível no horário agendado.',
                horario: 'Ontem, 14:15',
                nova: true,
              ),


              _notificacao(
                titulo:
                    'Coleta de 06/05 ainda em análise laboratorial.',
                descricao:
                    'Aguarde a confirmação do resultado da análise.',
                horario: '22/05, 09:00',
              ),


              _notificacao(
                titulo:
                    'Obrigada pelo seu feedback!',
                descricao:
                    'Sua avaliação foi registrada com sucesso.',
                horario: '20/05, 16:44',
              ),


              _notificacao(
                titulo:
                    'Lembrete: próxima coleta em 3 dias (28/05).',
                descricao:
                    'Prepare o material para a coleta com antecedência.',
                horario: '22/05, 08:00',
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _notificacao({
    required String titulo,
    required String descricao,
    required String horario,
    bool nova = false,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: const EdgeInsets.fromLTRB(
        18,
        17,
        18,
        17,
      ),
      decoration: BoxDecoration(
        color: nova
            ? const Color(0xFFE8F7FC)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: nova
              ? const Color(0xFFBFE6F5)
              : const Color(0xFFE1E7ED),
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          if (nova)
            Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.only(
                top: 6,
                right: 12,
              ),
              decoration: const BoxDecoration(
                color: AppTheme.azulMedio,
                shape: BoxShape.circle,
              ),
            )
          else
            const SizedBox(width: 22),


          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    color: AppTheme.azulEscuro,
                    fontSize: 15,
                    fontWeight: nova
                        ? FontWeight.w700
                        : FontWeight.w500,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  descricao,
                  style: const TextStyle(
                    color: Color(0xFF7A8491),
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  horario,
                  style: const TextStyle(
                    color: Color(0xFF8A949F),
                    fontSize: 12,
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

import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../data/mock_data.dart';

class MeusDadosApoioScreen extends StatelessWidget {
  const MeusDadosApoioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final f = familiaLogada;

    return Scaffold(
      backgroundColor: AppTheme.cinzaClaro,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Voltar',
        ),
        title: const Text('Meus Dados')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.azulEscuro,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor:
                        AppTheme.azulClaro.withOpacity(0.3),
                    child: Text(
                      f.nome[0],
                      style: const TextStyle(
                        color: AppTheme.branco,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    f.nome,
                    style: const TextStyle(
                      color: AppTheme.branco,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.verde.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '● Família cadastrada',
                      style: TextStyle(
                        color: Color(0xFF86EFAC),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: AppTheme.branco,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Icon(Icons.person_outline,
                            color: AppTheme.azulMedio, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Dados Pessoais',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppTheme.azulEscuro,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  ...[
                    _InfoItem('Nome completo', f.nome),
                    _InfoItem('Data de nascimento', f.dataNascimento),
                    _InfoItem('CPF', f.cpf),
                    _InfoItem('Telefone', f.telefone),
                    _InfoItem('E-mail', f.email),
                    _InfoItem('Endereço', f.endereco),
                  ].map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              item.label,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppTheme.cinzaTexto,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.valor,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.azulEscuro,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem {
  final String label;
  final String valor;
  const _InfoItem(this.label, this.valor);
}

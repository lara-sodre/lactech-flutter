import 'package:flutter/material.dart';

import '../../app_theme.dart';

class MeusDadosScreen extends StatelessWidget {
  const MeusDadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      appBar: AppBar(
        backgroundColor: AppTheme.azulEscuro,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Meus Dados',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            16,
            18,
            16,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.azulEscuro,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2874B8),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'M',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Maria Aparecida Silva',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF176B45),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xFF80E6AE),
                            size: 10,
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Ativa desde Janeiro 2025',
                            style: TextStyle(
                              color: Color(0xFF9AF0BE),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),


              _buildSectionCard(
                titulo: 'Dados Pessoais',
                icone: Icons.person_outline_rounded,
                children: [
                  _buildInfoRow(
                    'Nome completo',
                    'Maria Aparecida Silva',
                  ),
                  _buildInfoRow(
                    'Data de nascimento',
                    '12/03/1992',
                  ),
                  _buildInfoRow(
                    'CPF',
                    '***.456.789-**',
                  ),
                  _buildInfoRow(
                    'Telefone',
                    '(11) 99876-5432',
                  ),
                  _buildInfoRow(
                    'E-mail',
                    'maria.silva@email.com',
                  ),
                  _buildInfoRow(
                    'Endereço',
                    'Rua das Flores, 142 — Itapevi, SP',
                    ultimo: true,
                  ),
                ],
              ),

              const SizedBox(height: 18),


              _buildSectionCard(
                titulo: 'Dados da Doação',
                icone: Icons.water_drop_outlined,
                children: [
                  _buildInfoRow(
                    'Bebê em\namamentação',
                    'Sim — 4 meses',
                  ),
                  _buildInfoRow(
                    'Método de coleta',
                    'Bomba elétrica',
                  ),
                  _buildInfoRow(
                    'Alergias conhecidas',
                    'Nenhuma',
                  ),
                  _buildInfoRow(
                    'Medicamentos em uso',
                    'Nenhum no momento',
                    ultimo: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSectionCard({
    required String titulo,
    required IconData icone,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              18,
              16,
              18,
              14,
            ),
            child: Row(
              children: [
                Icon(
                  icone,
                  color: AppTheme.azulMedio,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  titulo,
                  style: const TextStyle(
                    color: AppTheme.azulEscuro,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
            color: Color(0xFFE5EAF0),
          ),

          ...children,
        ],
      ),
    );
  }


  Widget _buildInfoRow(
    String titulo,
    String valor, {
    bool ultimo = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        border: ultimo
            ? null
            : const Border(
                bottom: BorderSide(
                  color: Color(0xFFE9EDF2),
                ),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              titulo,
              style: const TextStyle(
                color: Color(0xFF7A8491),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: Text(
              valor,
              style: const TextStyle(
                color: AppTheme.azulEscuro,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

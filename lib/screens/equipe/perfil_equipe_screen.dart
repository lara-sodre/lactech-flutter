import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../data/mock_data.dart';

class PerfilEquipeScreen extends StatelessWidget {
  const PerfilEquipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cinzaClaro,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Voltar',
        ),
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.azulEscuro,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: AppTheme.azulMedio,
                    child: Text(
                      'E',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Equipe Lactare',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Acesso administrativo',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.branco,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  _item('Usuário', usuarioEquipe),
                  const Divider(height: 24),
                  _item('Perfil', 'Equipe Lactare'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String titulo, String valor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            titulo,
            style: const TextStyle(
              color: AppTheme.cinzaTexto,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            valor,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppTheme.azulEscuro,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

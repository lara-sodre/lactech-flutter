import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../navigation/app_routes.dart';
import '../widgets/app_button.dart';

class CadastroSucessoScreen extends StatelessWidget {
  const CadastroSucessoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.azulEscuro.withOpacity(0.10),
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: AppTheme.azulEscuro,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 28),


                const Text(
                  'Cadastro realizado\ncom sucesso!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.azulEscuro,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 16),


                const Text(
                  'Agora é só fazer login e começar sua\nexperiência com a gente!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppTheme.azulEscuro,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 12),


                const Text(
                  'Próximo passo:',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.azulEscuro,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 32),


                AppButton(
                  texto: 'Voltar para tela de login',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                      arguments: 'doadora',
                    );
                  },
                  icone: Icons.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

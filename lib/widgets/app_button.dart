import 'package:flutter/material.dart';
import '../app_theme.dart';

class AppButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final bool outlined;
  final bool carregando;
  final IconData? icone;
  final Color? cor;

  const AppButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.outlined = false,
    this.carregando = false,
    this.icone,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    final corBotao = cor ?? AppTheme.azulEscuro;

    if (outlined) {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: carregando ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: corBotao,
            side: BorderSide(color: corBotao, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: _buildChild(corBotao),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: carregando ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: corBotao,
          foregroundColor: AppTheme.branco,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _buildChild(AppTheme.branco),
      ),
    );
  }

  Widget _buildChild(Color cor) {
    if (carregando) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppTheme.branco,
        ),
      );
    }
    if (icone != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icone, size: 20, color: cor),
          const SizedBox(width: 8),
          Text(
            texto,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: cor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      );
    }
    return Text(
      texto,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: cor,
        letterSpacing: 0.5,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../app_theme.dart';

class CabecalhoDoadora extends StatelessWidget {
  final VoidCallback? onNotificacoes;
  final VoidCallback? onPerfil;
  final bool mostrarNotificacoes;
  final bool mostrarPerfil;

  const CabecalhoDoadora({
    super.key,
    this.onNotificacoes,
    this.onPerfil,
    this.mostrarNotificacoes = true,
    this.mostrarPerfil = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [

          SizedBox(
            width: 120,
            height: 58,
            child: Image.asset(
              'assets/imagens/logo_lactare.webp',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),

          const Spacer(),


          if (mostrarPerfil) ...[
            GestureDetector(
              onTap: onPerfil,
              behavior: HitTestBehavior.opaque,
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Center(
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 28,
                    color: AppTheme.azulEscuro,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],

          if (mostrarNotificacoes)
            GestureDetector(
              onTap: onNotificacoes,
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.notifications_none_rounded,
                      size: 28,
                      color: AppTheme.azulEscuro,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppTheme.azulEscuro,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (!mostrarPerfil)
            GestureDetector(
              onTap: onPerfil,
              behavior: HitTestBehavior.opaque,
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Center(
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 28,
                    color: AppTheme.azulEscuro,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../app_theme.dart';

/// Bottom Navigation única e reutilizável para os três perfis.
/// A aparência é padronizada a partir da navegação da Pessoa Doadora.
class BarraNavegacao extends StatelessWidget {
  final int indiceSelecionado;

  final String textoInicio;
  final IconData iconeInicio;

  final String textoSegundo;
  final IconData iconeSegundo;

  final String textoCentral;

  final String textoQuarto;
  final IconData iconeQuarto;

  final VoidCallback onInicio;
  final VoidCallback onSegundo;
  final VoidCallback onCentral;
  final VoidCallback onQuarto;
  final VoidCallback onMenu;

  const BarraNavegacao({
    super.key,
    required this.indiceSelecionado,
    required this.onInicio,
    required this.onSegundo,
    required this.onCentral,
    required this.onQuarto,
    required this.onMenu,
    this.textoInicio = 'Início',
    this.iconeInicio = Icons.home_outlined,
    this.textoSegundo = 'Doações',
    this.iconeSegundo = Icons.favorite_border_rounded,
    this.textoCentral = 'Registrar coleta',
    this.textoQuarto = 'Agenda',
    this.iconeQuarto = Icons.calendar_month_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 82,
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            top: BorderSide(
              color: Color(0xFFE8EDF3),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [

            Expanded(
              child: _Item(
                icone: iconeInicio,
                texto: textoInicio,
                selecionado: indiceSelecionado == 0,
                onTap: onInicio,
              ),
            ),


            Expanded(
              child: _Item(
                icone: iconeSegundo,
                texto: textoSegundo,
                selecionado: indiceSelecionado == 1,
                onTap: onSegundo,
              ),
            ),


            Expanded(
              child: _Item(
                icone: Icons.add_rounded,
                texto: textoCentral,
                selecionado: indiceSelecionado == 2,
                onTap: onCentral,
                central: true,
              ),
            ),


            Expanded(
              child: _Item(
                icone: iconeQuarto,
                texto: textoQuarto,
                selecionado: indiceSelecionado == 3,
                onTap: onQuarto,
              ),
            ),


            Expanded(
              child: _Item(
                icone: Icons.menu_rounded,
                texto: 'Menu',
                selecionado: false,
                onTap: onMenu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _Item extends StatelessWidget {
  final IconData icone;
  final String texto;
  final bool selecionado;
  final VoidCallback onTap;
  final bool central;

  const _Item({
    required this.icone,
    required this.texto,
    required this.selecionado,
    required this.onTap,
    this.central = false,
  });

  @override
  Widget build(BuildContext context) {

    if (central) {
      return InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: selecionado
                      ? AppTheme.azulEscuro
                      : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.azulEscuro,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.azulEscuro.withOpacity(0.18),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  icone,
                  size: 32,
                  color: selecionado
                      ? Colors.white
                      : AppTheme.azulEscuro,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                texto,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: selecionado
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: selecionado
                      ? AppTheme.azulEscuro
                      : const Color(0xFF718096),
                ),
              ),
            ],
          ),
        ),
      );
    }


    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              size: 24,
              color: selecionado
                  ? AppTheme.azulEscuro
                  : const Color(0xFF718096),
            ),

            const SizedBox(height: 4),

            Text(
              texto,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                fontWeight: selecionado
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: selecionado
                    ? AppTheme.azulEscuro
                    : const Color(0xFF718096),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:lactare/app_theme.dart';
import 'package:lactare/navigation/app_routes.dart';
import 'package:lactare/widgets/barra_navegacao.dart';
import 'package:lactare/widgets/cabecalho_doadora.dart';

import 'package:lactare/screens/apoio/home_apoio_screen.dart';
import 'package:lactare/screens/apoio/historico_apoio_screen.dart';
import 'package:lactare/screens/apoio/agendamento_apoio_screen.dart';
import 'package:lactare/screens/apoio/feedback_apoio_screen.dart';

class ApoioShellScreen extends StatefulWidget {
  const ApoioShellScreen({super.key});

  @override
  State<ApoioShellScreen> createState() => _ApoioShellScreenState();
}

class _ApoioShellScreenState extends State<ApoioShellScreen> {
  int _indice = 0;

  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();

    _telas = [
      HomeApoioScreen(
        onAgendar: () => _selecionar(2),
      ),
      const HistoricoApoioScreen(),
      const AgendamentoApoioScreen(),
      const FeedbackApoioScreen(),
    ];
  }

  void _selecionar(int indice) {
    if (!mounted) return;

    setState(() {
      _indice = indice;
    });
  }

  void _abrirMenu() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Container(
          decoration: const BoxDecoration(
            color: AppTheme.branco,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(
            22,
            12,
            22,
            28,
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppTheme.cinzaClaro,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Menu',
                      style: TextStyle(
                        color: AppTheme.azulEscuro,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppTheme.azulEscuro,
                      ),
                    ),
                  ],
                ),

                _itemMenu(
                  sheetContext,
                  Icons.person_outline_rounded,
                  'Meus dados',
                  AppRoutes.meusDadosApoio,
                ),

                _itemMenu(
                  sheetContext,
                  Icons.notifications_none_rounded,
                  'Notificações',
                  AppRoutes.notificacoesApoio,
                ),

                const SizedBox(height: 4),

                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.selecaoPerfil,
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text('Sair'),
                      style: TextButton.styleFrom(
                        foregroundColor: AppTheme.azulEscuro,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _itemMenu(
    BuildContext sheetContext,
    IconData icon,
    String title,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          Navigator.pop(sheetContext);

          Navigator.pushNamed(
            context,
            route,
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: AppTheme.azulFundo,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppTheme.branco,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: AppTheme.azulMedio,
                  size: 21,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.azulEscuro,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.cinzaTexto,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.branco,

      body: Column(
        children: [
          SizedBox(
            height: 76,
            child: CabecalhoDoadora(
              mostrarNotificacoes: true,
              mostrarPerfil: false,
              onNotificacoes: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.notificacoesApoio,
                );
              },
              onPerfil: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.meusDadosApoio,
                );
              },
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _indice,
              children: _telas,
            ),
          ),
        ],
      ),

      bottomNavigationBar: BarraNavegacao(
        indiceSelecionado: _indice,

        textoInicio: 'Início',

        textoSegundo: 'Histórico',
        iconeSegundo: Icons.history_rounded,

        textoCentral: 'Agendar serviço',

        textoQuarto: 'Feedback',
        iconeQuarto: Icons.chat_bubble_outline_rounded,

        onInicio: () => _selecionar(0),
        onSegundo: () => _selecionar(1),
        onCentral: () => _selecionar(2),
        onQuarto: () => _selecionar(3),

        onMenu: _abrirMenu,
      ),
    );
  }
}

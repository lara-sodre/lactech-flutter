import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/barra_navegacao.dart';
import '../../widgets/cabecalho_doadora.dart';

import 'home_doadora_screen.dart';
import 'historico_doadora_screen.dart';
import 'registro_coleta_screen.dart';
import 'agendamento_doadora_screen.dart';
import 'meus_dados_screen.dart';
import 'notificacoes_screen.dart';
import 'feedback_screen.dart';

class DoadoraShellScreen extends StatefulWidget {
  const DoadoraShellScreen({
    super.key,
  });

  @override
  State<DoadoraShellScreen> createState() =>
      _DoadoraShellScreenState();
}

class _DoadoraShellScreenState
    extends State<DoadoraShellScreen> {


  int _indice = 0;

  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();

    _telas = [

      HomeDoadoraScreen(
        onDoacoes: () {
          _selecionarAba(1);
        },
        onAgenda: () {
          _selecionarAba(3);
        },
        onRegistrar: () {
          _selecionarAba(2);
        },
      ),


      const HistoricoDoadoraScreen(),


      RegistroColetaScreen(
        onIrParaDoacoes: () {
          _selecionarAba(1);
        },
        onVoltarParaInicio: () {
          _selecionarAba(0);
        },
      ),


      const AgendamentoDoadoraScreen(),
    ];
  }


  void _selecionarAba(int indice) {
    if (!mounted) return;

    setState(() {
      _indice = indice;
    });
  }


  void _abrirTela(Widget tela) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (
          context,
          animation,
          secondaryAnimation,
        ) {
          return tela;
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }


  void _abrirNotificacoes() {
    _abrirTela(
      const NotificacoesScreen(),
    );
  }


  void _abrirMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.45),
      builder: (sheetContext) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
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
                    color: const Color(0xFFD5DCE8),
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 18),


                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
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
                        size: 28,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),


                _menuItem(
                  sheetContext,
                  Icons.person_outline_rounded,
                  'Meus dados',
                  () {
                    _abrirTela(
                      const MeusDadosScreen(),
                    );
                  },
                ),


                _menuItem(
                  sheetContext,
                  Icons.notifications_none_rounded,
                  'Notificações',
                  () {
                    _abrirTela(
                      const NotificacoesScreen(),
                    );
                  },
                ),


                _menuItem(
                  sheetContext,
                  Icons.chat_bubble_outline_rounded,
                  'Feedback',
                  () {
                    _abrirTela(
                      const FeedbackScreen(),
                    );
                  },
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


  Widget _menuItem(
    BuildContext sheetContext,
    IconData icone,
    String titulo,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pop(sheetContext);
          onTap();
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF4FAFE),
            borderRadius:
                BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFEAF4FF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icone,
                  color: AppTheme.azulMedio,
                  size: 21,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Text(
                  titulo,
                  style: const TextStyle(
                    color: AppTheme.azulEscuro,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFF8A98AE),
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
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            CabecalhoDoadora(
              onNotificacoes:
                  _abrirNotificacoes,
            ),


            Expanded(
              child: IndexedStack(
                index: _indice,
                children: _telas,
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar:
          BarraNavegacao(
        indiceSelecionado: _indice,

        onInicio: () {
          _selecionarAba(0);
        },

        onSegundo: () {
          _selecionarAba(1);
        },

        onCentral: () {
          _selecionarAba(2);
        },

        onQuarto: () {
          _selecionarAba(3);
        },

        onMenu: () {
          _abrirMenu();
        },
      ),
    );
  }
}

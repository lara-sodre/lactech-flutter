import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/barra_navegacao.dart';
import '../../widgets/cabecalho_doadora.dart';
import 'dashboard_screen.dart';
import 'perfil_equipe_screen.dart';

class EquipeShellScreen extends StatefulWidget {
  const EquipeShellScreen({super.key});

  @override
  State<EquipeShellScreen> createState() => _EquipeShellScreenState();
}

class _EquipeShellScreenState extends State<EquipeShellScreen> {
  late final ValueNotifier<int> _secaoNotifier;

  int _indice = 0;

  @override
  void initState() {
    super.initState();
    _secaoNotifier = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _secaoNotifier.dispose();
    super.dispose();
  }

  void _selecionar(int indice) {
    setState(() {
      _indice = indice;
    });

    if (indice >= 0 && indice <= 3) {
      _secaoNotifier.value = indice;
    }
  }

  void _abrirMenu() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.45),
      builder: (sheetContext) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppTheme.branco,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 28),
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
                      onPressed: () => Navigator.pop(sheetContext),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppTheme.azulEscuro,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _itemMenu(
                  sheetContext,
                  Icons.person_outline_rounded,
                  'Perfil',
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
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: AppTheme.azulEscuro,
                      ),
                      label: const Text(
                        'Sair',
                        style: TextStyle(
                          color: AppTheme.azulEscuro,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: TextButton.styleFrom(
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
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          Navigator.pop(sheetContext);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const PerfilEquipeScreen(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
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
      backgroundColor: AppTheme.cinzaClaro,

      body: SafeArea(
        child: Column(
          children: [
            CabecalhoDoadora(
              mostrarNotificacoes: false,
              onPerfil: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const PerfilEquipeScreen(),
                  ),
                );
              },
            ),
            Expanded(
              child: DashboardScreen(
                secaoNotifier: _secaoNotifier,
                mostrarAppBar: false,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BarraNavegacao(
        indiceSelecionado: _indice,

        textoInicio: 'Início',

        textoSegundo: 'Doadoras',
        iconeSegundo: Icons.people_outline,

        textoCentral: 'Suporte',

        textoQuarto: 'Impacto',
        iconeQuarto: Icons.favorite_border,

        onInicio: () {
          _selecionar(0);
        },

        onSegundo: () {
          _selecionar(1);
        },

        onCentral: () {
          _selecionar(2);
        },

        onQuarto: () {
          _selecionar(3);
        },

        onMenu: _abrirMenu,
      ),
    );
  }
}

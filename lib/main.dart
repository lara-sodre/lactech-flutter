import 'package:flutter/material.dart';

import 'package:lactare/app_theme.dart';
import 'package:lactare/navigation/app_routes.dart';

import 'package:lactare/screens/splash_screen.dart';
import 'package:lactare/screens/selecao_perfil_screen.dart';
import 'package:lactare/screens/login_screen.dart';
import 'package:lactare/screens/cadastro_screen.dart';
import 'package:lactare/screens/cadastro_sucesso_screen.dart';

import 'package:lactare/screens/doadora/doadora_shell_screen.dart';
import 'package:lactare/screens/doadora/home_doadora_screen.dart';
import 'package:lactare/screens/doadora/historico_doadora_screen.dart';
import 'package:lactare/screens/doadora/registro_coleta_screen.dart';
import 'package:lactare/screens/doadora/agendamento_doadora_screen.dart';
import 'package:lactare/screens/doadora/notificacoes_screen.dart';
import 'package:lactare/screens/doadora/meus_dados_screen.dart';
import 'package:lactare/screens/doadora/feedback_screen.dart';

import 'package:lactare/screens/apoio/apoio_shell_screen.dart';
import 'package:lactare/screens/apoio/home_apoio_screen.dart';
import 'package:lactare/screens/apoio/agendamento_apoio_screen.dart';
import 'package:lactare/screens/apoio/historico_apoio_screen.dart';
import 'package:lactare/screens/apoio/notificacoes_apoio_screen.dart';
import 'package:lactare/screens/apoio/meus_dados_apoio_screen.dart';
import 'package:lactare/screens/apoio/feedback_apoio_screen.dart';

import 'package:lactare/screens/equipe/equipe_shell_screen.dart';
import 'package:lactare/screens/equipe/dashboard_screen.dart';
import 'package:lactare/screens/equipe/perfil_equipe_screen.dart';

void main() {
  runApp(const LactareApp());
}

class LactareApp extends StatelessWidget {
  const LactareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lactare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.splash:
            return MaterialPageRoute(
              builder: (_) => const SplashScreen(),
            );

          case AppRoutes.selecaoPerfil:
            return MaterialPageRoute(
              builder: (_) => const SelecaoPerfilScreen(),
            );

          case AppRoutes.login:
            final perfil =
                settings.arguments as String? ?? 'doadora';

            return MaterialPageRoute(
              builder: (_) => LoginScreen(
                perfil: perfil,
              ),
            );

          case AppRoutes.cadastro:
            return MaterialPageRoute(
              builder: (_) => const CadastroScreen(),
            );

          case AppRoutes.cadastroSucesso:
            return MaterialPageRoute(
              builder: (_) => const CadastroSucessoScreen(),
            );


          case AppRoutes.doadoraShell:
            return MaterialPageRoute(
              builder: (_) => const DoadoraShellScreen(),
            );

          case AppRoutes.homeDoadora:
            return MaterialPageRoute(
              builder: (_) => const HomeDoadoraScreen(),
            );

          case AppRoutes.historicoDoadora:
            return MaterialPageRoute(
              builder: (_) => const HistoricoDoadoraScreen(),
            );

          case AppRoutes.registroColeta:
            return MaterialPageRoute(
              builder: (_) => const RegistroColetaScreen(),
            );

          case AppRoutes.agendamentoDoadora:
            return MaterialPageRoute(
              builder: (_) => const AgendamentoDoadoraScreen(),
            );

          case AppRoutes.notificacoesDoadora:
            return MaterialPageRoute(
              builder: (_) => const NotificacoesScreen(),
            );

          case AppRoutes.meusDadosDoadora:
            return MaterialPageRoute(
              builder: (_) => const MeusDadosScreen(),
            );

          case AppRoutes.feedbackDoadora:
            return MaterialPageRoute(
              builder: (_) => const FeedbackScreen(),
            );


          case AppRoutes.apoioShell:
            return MaterialPageRoute(
              builder: (_) => const ApoioShellScreen(),
            );

          case AppRoutes.homeApoio:
            return MaterialPageRoute(
              builder: (_) => const HomeApoioScreen(),
            );

          case AppRoutes.agendamentoApoio:
            return MaterialPageRoute(
              builder: (_) => const AgendamentoApoioScreen(),
            );

          case AppRoutes.historicoApoio:
            return MaterialPageRoute(
              builder: (_) => const HistoricoApoioScreen(),
            );

          case AppRoutes.notificacoesApoio:
            return MaterialPageRoute(
              builder: (_) => const NotificacoesApoioScreen(),
            );

          case AppRoutes.meusDadosApoio:
            return MaterialPageRoute(
              builder: (_) => const MeusDadosApoioScreen(),
            );

          case AppRoutes.feedbackApoio:
            return MaterialPageRoute(
              builder: (_) => const FeedbackApoioScreen(),
            );


          case AppRoutes.equipeShell:
            return MaterialPageRoute(
              builder: (_) => const EquipeShellScreen(),
            );

          case AppRoutes.dashboard:
            return MaterialPageRoute(
              builder: (_) => const DashboardScreen(),
            );

          case AppRoutes.perfilEquipe:
            return MaterialPageRoute(
              builder: (_) => const PerfilEquipeScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Rota não encontrada'),
                ),
              ),
            );
        }
      },
    );
  }
}

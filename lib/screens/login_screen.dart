import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../navigation/app_routes.dart';
import '../widgets/app_text_field.dart';
import '../data/mock_data.dart';

class LoginScreen extends StatefulWidget {
  final String perfil;

  const LoginScreen({super.key, required this.perfil});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _senhaVisivel = false;
  bool _carregando = false;
  String? _erro;

  @override
  void dispose() {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  String get _titulo {
    switch (widget.perfil) {
      case 'doadora':
        return 'Bem-vinda de volta! ';
      case 'apoio':
        return 'Bem-vinda de volta! ';
      case 'equipe':
        return 'Bem-vindo de volta! ';
      default:
        return 'Bem-vindo ao Lactare';
    }
  }

  String get _subtitulo => 'Faça login para continuar';

  void _entrar() async {
    setState(() {
      _carregando = true;
      _erro = null;
    });

    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    final usuario = _usuarioController.text.trim();
    final senha = _senhaController.text.trim();

    if (widget.perfil == 'doadora') {
      if (usuario == doadoraLogada.usuario && senha == '123456') {
        setState(() => _carregando = false);

        Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.doadoraShell,
        (route) => false,
        );

        return;
      }
    }

    if (widget.perfil == 'apoio') {
      if (usuario == familiaLogada.usuario && senha == '123456') {
        setState(() => _carregando = false);

        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.apoioShell,
          (route) => false,
        );

        return;
      }
    }

    if (widget.perfil == 'equipe') {
      if (usuario == usuarioEquipe && senha == senhaEquipe) {
        setState(() => _carregando = false);

        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.equipeShell,
          (route) => false,
        );

        return;
      }
    }

    setState(() {
      _carregando = false;
      _erro = 'Usuário ou senha incorretos. Tente novamente.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  20,
                  22,
                  145,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppTheme.azulEscuro,
                          size: 28,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Image.asset(
                      'assets/imagens/logo_lactare.webp',
                      width: 285,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 22),

                    Text(
                      _titulo,
                      style: const TextStyle(
                        color: AppTheme.azulEscuro,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      _subtitulo,
                      style: const TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 28),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          color: AppTheme.azulEscuro,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    AppTextField(
                      label: '',
                      hint: 'Digite seu e-mail',
                      controller: _usuarioController,
                    ),

                    const SizedBox(height: 16),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Senha',
                        style: TextStyle(
                          color: AppTheme.azulEscuro,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    AppTextField(
                      label: '',
                      hint: 'Digite sua senha',
                      controller: _senhaController,
                      obscureText: !_senhaVisivel,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _senhaVisivel
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: const Color(0xFF64748B),
                          size: 22,
                        ),
                        onPressed: () {
                          setState(() {
                            _senhaVisivel = !_senhaVisivel;
                          });
                        },
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                        ),
                        child: const Text(
                          'Esqueceu minha senha?',
                          style: TextStyle(
                            color: Color(0xFF1688D8),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    if (_erro != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppTheme.vermelho.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.vermelho.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          _erro!,
                          style: const TextStyle(
                            color: AppTheme.vermelho,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _entrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1688D8),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _carregando
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFFD9E2EC),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'ou',
                            style: TextStyle(
                              color: Color(0xFF718096),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFFD9E2EC),
                          ),
                        ),
                      ],
                    ),

                    if (widget.perfil != 'equipe') ...[
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.cadastro,
                            );
                          },
                          icon: const Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Color(0xFF1688D8),
                            size: 22,
                          ),
                          label: const Text(
                            'Ainda não tem conta? Cadastre-se',
                            style: TextStyle(
                              color: Color(0xFF1688D8),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFF1688D8),
                              width: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: IgnorePointer(
                child: SizedBox(
                  height: 105,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        left: -90,
                        bottom: -95,
                        child: Container(
                          width: 270,
                          height: 155,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF6FC),
                            borderRadius: BorderRadius.circular(120),
                          ),
                        ),
                      ),

                      Positioned(
                        right: -90,
                        bottom: -95,
                        child: Container(
                          width: 270,
                          height: 155,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF6FC),
                            borderRadius: BorderRadius.circular(120),
                          ),
                        ),
                      ),

                      const Positioned(
                        bottom: 45,
                        child: Icon(
                          Icons.water_drop_outlined,
                          color: Color(0xFF4FC3F7),
                          size: 34,
                        ),
                      ),

                      const Positioned(
                        bottom: 21,
                        child: Text(
                          'Solidariedade que nutre, vida que cresce',
                          style: TextStyle(
                            color: AppTheme.azulEscuro,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const Positioned(
                        bottom: 5,
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFF4FC3F7),
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

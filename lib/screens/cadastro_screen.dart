import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../navigation/app_routes.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  int _etapaAtual = 0;
  final PageController _pageController = PageController();

  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _nascimentoController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cepController = TextEditingController();

  bool _bebeAmamentando = true;
  bool _usaMedicamento = false;
  bool _fumante = false;
  String _metodoColeta = 'Bomba elétrica';
  bool _aceitouTermos = false;

  final _emailAcessoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _whatsappController = TextEditingController();

  final List<String> _etapas = [
    'Dados\npessoais',
    'Saúde &\nhistórico',
    'Acesso',
    'Confirmação',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _nomeController.dispose();
    _cpfController.dispose();
    _nascimentoController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
    _enderecoController.dispose();
    _cepController.dispose();
    _emailAcessoController.dispose();
    _senhaController.dispose();
    _usuarioController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }

  void _avancar() {
    if (_etapaAtual < 3) {
      setState(() => _etapaAtual++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.cadastroSucesso);
    }
  }

  void _voltar() {
    if (_etapaAtual > 0) {
      setState(() => _etapaAtual--);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.branco,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppTheme.azulEscuro,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cadastro Novo Usuário',
                    style: TextStyle(
                      color: AppTheme.branco,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Preencha seus dados para começar sua jornada de doação',
                    style: TextStyle(
                      color: AppTheme.branco.withOpacity(0.65),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: List.generate(_etapas.length, (index) {
                      final concluida = index < _etapaAtual;
                      final atual = index == _etapaAtual;
                      return Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: concluida
                                          ? AppTheme.verde
                                          : atual
                                              ? AppTheme.branco
                                              : Colors.white24,
                                    ),
                                    child: Center(
                                      child: concluida
                                          ? const Icon(Icons.check,
                                              color: AppTheme.branco,
                                              size: 14)
                                          : Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                color: atual
                                                    ? AppTheme.azulEscuro
                                                    : Colors.white54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _etapas[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: atual || concluida
                                          ? AppTheme.branco
                                          : Colors.white38,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (index < _etapas.length - 1)
                              Container(
                                height: 1,
                                width: 16,
                                color: const Color(0xFFD9E0EA),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildEtapa1(),
                  _buildEtapa2(),
                  _buildEtapa3(),
                  _buildEtapa4(),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              color: AppTheme.branco,
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      texto: '← Voltar',
                      onPressed: _voltar,
                      outlined: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: AppButton(
                      texto: _etapaAtual == 3
                          ? 'FINALIZAR CADASTRO'
                          : 'Próximo passo →',
                      onPressed: _avancar,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEtapa1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DADOS PESSOAIS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.azulEscuro,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          AppTextField(
            label: 'NOME COMPLETO',
            hint: 'Ex: Maria Silva',
            controller: _nomeController,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'CPF',
                  hint: '000.000.000-00',
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppTextField(
                  label: 'DATA DE NASCIMENTO',
                  hint: 'DD/MM/AAAA',
                  controller: _nascimentoController,
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'TELEFONE / WHATSAPP',
                  hint: '(11) 00000-0000',
                  controller: _telefoneController,
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppTextField(
                  label: 'E-MAIL',
                  hint: 'exemplo@gmail.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'ENDEREÇO',
            hint: 'Rua, número',
            controller: _enderecoController,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'CEP',
                  hint: '00000-000',
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEtapa2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INFORMAÇÕES DE SAÚDE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.azulEscuro,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          _buildRadioRow(
            'BEBÊ EM AMAMENTAÇÃO',
            _bebeAmamentando,
            (val) => setState(() => _bebeAmamentando = val),
          ),
          const SizedBox(height: 14),
          const Text(
            'MÉTODO DE COLETA PREFERIDO',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.azulEscuro,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: ['Bomba elétrica', 'Manual', 'Ambos'].map((m) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _metodoColeta = m),
                  child: Container(
                    margin: const EdgeInsets.only(right: 6),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _metodoColeta == m
                          ? AppTheme.azulEscuro
                          : AppTheme.branco,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _metodoColeta == m
                            ? AppTheme.azulEscuro
                            : const Color(0xFFD1D5DB),
                      ),
                    ),
                    child: Text(
                      m,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: _metodoColeta == m
                            ? AppTheme.branco
                            : AppTheme.azulEscuro,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          _buildRadioRow(
            'USA ALGUM MEDICAMENTO?',
            _usaMedicamento,
            (val) => setState(() => _usaMedicamento = val),
          ),
          const SizedBox(height: 14),
          _buildRadioRow(
            'FUMANTE?',
            _fumante,
            (val) => setState(() => _fumante = val),
          ),
          const SizedBox(height: 20),
          const Text(
            'TERMOS E CONSENTIMENTO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.azulEscuro,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          _buildCheckboxTermo(
            'Declaro que as informações prestadas são verdadeiras e concordo com os Termos de Doação e Protocolo de Segurança rBLH Brasil.',
            _aceitouTermos,
            (val) => setState(() => _aceitouTermos = val ?? false),
          ),
        ],
      ),
    );
  }

  Widget _buildEtapa3() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ACESSO À PLATAFORMA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.azulEscuro,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Criação de Usuário e Senha',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppTheme.azulEscuro,
            ),
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'E-MAIL',
            hint: 'nutriz@gmail.com',
            controller: _emailAcessoController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'SENHA',
            hint: '••••••••',
            controller: _senhaController,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          const Text(
            'Verificação de Identidade',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppTheme.azulEscuro,
            ),
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'NOME DE USUÁRIO',
            hint: 'nutriz_maria',
            controller: _usuarioController,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'CELULAR / WHATSAPP',
            hint: '(11) 99876-5432',
            controller: _whatsappController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.branco,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppTheme.azulEscuro.withOpacity(0.18),
              ),
            ),
            child: const Text(
              'Seu WhatsApp será usado para receber agendamentos, lembretes e notificações da equipe Lactare.',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.azulEscuro,
              ),
            ),
          ),
        ],
      ),
    );
  }


Widget _buildEtapa4() {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(
      20,
      20,
      20,
      20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [


        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Confirmação dos dados de cadastro',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.azulEscuro,
              fontSize: 14,
            ),
          ),
        ),

        const SizedBox(height: 16),


        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 340,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.branco,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE0E5EC),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  const Row(
                    children: [
                      Text(
                        '📋',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Resumo do Cadastro',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppTheme.azulEscuro,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  _buildResumoItem(
                    '01 Dados Pessoais',
                    [
                      'Nome: ${_nomeController.text.isEmpty ? "Maria Aparecida Silva" : _nomeController.text}',
                      'Endereço: ${_enderecoController.text.isEmpty ? "Rua das Flores, 142 — SP" : _enderecoController.text}',
                    ],
                  ),

                  const SizedBox(height: 12),

                  _buildResumoItem(
                    '02 Saúde & Histórico',
                    [
                      'Método: $_metodoColeta',
                      'Medicamentos: ${_usaMedicamento ? "Sim" : "Nenhum"}',
                    ],
                  ),

                  const SizedBox(height: 12),

                  _buildResumoItem(
                    '03 Acesso',
                    [
                      'E-mail: ${_emailAcessoController.text.isEmpty ? "pessoa@email.com" : _emailAcessoController.text}',
                      'Usuário: ${_usuarioController.text.isEmpty ? "perfil_pessoa" : _usuarioController.text}',
                      'Verificação: WhatsApp',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),


        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                color: AppTheme.branco,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFD7DFEA),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: AppTheme.azulEscuro,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: AppTheme.branco,
                      size: 20,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Tudo pronto!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.azulEscuro,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Agora é só clicar em Finalizar Cadastro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.azulEscuro,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    ),
  );
}

  Widget _buildRadioRow(
      String label, bool valor, void Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.azulEscuro,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: valor,
              onChanged: (v) => onChanged(v!),
              activeColor: AppTheme.azulEscuro,
            ),
            const Text('Sim', style: TextStyle(fontSize: 13)),
            const SizedBox(width: 16),
            Radio<bool>(
              value: false,
              groupValue: valor,
              onChanged: (v) => onChanged(v!),
              activeColor: AppTheme.azulEscuro,
            ),
            const Text('Não', style: TextStyle(fontSize: 13)),
          ],
        ),
      ],
    );
  }

  Widget _buildCheckboxTermo(
      String texto, bool valor, void Function(bool?) onChanged) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.azulEscuro.withOpacity(0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: valor,
            onChanged: onChanged,
            activeColor: AppTheme.azulEscuro,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                texto,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.azulEscuro,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResumoItem(String titulo, List<String> itens) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: AppTheme.azulEscuro,
          ),
        ),
        const SizedBox(height: 4),
        ...itens.map(
          (item) => Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 2),
            child: Text(
              item,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.azulEscuro.withOpacity(0.72),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../app_theme.dart';

class RegistroColetaScreen extends StatefulWidget {
  final VoidCallback? onIrParaDoacoes;
  final VoidCallback? onVoltarParaInicio;

  const RegistroColetaScreen({
    super.key,
    this.onIrParaDoacoes,
    this.onVoltarParaInicio,
  });

  @override
  State<RegistroColetaScreen> createState() =>
      _RegistroColetaScreenState();
}

class _RegistroColetaScreenState
    extends State<RegistroColetaScreen> {
  int _etapa = 1;

  DateTime _dataSelecionada = DateTime.now();
  String _horario = '09:00';
  String _periodo = 'Manhã (06h–12h)';
  String _local = 'Minha casa';
  String _armazenamento = 'Geladeira (até 4°C)';

  final TextEditingController _quantidadeController =
      TextEditingController(text: '180');

  final TextEditingController _observacoesController =
      TextEditingController();

  @override
  void dispose() {
    _quantidadeController.dispose();
    _observacoesController.dispose();
    super.dispose();
  }

  void _continuar() {
    if (_etapa < 4) {
      setState(() {
        _etapa++;
      });
    } else {
      widget.onIrParaDoacoes?.call();
    }
  }

  void _voltarEtapa() {
    if (_etapa > 1) {
      setState(() {
        _etapa--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Registrar coleta',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Informe os detalhes da sua coleta de leite materno.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7B8BA5),
              ),
            ),

            const SizedBox(height: 22),


            _buildEtapas(),

            const SizedBox(height: 28),

            if (_etapa == 1) _buildDadosColeta(),
            if (_etapa == 2) _buildRevisao(),
            if (_etapa == 3) _buildConfirmacao(),
            if (_etapa == 4) _buildConcluido(),
          ],
        ),
      ),
    );
  }

  Widget _buildEtapas() {
    return Row(
      children: [
        _etapaItem(
          numero: '1',
          titulo: 'Dados da coleta',
          ativa: _etapa >= 1,
        ),
        _linha(_etapa >= 2),
        _etapaItem(
          numero: '2',
          titulo: 'Revisão',
          ativa: _etapa >= 2,
        ),
        _linha(_etapa >= 3),
        _etapaItem(
          numero: '3',
          titulo: 'Confirmação',
          ativa: _etapa >= 3,
        ),
        _linha(_etapa >= 4),
        _etapaItem(
          numero: '4',
          titulo: 'Concluído',
          ativa: _etapa >= 4,
        ),
      ],
    );
  }

  Widget _etapaItem({
    required String numero,
    required String titulo,
    required bool ativa,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: ativa
                  ? AppTheme.azulEscuro
                  : const Color(0xFFE8EDF3),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              numero,
              style: TextStyle(
                color: ativa
                    ? Colors.white
                    : const Color(0xFF8794A8),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              fontWeight:
                  ativa ? FontWeight.w700 : FontWeight.w400,
              color: ativa
                  ? AppTheme.azulEscuro
                  : const Color(0xFF8794A8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linha(bool ativa) {
    return Container(
      width: 25,
      height: 2,
      color: ativa
          ? AppTheme.azulEscuro
          : const Color(0xFFE0E6ED),
    );
  }


  Widget _buildDadosColeta() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dados da coleta',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppTheme.azulEscuro,
          ),
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: _campo(
                titulo: 'Data da coleta',
                texto:
                    '${_dataSelecionada.day.toString().padLeft(2, '0')}/${_dataSelecionada.month.toString().padLeft(2, '0')}/${_dataSelecionada.year}',
                icone: Icons.calendar_today_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _campo(
                titulo: 'Horário',
                texto: _horario,
                icone: Icons.access_time_outlined,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        _campo(
          titulo: 'Quantidade coletada',
          texto: '${_quantidadeController.text}                         ml',
          icone: Icons.water_drop_outlined,
        ),

        const SizedBox(height: 16),

        _dropdown(
          titulo: 'Período da coleta',
          valor: _periodo,
          icone: Icons.wb_sunny_outlined,
          valores: const [
            'Manhã (06h–12h)',
            'Tarde (12h–18h)',
            'Noite (18h–22h)',
          ],
          onChanged: (valor) {
            if (valor != null) {
              setState(() => _periodo = valor);
            }
          },
        ),

        const SizedBox(height: 16),

        _dropdown(
          titulo: 'Local da coleta',
          valor: _local,
          icone: Icons.location_on_outlined,
          valores: const [
            'Minha casa',
            'Banco de leite',
            'Hospital',
          ],
          onChanged: (valor) {
            if (valor != null) {
              setState(() => _local = valor);
            }
          },
        ),

        const SizedBox(height: 16),

        _dropdown(
          titulo: 'Armazenamento',
          valor: _armazenamento,
          icone: Icons.kitchen_outlined,
          valores: const [
            'Geladeira (até 4°C)',
            'Freezer',
          ],
          onChanged: (valor) {
            if (valor != null) {
              setState(() => _armazenamento = valor);
            }
          },
        ),

        const SizedBox(height: 16),

        const Text(
          'Observações (opcional)',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppTheme.azulEscuro,
          ),
        ),

        const SizedBox(height: 7),

        TextField(
          controller: _observacoesController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText:
                'Adicione informações que julgar importantes...',
            hintStyle: const TextStyle(
              color: Color(0xFF9AA5B5),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Color(0xFFD3DCE7),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Color(0xFFD3DCE7),
              ),
            ),
          ),
        ),

        const SizedBox(height: 22),

        _botaoPrincipal(
          texto: 'Continuar',
          icone: Icons.arrow_forward_rounded,
          onTap: _continuar,
        ),
      ],
    );
  }


  Widget _buildRevisao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resumo da coleta',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppTheme.azulEscuro,
          ),
        ),

        const SizedBox(height: 16),

        _resumoLinha(
          Icons.calendar_today_outlined,
          'Data da coleta',
          '${_dataSelecionada.day.toString().padLeft(2, '0')}/${_dataSelecionada.month.toString().padLeft(2, '0')}/${_dataSelecionada.year}',
        ),

        _resumoLinha(
          Icons.access_time_outlined,
          'Horário',
          _horario,
        ),

        _resumoLinha(
          Icons.water_drop_outlined,
          'Quantidade coletada',
          '${_quantidadeController.text} ml',
        ),

        _resumoLinha(
          Icons.wb_sunny_outlined,
          'Período da coleta',
          _periodo,
        ),

        _resumoLinha(
          Icons.location_on_outlined,
          'Local da coleta',
          _local,
        ),

        _resumoLinha(
          Icons.kitchen_outlined,
          'Armazenamento',
          _armazenamento,
        ),

        _resumoLinha(
          Icons.notes_outlined,
          'Observações',
          _observacoesController.text.isEmpty
              ? 'Nenhuma'
              : _observacoesController.text,
        ),

        const SizedBox(height: 20),

        _aviso(
          'Confira tudo',
          'Verifique se as informações estão corretas. Após confirmar, sua coleta será registrada.',
        ),

        const SizedBox(height: 20),

        _botaoPrincipal(
          texto: 'Confirmar informações',
          icone: Icons.arrow_forward_rounded,
          onTap: _continuar,
        ),

        const SizedBox(height: 10),

        _botaoSecundario(
          texto: 'Voltar e editar',
          onTap: _voltarEtapa,
        ),
      ],
    );
  }


  Widget _buildConfirmacao() {
    return Column(
      children: [
        const Icon(
          Icons.check_circle_outline_rounded,
          color: AppTheme.azulEscuro,
          size: 70,
        ),

        const SizedBox(height: 18),

        const Text(
          'Confirmar coleta',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppTheme.azulEscuro,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          'Sua coleta está pronta para ser registrada.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF718096),
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 28),

        _botaoPrincipal(
          texto: 'Registrar coleta',
          icone: Icons.check_rounded,
          onTap: _continuar,
        ),

        const SizedBox(height: 10),

        _botaoSecundario(
          texto: 'Voltar',
          onTap: _voltarEtapa,
        ),
      ],
    );
  }


  Widget _buildConcluido() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            color: Color(0xFFEAF4FF),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_rounded,
            color: AppTheme.azulEscuro,
            size: 50,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Coleta registrada!',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: AppTheme.azulEscuro,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          'Sua doação foi registrada com sucesso.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF718096),
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 28),

        _botaoPrincipal(
          texto: 'Ver minhas doações',
          icone: Icons.favorite_border_rounded,
          onTap: () {
            widget.onIrParaDoacoes?.call();
          },
        ),
      ],
    );
  }


  Widget _campo({
    required String titulo,
    required String texto,
    required IconData icone,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppTheme.azulEscuro,
          ),
        ),
        const SizedBox(height: 7),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: const Color(0xFFD3DCE7),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icone,
                color: AppTheme.azulMedio,
                size: 21,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  texto,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.azulEscuro,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dropdown({
    required String titulo,
    required String valor,
    required IconData icone,
    required List<String> valores,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppTheme.azulEscuro,
          ),
        ),
        const SizedBox(height: 7),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: const Color(0xFFD3DCE7),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icone,
                color: AppTheme.azulMedio,
                size: 21,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: valor,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    items: valores
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppTheme.azulEscuro,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _resumoLinha(
    IconData icone,
    String titulo,
    String valor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8EDF3),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icone,
            color: AppTheme.azulMedio,
            size: 21,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF718096),
              ),
            ),
          ),
          Flexible(
            child: Text(
              valor,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _aviso(String titulo, String texto) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: AppTheme.azulMedio,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.azulEscuro,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  texto,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.azulEscuro,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoPrincipal({
    required String texto,
    required IconData icone,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icone),
        label: Text(
          texto,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.azulEscuro,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _botaoSecundario({
    required String texto,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.azulEscuro,
          side: const BorderSide(
            color: AppTheme.azulEscuro,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          texto,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../data/mock_data.dart';
import '../../widgets/app_button.dart';

class AgendamentoApoioScreen extends StatefulWidget {
  const AgendamentoApoioScreen({super.key});

  @override
  State<AgendamentoApoioScreen> createState() =>
      _AgendamentoApoioScreenState();
}

class _AgendamentoApoioScreenState extends State<AgendamentoApoioScreen> {
  DateTime _dataSelecionada =
      DateTime.now().add(const Duration(days: 5));
  String _tipoSelecionado = tiposSuporteApoio.first;
  String _horarioSelecionado = horariosConsulta.first;
  final _obsController = TextEditingController();
  bool _agendando = false;

  @override
  void dispose() {
    _obsController.dispose();
    super.dispose();
  }

  void _agendar() async {
    setState(() => _agendando = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _agendando = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '✅ $_tipoSelecionado agendado para ${_dataSelecionada.day}/${_dataSelecionada.month} às $_horarioSelecionado!',
        ),
        backgroundColor: AppTheme.verde,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cinzaClaro,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.azulFundo,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: AppTheme.azulClaro.withOpacity(0.3)),
              ),
              child: const Text(
                'Todas as consultas são feitas por videochamada. Você receberá o link de acesso na área de notificações e em sua caixa de e-mail.',
                style:
                    TextStyle(fontSize: 13, color: AppTheme.azulEscuro),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'TIPO DE SUPORTE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppTheme.azulEscuro,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppTheme.branco,
                border:
                    Border.all(color: const Color(0xFFD1D5DB)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _tipoSelecionado,
                isExpanded: true,
                underline: const SizedBox(),
                items: tiposSuporteApoio
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(t,
                            style: const TextStyle(fontSize: 14)),
                      ),
                    )
                    .toList(),
                onChanged: (v) =>
                    setState(() => _tipoSelecionado = v!),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'DATAS DISPONÍVEIS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppTheme.azulEscuro,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.branco,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: CalendarDatePicker(
                initialDate: _dataSelecionada,
                firstDate: DateTime.now(),
                lastDate:
                    DateTime.now().add(const Duration(days: 90)),
                onDateChanged: (date) =>
                    setState(() => _dataSelecionada = date),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'HORÁRIOS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppTheme.azulEscuro,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: horariosConsulta.map((h) {
                final sel = _horarioSelecionado == h;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _horarioSelecionado = h),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: sel
                          ? AppTheme.azulEscuro
                          : AppTheme.branco,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: sel
                            ? AppTheme.azulEscuro
                            : const Color(0xFFD1D5DB),
                      ),
                    ),
                    child: Text(
                      h,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: sel
                            ? AppTheme.branco
                            : AppTheme.azulEscuro,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            const Text(
              'INFORMAÇÕES ADICIONAIS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppTheme.azulEscuro,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _obsController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Sem observações',
                filled: true,
                fillColor: AppTheme.branco,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Color(0xFFD1D5DB)),
                ),
              ),
            ),
            const SizedBox(height: 24),

            AppButton(
              texto: 'AGENDAR CONSULTA',
              onPressed: _agendar,
              carregando: _agendando,
              icone: Icons.calendar_month,
            ),
          ],
        ),
      ),
    );
  }
}

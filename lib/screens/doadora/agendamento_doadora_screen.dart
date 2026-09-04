import 'package:flutter/material.dart';
import '../../app_theme.dart';

class AgendamentoDoadoraScreen extends StatefulWidget {
  const AgendamentoDoadoraScreen({super.key});

  @override
  State<AgendamentoDoadoraScreen> createState() =>
      _AgendamentoDoadoraScreenState();
}

class _AgendamentoDoadoraScreenState
    extends State<AgendamentoDoadoraScreen> {
  DateTime _dataSelecionada = DateTime.now();

  String _horarioSelecionado = '09:00';

  final TextEditingController _motivoController =
      TextEditingController(
    text: 'Triagem para se tornar doadora',
  );

  final TextEditingController _obsController =
      TextEditingController();

  bool _agendando = false;

  final List<String> _horarios = [
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '14:00',
    '14:30',
    '15:00',
  ];

  @override
  void dispose() {
    _motivoController.dispose();
    _obsController.dispose();
    super.dispose();
  }

  Future<void> _agendar() async {
    setState(() {
      _agendando = true;
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) return;

    setState(() {
      _agendando = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Consulta agendada para '
          '${_dataSelecionada.day.toString().padLeft(2, '0')}/'
          '${_dataSelecionada.month.toString().padLeft(2, '0')}/'
          '${_dataSelecionada.year} às '
          '$_horarioSelecionado.',
        ),
        backgroundColor: AppTheme.azulEscuro,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F8FC),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Agendar consulta',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Agende uma consulta sempre que precisar. '
              'Nossa equipe faz sua triagem e garante o melhor atendimento.',
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: Color(0xFF718096),
              ),
            ),

            const SizedBox(height: 22),


            const Text(
              'DATA PREFERIDA',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
                letterSpacing: .4,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE0E6ED),
                ),
              ),
              child: CalendarDatePicker(
                initialDate: _dataSelecionada,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 90),
                ),
                onDateChanged: (date) {
                  setState(() {
                    _dataSelecionada = date;
                  });
                },
              ),
            ),

            const SizedBox(height: 18),


            const Text(
              'HORÁRIOS DISPONÍVEIS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
                letterSpacing: .4,
              ),
            ),

            const SizedBox(height: 9),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _horarios.map((horario) {
                final selecionado =
                    _horarioSelecionado == horario;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _horarioSelecionado = horario;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: selecionado
                          ? AppTheme.azulEscuro
                          : Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: selecionado
                            ? AppTheme.azulEscuro
                            : const Color(0xFFD1D9E3),
                      ),
                    ),
                    child: Text(
                      horario,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: selecionado
                            ? Colors.white
                            : AppTheme.azulEscuro,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),


            const Text(
              'MOTIVO DA CONSULTA',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
                letterSpacing: .4,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: _motivoController,
              decoration: _inputDecoration(),
            ),

            const SizedBox(height: 18),


            const Text(
              'OBSERVAÇÕES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
                letterSpacing: .4,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: _obsController,
              maxLines: 4,
              decoration: _inputDecoration(
                hint: 'Sem observações',
              ),
            ),

            const SizedBox(height: 24),


            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _agendando ? null : _agendar,
                icon: _agendando
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        Icons.calendar_month_outlined,
                      ),
                label: Text(
                  _agendando
                      ? 'AGENDANDO...'
                      : 'AGENDAR CONSULTA',
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
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    String? hint,
  }) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xFFD1D9E3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xFFD1D9E3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: AppTheme.azulEscuro,
          width: 1.5,
        ),
      ),
    );
  }
}

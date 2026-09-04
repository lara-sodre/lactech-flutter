import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../data/mock_data.dart';
import '../../widgets/app_button.dart';

class FeedbackApoioScreen extends StatefulWidget {
  const FeedbackApoioScreen({super.key});

  @override
  State<FeedbackApoioScreen> createState() =>
      _FeedbackApoioScreenState();
}

class _FeedbackApoioScreenState extends State<FeedbackApoioScreen> {
  double _nota = 5.0;
  final _comentarioController = TextEditingController();
  String _consultaSelecionada = 'Consulta — 20/05/2026';
  String _profissionalSelecionado = 'Dra. Fernanda Rocha';
  bool _enviando = false;

  final List<String> _consultas = [
    'Consulta — 20/05/2026',
    'Consulta — 13/05/2026',
    'Consulta — 06/05/2026',
  ];

  final List<String> _profissionais = [
    'Dra. Fernanda Rocha',
    'Psicóloga Carla Mendes',
    'Psicóloga Juliana Torres',
  ];

  @override
  void dispose() {
    _comentarioController.dispose();
    super.dispose();
  }

  void _enviar() async {
    setState(() => _enviando = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _enviando = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Feedback enviado! Obrigada pela avaliação.'),
        backgroundColor: AppTheme.verde,
      ),
    );
    _comentarioController.clear();
    setState(() => _nota = 5.0);
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.branco,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Avaliar consulta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppTheme.azulEscuro,
                    ),
                  ),
                  const SizedBox(height: 14),

                  const Text('DATA',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.cinzaTexto,
                          letterSpacing: 0.5)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFD1D5DB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: _consultaSelecionada,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: _consultas
                          .map((c) => DropdownMenuItem(
                                value: c,
                                child: Text(c,
                                    style: const TextStyle(fontSize: 13)),
                              ))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _consultaSelecionada = v!),
                    ),
                  ),
                  const SizedBox(height: 14),

                  const Text('PROFISSIONAL RESPONSÁVEL',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.cinzaTexto,
                          letterSpacing: 0.5)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFD1D5DB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: _profissionalSelecionado,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: _profissionais
                          .map((p) => DropdownMenuItem(
                                value: p,
                                child: Text(p,
                                    style: const TextStyle(fontSize: 13)),
                              ))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _profissionalSelecionado = v!),
                    ),
                  ),
                  const SizedBox(height: 14),

                  const Text('AVALIAÇÃO GERAL',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.cinzaTexto,
                          letterSpacing: 0.5)),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (i) {
                      return GestureDetector(
                        onTap: () =>
                            setState(() => _nota = (i + 1).toDouble()),
                        child: Icon(
                          i < _nota ? Icons.star : Icons.star_border,
                          color: AppTheme.amarelo,
                          size: 32,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 14),

                  const Text('COMENTÁRIO',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.cinzaTexto,
                          letterSpacing: 0.5)),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _comentarioController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Compartilhe sua experiência...',
                      filled: true,
                      fillColor: AppTheme.cinzaClaro,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Color(0xFFD1D5DB)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    texto: 'ENVIAR FEEDBACK',
                    onPressed: _enviar,
                    carregando: _enviando,
                    icone: Icons.send,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Feedbacks anteriores',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppTheme.azulEscuro,
              ),
            ),
            const SizedBox(height: 12),
            ...feedbacksApoio.map(
              (f) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppTheme.branco,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          f.data,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: AppTheme.azulEscuro,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              i < f.nota
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppTheme.amarelo,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      f.comentario,
                      style: const TextStyle(
                          fontSize: 12, color: AppTheme.cinzaTexto),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

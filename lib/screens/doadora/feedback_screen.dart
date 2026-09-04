import 'package:flutter/material.dart';

import '../../app_theme.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() =>
      _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _avaliacao = 5;

  final TextEditingController _comentarioController =
      TextEditingController();

  @override
  void dispose() {
    _comentarioController.dispose();
    super.dispose();
  }

  void _enviarFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Feedback enviado com sucesso!',
        ),
        backgroundColor: AppTheme.azulEscuro,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      appBar: AppBar(
        backgroundColor: AppTheme.azulEscuro,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Feedback',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F6FF),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFB9E4FA),
                  ),
                ),
                child: const Text(
                  'Conta pra gente como foi sua experiência. '
                  'Seu feedback nos ajuda a melhorar a cada dia.',
                  style: TextStyle(
                    color: AppTheme.azulEscuro,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 18),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFE1E7ED),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Avaliar atendimento',
                      style: TextStyle(
                        color: AppTheme.azulEscuro,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'COLETA REFERENTE',
                      style: TextStyle(
                        color: Color(0xFF68727E),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFD3D9E0),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Coleta — 20/05/2026 (180 ml)',
                              style: TextStyle(
                                color: Color(0xFF718096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF697586),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'AVALIAÇÃO GERAL',
                      style: TextStyle(
                        color: Color(0xFF68727E),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: List.generate(
                        5,
                        (index) {
                          final numero = index + 1;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _avaliacao = numero;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 4,
                              ),
                              child: Icon(
                                Icons.star_rounded,
                                size: 39,
                                color: numero <= _avaliacao
                                    ? const Color(0xFFF5B72C)
                                    : const Color(0xFFD8DEE6),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      '$_avaliacao,0 — ${_textoAvaliacao()}',
                      style: const TextStyle(
                        color: Color(0xFF77818D),
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'COMENTÁRIO',
                      style: TextStyle(
                        color: Color(0xFF68727E),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: _comentarioController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText:
                            'Compartilhe sua experiência...',
                        hintStyle: const TextStyle(
                          color: Color(0xFF8B949E),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFD3D9E0),
                          ),
                        ),
                        enabledBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFD3D9E0),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton.icon(
                        onPressed: _enviarFeedback,
                        icon: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'ENVIAR FEEDBACK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppTheme.azulEscuro,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),


              const Text(
                'Feedbacks anteriores',
                style: TextStyle(
                  color: AppTheme.azulEscuro,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 12),

              _feedbackAnterior(
                '20/05',
                5,
                'Atendimento excelente! Equipe muito atenciosa e acolhedora.',
              ),

              _feedbackAnterior(
                '13/05',
                4,
                'Equipe muito atenciosa. Pontualidade excelente.',
              ),

              _feedbackAnterior(
                '06/05',
                5,
                'Ótimo ambiente, me senti muito acolhida.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _textoAvaliacao() {
    switch (_avaliacao) {
      case 1:
        return 'Muito ruim';
      case 2:
        return 'Ruim';
      case 3:
        return 'Regular';
      case 4:
        return 'Muito bom';
      default:
        return 'Excelente';
    }
  }

  Widget _feedbackAnterior(
    String data,
    int estrelas,
    String comentario,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE1E7ED),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data,
                style: const TextStyle(
                  color: AppTheme.azulEscuro,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(width: 12),

              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_rounded,
                    size: 18,
                    color: index < estrelas
                        ? const Color(0xFFF5B72C)
                        : const Color(0xFFD8DEE6),
                  ),
                ),
              ),

              const SizedBox(width: 6),

              Text(
                '$estrelas,0',
                style: const TextStyle(
                  color: Color(0xFF7A8491),
                  fontSize: 13,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            comentario,
            style: const TextStyle(
              color: Color(0xFF697586),
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

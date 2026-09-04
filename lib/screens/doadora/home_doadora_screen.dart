import 'package:flutter/material.dart';

import '../../app_theme.dart';

class HomeDoadoraScreen extends StatelessWidget {
  final VoidCallback? onDoacoes;
  final VoidCallback? onAgenda;
  final VoidCallback? onRegistrar;

  const HomeDoadoraScreen({
    super.key,
    this.onDoacoes,
    this.onAgenda,
    this.onRegistrar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          16,
          8,
          16,
          24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Olá! Maria',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppTheme.azulEscuro,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Seja bem-vinda à família Lactare.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF7B8BA5),
              ),
            ),

            const SizedBox(height: 24),


            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                18,
                18,
                18,
                22,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFE4EBF3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEAF5FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person_outline_rounded,
                          color: AppTheme.azulMedio,
                          size: 26,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Text(
                        'Sua jornada de doação',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.azulEscuro,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),


                  SizedBox(
                    height: 390,
                    child: Stack(
                      children: [

                        Positioned(
                          top: 145,
                          left: 72,
                          child: Transform.rotate(
                            angle: -0.62,
                            child: Container(
                              width: 145,
                              height: 2,
                              color: const Color(0xFF8CCBFF),
                            ),
                          ),
                        ),


                        Positioned(
                          top: 145,
                          right: 72,
                          child: Transform.rotate(
                            angle: 0.62,
                            child: Container(
                              width: 145,
                              height: 2,
                              color: const Color(0xFF8CCBFF),
                            ),
                          ),
                        ),


                        Positioned(
                          bottom: 95,
                          left: 72,
                          child: Transform.rotate(
                            angle: 0.62,
                            child: Container(
                              width: 145,
                              height: 2,
                              color: const Color(0xFF8CCBFF),
                            ),
                          ),
                        ),


                        Positioned(
                          bottom: 95,
                          right: 72,
                          child: Transform.rotate(
                            angle: -0.62,
                            child: Container(
                              width: 145,
                              height: 2,
                              color: const Color(0xFF8CCBFF),
                            ),
                          ),
                        ),


                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: _etapa(
                            icone: Icons.calendar_month_outlined,
                            numero: '1',
                            titulo: 'Agendar coleta',
                            onTap: onAgenda,
                          ),
                        ),


                        Positioned(
                          top: 145,
                          left: 0,
                          child: _etapa(
                            icone: Icons.medical_services_outlined,
                            numero: '2',
                            titulo: 'Agendar exame médico',
                            onTap: onAgenda,
                          ),
                        ),


                        Positioned(
                          top: 145,
                          right: 0,
                          child: _etapa(
                            icone: Icons.local_shipping_outlined,
                            numero: '4',
                            titulo: 'Coleta chegou ao\ndestino final',
                            onTap: onDoacoes,
                          ),
                        ),


                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: _etapa(
                            icone: Icons.water_drop_outlined,
                            numero: '3',
                            titulo: 'Coleta realizada',
                            onTap: onRegistrar,
                          ),
                        ),
                      ],
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


  Widget _etapa({
    required IconData icone,
    required String numero,
    required String titulo,
    VoidCallback? onTap,
  }) {
    final conteudo = Column(
      children: [

        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            color: AppTheme.azulEscuro,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppTheme.azulEscuro.withOpacity(0.18),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(
            icone,
            color: Colors.white,
            size: 34,
          ),
        ),

        const SizedBox(height: 5),


        Container(
          width: 25,
          height: 25,
          decoration: const BoxDecoration(
            color: AppTheme.azulMedio,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            numero,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        const SizedBox(height: 4),


        Text(
          titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppTheme.azulEscuro,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );


    if (onTap == null) {
      return conteudo;
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: conteudo,
    );
  }
}

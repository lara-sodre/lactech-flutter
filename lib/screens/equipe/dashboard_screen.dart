import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../data/mock_data.dart';

class DashboardScreen extends StatefulWidget {
  final ValueNotifier<int>? secaoNotifier;
  final bool mostrarAppBar;

  const DashboardScreen({
    super.key,
    this.secaoNotifier,
    this.mostrarAppBar = true,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _secaoAtual = 0;

  @override
  void initState() {
    super.initState();

    _secaoAtual = widget.secaoNotifier?.value ?? 0;
    widget.secaoNotifier?.addListener(_sincronizarSecao);
  }

  void _sincronizarSecao() {
    if (!mounted || widget.secaoNotifier == null) return;

    setState(() {
      _secaoAtual = widget.secaoNotifier!.value;
    });
  }

  @override
  void dispose() {
    widget.secaoNotifier?.removeListener(_sincronizarSecao);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppTheme.cinzaClaro,
    appBar: widget.mostrarAppBar
        ? AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppTheme.azulEscuro,
            elevation: 0,
            title: const Text(
              'Dashboards Lactare',
              style: TextStyle(
                color: AppTheme.branco,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        : null,
    body: _buildSecao(),
  );
  }

  Widget _buildSecao() {
    switch (_secaoAtual) {
      case 0:
        return _buildColetaLeite();

      case 1:
        return _buildDoadoras();

      case 2:
        return _buildSuporteFamilias();

      case 3:
        return _buildImpacto();

      default:
        return _buildColetaLeite();
    }
  }


  Widget _buildColetaLeite() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSecaoHeader(
            'COLETA E LEITE',
            'Volume de leite coletado por dia/mês/ano e distribuição por região.',
            Icons.water_drop,
            AppTheme.azulClaro,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Coletas este mês',
                  '$totalColetasMes',
                  Icons.calendar_today,
                  AppTheme.azulClaro,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _buildMetricCard(
                  'Melhor mês',
                  '64',
                  Icons.trending_up,
                  AppTheme.verde,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildGraficoCard(
            titulo: 'Quantidade de coletas realizadas por mês — 2026',
            dados: coletasPorMes,
            corBarra: AppTheme.azulClaro,
          ),

          const SizedBox(height: 16),

          _buildInfoCard([
            _buildInfoRow(
              Icons.star,
              'Melhor mês',
              melhorMesColetas,
              AppTheme.verde,
            ),
            _buildInfoRow(
              Icons.arrow_downward,
              'Pior mês',
              piorMesColetas,
              AppTheme.vermelho,
            ),
            _buildInfoRow(
              Icons.emoji_events,
              'Melhor ano',
              melhorAnoColetas,
              AppTheme.amarelo,
            ),
            _buildInfoRow(
              Icons.history,
              'Pior ano',
              piorAnoColetas,
              AppTheme.cinzaTexto,
            ),
          ]),
        ],
      ),
    );
  }


  Widget _buildDoadoras() {
    final List<Map<String, dynamic>> cadastrosPorAno = [
      {
        'ano': '2020',
        'quantidade': 800,
      },
      {
        'ano': '2021',
        'quantidade': 1100,
      },
      {
        'ano': '2022',
        'quantidade': 1400,
      },
      {
        'ano': '2023',
        'quantidade': 1800,
      },
      {
        'ano': '2024',
        'quantidade': 2400,
      },
      {
        'ano': '2025',
        'quantidade': 3012,
      },
      {
        'ano': '2026',
        'quantidade': 1024,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSecaoHeader(
            'DOADORAS',
            'Total de doadoras ativas, evolução de novos cadastros e taxa de retenção.',
            Icons.people,
            AppTheme.azulClaro,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Doadoras ativas',
                  '$totalDoadorasAtivas',
                  Icons.volunteer_activism,
                  AppTheme.azulClaro,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _buildMetricCard(
                  'Pico em Agosto',
                  '64',
                  Icons.trending_up,
                  AppTheme.verde,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildGraficoCard(
            titulo: 'Total de doadoras ativas por mês — 2026',
            dados: coletasPorMes
                .map(
                  (m) => {
                    'mes': m['mes'],
                    'quantidade':
                        (m['quantidade'] as int) > 0
                            ? ((m['quantidade'] as int) * 0.8).toInt()
                            : 0,
                  },
                )
                .toList(),
            corBarra: AppTheme.azulClaro,
          ),

          const SizedBox(height: 16),

          _buildGraficoAnualCard(
            titulo: 'Evolução de novos cadastros por ano',
            dados: cadastrosPorAno,
            corBarra: AppTheme.azulMedio,
          ),

          const SizedBox(height: 16),

          _buildInfoCard([
            _buildInfoRow(
              Icons.star,
              'Melhor mês',
              'Agosto — 64 doadoras ativas',
              AppTheme.verde,
            ),
            _buildInfoRow(
              Icons.arrow_downward,
              'Pior mês',
              'Dezembro — 25 doadoras ativas',
              AppTheme.vermelho,
            ),
            _buildInfoRow(
              Icons.emoji_events,
              'Melhor ano',
              '2025 — 3.012 novos cadastros',
              AppTheme.amarelo,
            ),
            _buildInfoRow(
              Icons.history,
              'Pior ano',
              '2015 — 1.024 novos cadastros',
              AppTheme.cinzaTexto,
            ),
          ]),
        ],
      ),
    );
  }


  Widget _buildSuporteFamilias() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSecaoHeader(
            'SUPORTE ÀS FAMÍLIAS',
            'Total de famílias atendidas e painel de agendamentos por tipo de serviço.',
            Icons.family_restroom,
            AppTheme.azulClaro,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Consultas realizadas',
                  '${totalConsultasRealizadas ~/ 1000}K+',
                  Icons.medical_services,
                  AppTheme.azulClaro,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _buildMetricCard(
                  'Agendadas este mês',
                  '128',
                  Icons.calendar_month,
                  AppTheme.azulClaro,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildTiposServicoCard(),

          const SizedBox(height: 16),

          _buildGraficoCard(
            titulo: 'Total de famílias atendidas por mês — 2026',
            dados: coletasPorMes
                .map(
                  (m) => {
                    'mes': m['mes'],
                    'quantidade':
                        (m['quantidade'] as int) > 0
                            ? ((m['quantidade'] as int) * 1.2).toInt()
                            : 0,
                  },
                )
                .toList(),
            corBarra: AppTheme.azulClaro,
          ),

          const SizedBox(height: 16),

          _buildInfoCard([
            _buildInfoRow(
              Icons.star,
              'Melhor mês',
              'Agosto — 64 famílias',
              AppTheme.verde,
            ),
            _buildInfoRow(
              Icons.arrow_downward,
              'Pior mês',
              'Dezembro — 25 famílias',
              AppTheme.vermelho,
            ),
            _buildInfoRow(
              Icons.emoji_events,
              'Melhor ano',
              '2025 — 3.012 agendamentos',
              AppTheme.amarelo,
            ),
            _buildInfoRow(
              Icons.history,
              'Pior ano',
              '2015 — 1.024 agendamentos',
              AppTheme.cinzaTexto,
            ),
          ]),
        ],
      ),
    );
  }


  Widget _buildImpacto() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSecaoHeader(
            'IMPACTO',
            'Estimativa de bebês beneficiados com o leite coletado e síntese geral do impacto.',
            Icons.favorite,
            AppTheme.azulClaro,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Bebês beneficiados',
                  '${totalBebesBeneficiados ~/ 1000}K+',
                  Icons.child_care,
                  AppTheme.azulClaro,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _buildMetricCard(
                  'Leite distribuído',
                  '12K+ L',
                  Icons.water_drop,
                  AppTheme.azulClaro,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildInfoCard([
            _buildInfoRow(
              Icons.favorite,
              'Impacto',
              'Milhares de bebês beneficiados',
              AppTheme.verde,
            ),
            _buildInfoRow(
              Icons.water_drop,
              'Leite',
              'Distribuição contínua',
              AppTheme.azulClaro,
            ),
            _buildInfoRow(
              Icons.people,
              'Doadoras',
              '$totalDoadorasAtivas ativas',
              AppTheme.azulMedio,
            ),
            _buildInfoRow(
              Icons.medical_services,
              'Atendimentos',
              '${totalConsultasRealizadas ~/ 1000}K+ consultas',
              AppTheme.amarelo,
            ),
          ]),
        ],
      ),
    );
  }


  Widget _buildSecaoHeader(
    String titulo,
    String descricao,
    IconData icone,
    Color cor,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: cor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icone,
              color: cor,
              size: 22,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    color: cor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  descricao,
                  style: TextStyle(
                    color: AppTheme.cinzaTexto,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildMetricCard(
    String label,
    String valor,
    IconData icone,
    Color cor,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icone,
            color: cor,
            size: 20,
          ),

          const SizedBox(height: 8),

          Text(
            valor,
            style: TextStyle(
              color: cor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            label,
            style: TextStyle(
              color: AppTheme.cinzaTexto,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildGraficoCard({
    required String titulo,
    required List<Map<String, dynamic>> dados,
    required Color corBarra,
  }) {
    final maxVal = dados
        .map((d) => d['quantidade'] as int)
        .fold(
          0,
          (a, b) => a > b ? a : b,
        );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              color: corBarra,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: dados.map((d) {
                final qtd = d['quantidade'] as int;

                final altura = maxVal > 0
                    ? (qtd / maxVal) * 100
                    : 0.0;

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (qtd > 0)
                        Text(
                          '$qtd',
                          style: TextStyle(
                            color: corBarra,
                            fontSize: 8,
                          ),
                        ),

                      const SizedBox(height: 2),

                      Container(
                        height: altura > 0 ? altura : 2,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          color: qtd > 0
                              ? corBarra
                              : corBarra.withOpacity(0.2),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(3),
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        d['mes'] as String,
                        style: TextStyle(
                          color: AppTheme.cinzaTexto,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildGraficoAnualCard({
    required String titulo,
    required List<Map<String, dynamic>> dados,
    required Color corBarra,
  }) {
    final maxVal = dados
        .map((d) => d['quantidade'] as int)
        .fold(
          0,
          (a, b) => a > b ? a : b,
        );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              color: corBarra,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: dados.map((d) {
                final qtd = d['quantidade'] as int;

                final altura = maxVal > 0
                    ? (qtd / maxVal) * 100
                    : 0.0;

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: altura,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          color: corBarra,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(3),
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        d['ano'] as String,
                        style: TextStyle(
                          color: AppTheme.cinzaTexto,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildInfoCard(List<Widget> itens) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: itens
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: item,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icone,
    String label,
    String valor,
    Color cor,
  ) {
    return Row(
      children: [
        Icon(
          icone,
          color: cor,
          size: 16,
        ),

        const SizedBox(width: 8),

        Text(
          '$label: ',
          style: TextStyle(
            color: AppTheme.cinzaTexto,
            fontSize: 12,
          ),
        ),

        Expanded(
          child: Text(
            valor,
            style: TextStyle(
              color: cor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildTiposServicoCard() {
    final tipos = [
      {
        'nome': 'Apoio psicológico',
        'total': 180,
        'cor': AppTheme.azulMedio,
      },
      {
        'nome': 'Assistência técnica',
        'total': 210,
        'cor': AppTheme.azulMedio,
      },
      {
        'nome': 'Acolhimento emocional',
        'total': 150,
        'cor': AppTheme.azulClaro,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.branco,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Consultas por tipo de serviço',
            style: TextStyle(
              color: AppTheme.azulEscuro,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 12),

          ...tipos.map((t) {
            final cor = t['cor'] as Color;
            final total = t['total'] as int;

            return Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t['nome'] as String,
                        style: TextStyle(
                          color: cor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        '$total consultas',
                        style: TextStyle(
                          color: AppTheme.cinzaTexto,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: total / 250,
                      backgroundColor:
                          cor.withOpacity(0.15),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(cor),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

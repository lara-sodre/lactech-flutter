import '../models/doadora.dart';
import '../models/coleta.dart';
import '../models/consulta.dart';
import '../models/notificacao.dart';
import '../models/feedback_coleta.dart';
import '../models/familia.dart';


final doadoraLogada = const Doadora(
  nome: 'Maria Aparecida Silva',
  usuario: 'nutriz_maria',
  email: 'maria.silva@email.com',
  telefone: '(11) 99876-5432',
  endereco: 'Rua das Flores, 142 — Itapevi, SP',
  dataNascimento: '12/03/1992',
  cpf: '***.456.789-**',
  status: 'Ativa',
  bebeAmamentando: true,
  idadeBebeMeses: 4,
  metodoColeta: 'Bomba elétrica',
  alergias: 'Nenhuma',
  medicamentos: 'Nenhum no momento',
);

final familiaLogada = const Familia(
  nome: 'Ana Carolina Pereira',
  usuario: 'familia_ana',
  email: 'ana.pereira@email.com',
  telefone: '(11) 97654-3210',
  endereco: 'Av. das Palmeiras, 890 — Barueri, SP',
  dataNascimento: '05/07/1988',
  cpf: '***.123.456-**',
  status: 'Ativa',
);

const usuarioEquipe = 'equipe_lactare';
const senhaEquipe = 'admin123';


final List<Coleta> coletasMockadas = const [
  Coleta(
    id: '001',
    data: '20/05/2026',
    volumeMl: 180,
    status: 'Recebido com sucesso!',
    turno: 'Manhã (08h–12h)',
    observacoes: 'Sem observações',
  ),
  Coleta(
    id: '002',
    data: '13/05/2026',
    volumeMl: 210,
    status: 'Recebido com sucesso!',
    turno: 'Tarde (12h–18h)',
    observacoes: 'Leite coletado logo após mamada',
  ),
  Coleta(
    id: '003',
    data: '06/05/2026',
    volumeMl: 95,
    status: 'A caminho do hospital',
    turno: 'Manhã (08h–12h)',
    observacoes: 'Sem observações',
  ),
  Coleta(
    id: '004',
    data: '29/04/2026',
    volumeMl: 160,
    status: 'Recebido com sucesso!',
    turno: 'Manhã (08h–12h)',
    observacoes: 'Sem observações',
  ),
  Coleta(
    id: '005',
    data: '22/04/2026',
    volumeMl: 145,
    status: 'Recebido com sucesso!',
    turno: 'Tarde (12h–18h)',
    observacoes: 'Primeira doação do mês',
  ),
  Coleta(
    id: '006',
    data: '15/04/2026',
    volumeMl: 200,
    status: 'Recebido com sucesso!',
    turno: 'Manhã (08h–12h)',
    observacoes: 'Sem observações',
  ),
];


final List<Consulta> consultasMockadas = const [
  Consulta(
    id: '001',
    data: '20/05/2026',
    horario: '09:15 – 10:30',
    tipoServico: 'Assistência técnica',
    profissional: 'Dra. Fernanda Rocha',
    status: 'Realizada',
    observacoes: 'Dúvidas sobre técnica de ordenha',
  ),
  Consulta(
    id: '002',
    data: '13/05/2026',
    horario: '09:15 – 10:30',
    tipoServico: 'Acolhimento emocional',
    profissional: 'Psicóloga Carla Mendes',
    status: 'Agendada',
    observacoes: 'Apoio no puerpério',
  ),
  Consulta(
    id: '003',
    data: '06/05/2026',
    horario: '09:15 – 10:30',
    tipoServico: 'Apoio psicológico',
    profissional: 'Psicóloga Juliana Torres',
    status: 'Realizada',
    observacoes: 'Sem observações',
  ),
  Consulta(
    id: '004',
    data: '29/04/2026',
    horario: '09:15 – 10:30',
    tipoServico: 'Acolhimento emocional',
    profissional: 'Dra. Fernanda Rocha',
    status: 'Realizada',
    observacoes: 'Sem observações',
  ),
  Consulta(
    id: '005',
    data: '22/04/2026',
    horario: '09:15 – 10:30',
    tipoServico: 'Assistência técnica',
    profissional: 'Enf. Patricia Lima',
    status: 'Cancelada',
    observacoes: 'Cancelada pela usuária',
  ),
];


final List<Notificacao> notificacoesDoadora = const [
  Notificacao(
    titulo: 'Coleta de 20/05 chegou ao hospital!',
    descricao: 'Seu leite foi entregue ao banco de leite com sucesso.',
    horario: 'Hoje, 10:32',
    lida: false,
  ),
  Notificacao(
    titulo: 'Consulta confirmada para 28/05 às 09h00.',
    descricao: 'Lembre-se de estar disponível no horário agendado.',
    horario: 'Ontem, 14:15',
    lida: false,
  ),
  Notificacao(
    titulo: 'Coleta de 06/05 ainda em análise laboratorial.',
    descricao: 'Aguarde a confirmação do resultado da análise.',
    horario: '22/05, 09:00',
    lida: true,
  ),
  Notificacao(
    titulo: 'Obrigada pelo seu feedback!',
    descricao: 'Sua avaliação foi registrada com sucesso.',
    horario: '20/05, 16:44',
    lida: true,
  ),
  Notificacao(
    titulo: 'Lembrete: próxima coleta em 3 dias (28/05).',
    descricao: 'Prepare o material para a coleta com antecedência.',
    horario: '22/05, 08:00',
    lida: true,
  ),
];


final List<Notificacao> notificacoesApoio = const [
  Notificacao(
    titulo: 'Consulta de Apoio Psicológico confirmada — 25/04 às 10h30.',
    descricao: 'Você receberá o link de videochamada por e-mail.',
    horario: 'Hoje, 10:32',
    lida: false,
  ),
  Notificacao(
    titulo: 'Consulta confirmada para 28/05 às 09h00.',
    descricao: 'Lembre-se de acessar o link no horário.',
    horario: 'Ontem, 14:15',
    lida: false,
  ),
  Notificacao(
    titulo: 'Sessão de acolhimento emocional — 18/05 às 14h15.',
    descricao: 'Confirmada com a Psicóloga Carla Mendes.',
    horario: '22/05, 09:00',
    lida: true,
  ),
  Notificacao(
    titulo: 'Obrigada pelo seu feedback! Avaliação registrada.',
    descricao: 'Seu comentário nos ajuda a melhorar.',
    horario: '20/05, 16:44',
    lida: true,
  ),
  Notificacao(
    titulo: 'Lembrete: sessão de assistência técnica em 3 dias (03/06).',
    descricao: 'Prepare suas dúvidas com antecedência.',
    horario: '22/05, 08:00',
    lida: true,
  ),
];


final List<FeedbackColeta> feedbacksDoadora = const [
  FeedbackColeta(
    data: '20/05',
    nota: 5.0,
    comentario: 'Atendimento excelente! Equipe muito atenciosa e acolhedora.',
    referencia: 'Coleta — 20/05/2026 (180 ml)',
  ),
  FeedbackColeta(
    data: '13/05',
    nota: 4.0,
    comentario: 'Equipe muito atenciosa. Pontualidade excelente.',
    referencia: 'Coleta — 13/05/2026 (210 ml)',
  ),
  FeedbackColeta(
    data: '06/05',
    nota: 5.0,
    comentario: 'Ótimo ambiente, me senti muito acolhida.',
    referencia: 'Coleta — 06/05/2026 (95 ml)',
  ),
];


final List<FeedbackColeta> feedbacksApoio = const [
  FeedbackColeta(
    data: '20/05',
    nota: 5.0,
    comentario: 'Atendimento excelente! Profissional muito atenciosa.',
    referencia: 'Consulta — 20/05/2026',
  ),
  FeedbackColeta(
    data: '13/05',
    nota: 4.0,
    comentario: 'Equipe muito atenciosa e empática.',
    referencia: 'Consulta — 13/05/2026',
  ),
  FeedbackColeta(
    data: '06/05',
    nota: 5.0,
    comentario: 'Ótimo ambiente, me senti muito acolhida.',
    referencia: 'Consulta — 06/05/2026',
  ),
];


const int totalColetasMes = 25;
const int totalDoadorasAtivas = 52;
const int totalConsultasRealizadas = 5430;
const int totalBebesBeneficiados = 5430;

const String melhorMesColetas = 'Agosto — 64 coletas realizadas';
const String piorMesColetas = 'Dezembro — 25 coletas realizadas';
const String melhorAnoColetas = '2025 — 3.012 coletas realizadas';
const String piorAnoColetas = '2015 — 1.024 coletas realizadas';

final List<Map<String, dynamic>> coletasPorMes = [
  {'mes': 'Jan', 'quantidade': 32},
  {'mes': 'Fev', 'quantidade': 40},
  {'mes': 'Mar', 'quantidade': 45},
  {'mes': 'Abr', 'quantidade': 38},
  {'mes': 'Mai', 'quantidade': 25},
  {'mes': 'Jun', 'quantidade': 0},
  {'mes': 'Jul', 'quantidade': 0},
  {'mes': 'Ago', 'quantidade': 0},
  {'mes': 'Set', 'quantidade': 0},
  {'mes': 'Out', 'quantidade': 0},
  {'mes': 'Nov', 'quantidade': 0},
  {'mes': 'Dez', 'quantidade': 0},
];

const List<String> tiposSuporteApoio = [
  'Apoio psicológico',
  'Assistência técnica',
  'Acolhimento emocional',
];

const List<String> turnosColeta = [
  'Manhã (08h–12h)',
  'Tarde (12h–18h)',
];

const List<String> horariosConsulta = [
  '09:00',
  '09:30',
  '10:00',
  '10:30',
  '11:00',
  '14:00',
  '14:30',
  '15:00',
];

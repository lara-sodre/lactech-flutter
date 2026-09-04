class Doadora {
  final String nome;
  final String usuario;
  final String email;
  final String telefone;
  final String endereco;
  final String dataNascimento;
  final String cpf;
  final String status;
  final bool bebeAmamentando;
  final int idadeBebeMeses;
  final String metodoColeta;
  final String alergias;
  final String medicamentos;

  const Doadora({
    required this.nome,
    required this.usuario,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.dataNascimento,
    required this.cpf,
    required this.status,
    required this.bebeAmamentando,
    required this.idadeBebeMeses,
    required this.metodoColeta,
    required this.alergias,
    required this.medicamentos,
  });
}

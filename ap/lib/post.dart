class Post {
  final String idOrg;
  final String nome;
  final String email;
  final String cnpj;
  final String senha;


  Post({
    required this.idOrg,
    required this.nome,
    required this.email,
    required this.cnpj,
    required this.senha,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    idOrg: json['idOrg'],
    nome: json['nome'],
    email: json['email'],
    cnpj: json['cnpj'],
    senha: json['senha'],
  );

}

class Usuario {
    int? idUser ;
  final String nome;
  final String email;
  final String password;

  Usuario({
     this.idUser,
    required this.nome,
    required this.email,
    required this.password,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUser: map['idUser'],
      nome: map['nome'],
      email: map['email'],
      password: map['password'],
    );
  }
  
  static get x => null;
  

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'nome': nome,
      'email': email,
      'password': password,
    };
  }
}

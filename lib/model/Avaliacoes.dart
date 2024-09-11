class Avaliacao {

   int? idAvaliacao;
  final String text;
  final double rating;
  int? idUser;
  int? idProvider;

  Avaliacao({
    this.idAvaliacao,
    required this.text,
    required this.rating,
    this.idUser,
    this.idProvider
  });

  // Método para converter um Comment em Map
  Map<String, dynamic> toMap() {
    return {
      'idAvaliacao': idAvaliacao,
      'text': text,
      'rating': rating,
      'idUser': idUser,
      'idProvider': idProvider
    };
  }

  // Método para criar um Comment a partir de um Map
  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      idAvaliacao:  map['idAvaliacao'],
      text: map['text'],
      rating: map['rating'],
      idUser: map['idUser'],
      idProvider: map['idProvider']
    );
  }
}
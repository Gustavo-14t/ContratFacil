// provider_model.dart

class Provider {
  final int idProvider;
  final String name;
  final String phone;
  final String specialty;


  Provider({
    required this.idProvider,
    required this.name,
    required this.phone,
    required this.specialty,
  
  });

  // Método para converter um Provider em Map
  Map<String, dynamic> toMap() {
    return {
      'idProvider': idProvider,
      'name': name,
      'phone': phone,
      'specialty': specialty,
      
    };
  }

  // Método para criar um Provider a partir de um Map
  factory Provider.fromMap(Map<String, dynamic> map) {
    return Provider(
      idProvider: map['idProvider'],
      name: map['name'],
      phone: map['phone'],
      specialty: map['specialty'],
     
    );
  }
}


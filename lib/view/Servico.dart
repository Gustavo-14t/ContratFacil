import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/prestadordeServico.dart';
import 'package:flutter_application_1/view/registerPrestador.dart';

class ServicesView extends StatelessWidget {

// criando um construtor para receber o id do usuário
final int? idUsuario;
ServicesView( {
  
  required  this.idUsuario,

});


  final List<ServiceItem> services = [
    ServiceItem('Jardinagem', Icons.grass),
    ServiceItem('Limpeza', Icons.cleaning_services),
    ServiceItem('Encanador', Icons.plumbing),
    ServiceItem('Eletricista', Icons.electrical_services),
    ServiceItem('Pintor', Icons.format_paint),
    ServiceItem('Babá', Icons.child_care),
    ServiceItem('Motorista', Icons.directions_car),
    ServiceItem('Cozinheiro', Icons.restaurant),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços Informais'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return GestureDetector(
              onTap: () {
                // Navegação para a tela de prestadores
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ServiceProvidersView(serviceName: service.name, idUsuario: idUsuario!),
                  ),
                );
              },
              child: ServiceCard(service: service),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProviderRegisterView(idUsuario: idUsuario!)),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
        tooltip: 'Cadastrar Prestador de Serviço',
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final IconData icon;

  ServiceItem(this.name, this.icon);
}

class ServiceCard extends StatelessWidget {
  final ServiceItem service;

  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            service.icon,
            size: 50,
            color: Colors.blueGrey,
          ),
          SizedBox(height: 10),
          Text(
            service.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[800],
            ),
          ),
        ],
      ),
    );
  }
}
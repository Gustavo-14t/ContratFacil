import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/perfilPrestador.dart';
import '../model/modelPrestador.dart';

class ServiceProvidersView extends StatelessWidget {

// criando o cosntrutor para receber o id do usuario logado
  final String serviceName;
  final int idUsuario;


  ServiceProvidersView({required this.serviceName, required this.idUsuario});

  // Exemplo de lista de prestadores com comentários
  final Map<String, List<Provider>> providers = {
    'Jardinagem': [
      Provider(idProvider: 1,
          name: 'Carlos Silva', phone: '123456789', specialty: 'Jardinagem'),
      Provider(idProvider: 2,
          name: 'Maria Santos', phone: '987654321', specialty: 'Jardinagem'),
    ],
    'Limpeza': [
      Provider(idProvider: 3, name: 'Joana Pereira', phone: '111222333', specialty: 'Limpeza'),
      Provider( idProvider: 4,
          name: 'Ricardo Oliveira', phone: '444555666', specialty: 'Limpeza'),
    ],
    // Adicione mais prestadores conforme necessário
  };

  @override
  Widget build(BuildContext context) {
    final serviceProviders = providers[serviceName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Prestadores de $serviceName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: serviceProviders.isEmpty
          ? Center(
              child: Text('Nenhum prestador disponível para $serviceName.'))
          : ListView.builder(
              itemCount: serviceProviders.length,
              itemBuilder: (context, index) {
                final provider = serviceProviders[index];
                return ListTile(
                  leading: Icon(Icons.person, color: Colors.blueGrey),
                  title: Text(provider.name),
                  subtitle: Text(provider.phone),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProviderDetailsView(provider: provider, idUsuario: idUsuario),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
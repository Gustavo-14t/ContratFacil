import 'package:flutter/material.dart';

class ProviderRegisterView extends StatefulWidget {

  final int idUsuario;
  ProviderRegisterView({required this.idUsuario});


  @override
  _ProviderRegisterViewState createState() => _ProviderRegisterViewState();
}

class _ProviderRegisterViewState extends State<ProviderRegisterView> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? phone;
  String? selectedSpecialty;

  // Lista de especialidades para escolher
  final List<String> specialties = [
    'Jardinagem',
    'Limpeza',
    'Encanador',
    'Eletricista',
    'Pintor',
    'Babá',
    'Motorista',
    'Cozinheiro',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Aqui você pode adicionar lógica para salvar os dados, como enviar para um servidor ou armazenar localmente.
      // Por exemplo, adicionar o prestador à lista da especialidade escolhida.

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );

      // Após o cadastro, pode-se navegar para outra tela ou resetar o formulário.
      Navigator.pop(context); // Volta para a tela anterior após cadastrar.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Prestador'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o telefone';
                  }
                  return null;
                },
                onSaved: (value) {
                  phone = value;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Especialidade',
                  border: OutlineInputBorder(),
                ),
                items: specialties.map((specialty) {
                  return DropdownMenuItem(
                    value: specialty,
                    child: Text(specialty),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSpecialty = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione uma especialidade';
                  }
                  return null;
                },
                onSaved: (value) {
                  selectedSpecialty = value;
                },
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


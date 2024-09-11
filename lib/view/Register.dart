import 'package:flutter/material.dart';
import 'package:flutter_application_1/control/controlerUsuario.dart';
import 'package:flutter_application_1/model/usuario.dart';
import 'package:flutter_application_1/view/Login.dart';
import 'package:flutter_application_1/view/Servico.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  

  // Cria um método para salvar o cadastro
  void salvarcadastro(BuildContext context) async {
    try {
      // Variável do controller
      UserController userController = UserController();

      // Salvar os dados que o usuário digitou na classe model
      Usuario usuario = Usuario(
        nome: _nomeController.text,
        email: _emailController.text,
        password: _senhaController.text,
      );

      // Salvar usuário
      int idUsuario = await userController.addUsuario(usuario);

      // Exibe uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro realizado com sucesso!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),
        
      );
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
    } catch (e) {
      // Exibe uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro não realizado! $e"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Criar Conta'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add,
                size: 80,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 16),
              Text(
                'Crie sua conta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
              ),
              SizedBox(height: 32),
              _buildTextField('Nome', Icons.person, false, _nomeController),
              SizedBox(height: 16),
              _buildTextField('E-mail', Icons.email, false, _emailController),
              SizedBox(height: 16),
              _buildTextField('Senha', Icons.lock, true, _senhaController),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => salvarcadastro(context), // Passa o context
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Registrar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, bool isPassword,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

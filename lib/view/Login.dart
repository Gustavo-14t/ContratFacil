import 'package:flutter/material.dart';
import 'package:flutter_application_1/Control/LoginController.dart';
import 'package:flutter_application_1/model/usuario.dart';
import 'package:flutter_application_1/view/Register.dart';
import 'Servico.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();


// metodo de login do usuario
  Future<void> loginDoUsuario() async {
    final Logincontroler _loginController = Logincontroler();
    

    try {
      Usuario? user = await _loginController.loginwithEmailPassword(
        //puxando os dados que o usuário digitou e mandar para o banco de dados ver se existe o email e senha informados
        _emailController.text,
        _senhaController.text,
      );
      // Adicione lógica para o caso de login bem-sucedido
      if(user != null){ // variavel user está vazia?
      // se não tiver vazia acesse a proxima tela
        Navigator.push(
          context,
        MaterialPageRoute(builder: (context) => ServicesView( idUsuario: user.idUser!)), // passando as informações do usuário logado para as outras telas
      );
      }else{
        // mas se estiver vazia , talvez o usuario senha ou email errado

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Senha ou E-mail Incorretos!"))
        );
      }
      
    } catch (e) {
      // Trate erros aqui, como mostrar uma mensagem de erro para o usuário
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao Logar!"))
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.work_outline,
                size: 80,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 16),
              Text(
                'Bem-vindo de volta!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
              ),
              SizedBox(height: 32),
              _buildTextField('E-mail', Icons.email, false, _emailController),
              SizedBox(height: 16),
              _buildTextField('Senha', Icons.lock, true, _senhaController),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: loginDoUsuario,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Lógica para resetar senha
                },
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Navegar para a tela de registro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                child: Text(
                  'Não tem conta? Registre-se',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, bool isPassword, TextEditingController controller) {
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

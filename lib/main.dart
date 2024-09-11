import 'package:flutter/material.dart';
import 'view/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LoginView(), // Definindo a tela de login como tela inicial
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_application_1/Control/controlerAvaliacao.dart';
import 'package:flutter_application_1/model/Avaliacoes.dart';

import '../model/modelPrestador.dart';

class ProviderDetailsView extends StatefulWidget {
  final Provider provider;
  final int idUsuario;

  ProviderDetailsView({required this.provider, required this.idUsuario});

  @override
  _ProviderDetailsViewState createState() => _ProviderDetailsViewState();
}

class _ProviderDetailsViewState extends State<ProviderDetailsView> {
  final _commentController = TextEditingController();
  double _rating = 0;
  final AvaliacaoController avaliacaoController = AvaliacaoController();
  final List<Avaliacao> _lista = [];

  @override
  void initState() {
    super.initState();
    listarAvaliacoes(); // Carrega avaliações quando o widget é inicializado
  }

  Future<void> listarAvaliacoes() async {
    try {
      final avali = await avaliacaoController.listarAvaliacao(widget.provider.idProvider);
      setState(() {
        _lista.clear(); // Limpa a lista existente
        _lista.addAll(avali); // Adiciona as avaliações na lista
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao carregar avaliações: $e")),
      );
    }
  }

  void _addComment() async {
    try {
      Avaliacao avaliacao = Avaliacao(
        text: _commentController.text,
        rating: _rating,
        idUser: widget.idUsuario,
        idProvider: widget.provider.idProvider,
      );

      await avaliacaoController.addComment(avaliacao);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Avaliação Cadastrada!")),
      );

      // Atualiza a lista de avaliações após adicionar uma nova
      listarAvaliacoes();

      _commentController.clear();
      setState(() {
        _rating = 0; // Reseta a avaliação
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Avaliação não cadastrada: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.provider.name),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Especialidade: ${widget.provider.specialty}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Telefone: ${widget.provider.phone}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Avaliações:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _lista.length,
                itemBuilder: (context, index) {
                  final comment = _lista[index];
                  return ListTile(
                    title: Text('Nota: ${comment.rating.toString()}'),
                    subtitle: Text(comment.text),
                    trailing: Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Deixe um comentário:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Escreva seu comentário',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Avaliação:'),
                SizedBox(width: 10),
                DropdownButton<double>(
                  value: _rating,
                  onChanged: (value) {
                    setState(() {
                      _rating = value ?? 0;
                    });
                  },
                  items: List.generate(6, (index) => index.toDouble())
                      .map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addComment,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text('Adicionar Comentário'),
            ),
          ],
        ),
      ),
    );
  }
}

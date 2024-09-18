import 'package:flutter/material.dart';


class Perfil extends StatefulWidget {
  //contructor de la clase 
  const Perfil({super.key});

  @override
  _PerfilState createState() => _PerfilState();
}

// estado asociado a la clase Perfil
class _PerfilState extends State<Perfil> {

  // controlador para el campo de texto de comentarios
  final TextEditingController _commentController = TextEditingController();

  //lLista que guarda los comentarios
  final List<String> _comments = [];

  // metodo para agregar un comentario a la lista
  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.add(_commentController.text); //añade el comentario
        _commentController.clear();// limpia el campo
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // barra de aplicaciones con título
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // foto de portada
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/portada.jpg'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // foto de perfil
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/perfil.jpg'), 
            ),
            const SizedBox(height: 16),

            // fila con cantidad de seguidores y seguidos
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Seguidores', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('0'),
                  ],
                ),
                Column(
                  children: [
                    Text('Seguidos', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('0'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // título de comentarios
            const Text(
              'Comentarios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // lista de comentarios
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_comments[index]),
                  );
                },
              ),
            ),

            // campo de texto para agregar un comentario
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Agregar un comentario...',
                      ),
                      onSubmitted: (text) => _addComment(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _addComment,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

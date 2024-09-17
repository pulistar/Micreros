// perfil.dart
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
 
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
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
     
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/perfil.jpg'), 
            ),
            const SizedBox(height: 16),
           
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
         
            const Text(
              'Comentarios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
       
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

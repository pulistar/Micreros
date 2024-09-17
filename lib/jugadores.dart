import 'package:flutter/material.dart';

class JugadoresPage extends StatefulWidget {
  const JugadoresPage({super.key});

  @override
  _JugadoresPageState createState() => _JugadoresPageState();
}

class _JugadoresPageState extends State<JugadoresPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> jugadores = ['Jugador 1', 'Jugador 2', 'Jugador 3', 'Jugador 4', 'Jugador 5'];
  List<String> jugadoresFiltrados = [];

  @override
  void initState() {
    super.initState();
    jugadoresFiltrados = jugadores;
  }

  void _buscarJugador(String query) {
    final resultados = jugadores.where((jugador) => jugador.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      jugadoresFiltrados = resultados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jugadores'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            const Text(
              'Ranking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

   
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar Jugador',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _buscarJugador,
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: jugadoresFiltrados.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(jugadoresFiltrados[index]),
                      leading:const Icon(Icons.person),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
          
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

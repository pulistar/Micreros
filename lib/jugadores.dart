import 'package:flutter/material.dart';


class JugadoresPage extends StatefulWidget {
  //constructor de la clase JugadoresPage
  const JugadoresPage({super.key});

  @override
  _JugadoresPageState createState() => _JugadoresPageState();
}
class _JugadoresPageState extends State<JugadoresPage> {
  // controlador para el campo de texto de busqueda
  final TextEditingController _searchController = TextEditingController();
  // lista de jugadores disponibles
  List<String> jugadores = ['Jugador 1', 'Jugador 2', 'Jugador 3', 'Jugador 4', 'Jugador 5'];
  // lista de jugadores filtrados según la búsqueda
  List<String> jugadoresFiltrados = [];

  @override
  void initState() {
    super.initState();
    // inicializa la lista de jugadores filtrados con todos los jugadores
    jugadoresFiltrados = jugadores;
  }

  // metodo para buscar jugadores que coincidan con la consulta
  void _buscarJugador(String query) {
    final resultados = jugadores.where((jugador) => jugador.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      // actualiza la lista de jugadores filtrados con los resultados de la búsqueda
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
        // relleno alrededor del cuerpo del contenido
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
            const Text(
              'Ranking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // campo de texto para buscar jugadores
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar Jugador',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              // llama al método _buscarJugador cuando el texto cambia
              onChanged: _buscarJugador,
            ),
            const SizedBox(height: 16),

            // Lista de jugadores filtrados
            Expanded(
              child: ListView.builder(
                itemCount: jugadoresFiltrados.length,
                itemBuilder: (context, index) {
                  return Card(
                    // se le da sombra 
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(jugadoresFiltrados[index]),
                      leading: const Icon(Icons.person),
                      trailing: const Icon(Icons.arrow_forward),
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

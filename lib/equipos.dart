import 'package:flutter/material.dart';

import 'crear_equipo.dart';  

class EquiposPage extends StatefulWidget {
  // Constructor de la clase
  const EquiposPage({super.key});

  @override
  _EquiposPageState createState() => _EquiposPageState();
}


class _EquiposPageState extends State<EquiposPage> {
  // controlador para el campo de texto de búsqueda
  final TextEditingController _searchController = TextEditingController();

  List<String> equipos = ['Equipo A', 'Equipo B', 'Equipo C', 'Equipo D', 'Equipo E'];
  // lista de equipos filtrados según la busqeuda 
  List<String> equiposFiltrados = [];

  @override
  void initState() {
    super.initState();
    // inicializa la lista de equipos filtrados con todos los equipos
    equiposFiltrados = equipos;
  }

  // metodo para buscar equipos que coincidan con la consulta
  void _buscarEquipo(String query) {
    final resultados = equipos.where((equipo) => equipo.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      // actualiza la lista de equipos filtrados con los resultados de la búsqueda
      equiposFiltrados = resultados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        title: const Text('Equipos'),
        backgroundColor: Colors.blueAccent,
      ),
 
      body: Padding(
  
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ranking',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CrearEquipo()),
                        );
                      },
                      child: const Text('Crear Equipo'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {  },
                      child: const Text('Mi Equipo'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // campo de texto para buscar equipos
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar Equipo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
    
              onChanged: _buscarEquipo,
            ),
            const SizedBox(height: 16),

            // lista de equipos filtrados
            Expanded(
              child: ListView.builder(
                itemCount: equiposFiltrados.length,
                itemBuilder: (context, index) {
                  return Card(
            
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(equiposFiltrados[index]),
                      leading: const Icon(Icons.group),
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

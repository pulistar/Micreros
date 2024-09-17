import 'package:flutter/material.dart';

import 'crear_equipo.dart';  

class EquiposPage extends StatefulWidget {
  const EquiposPage({super.key});

  @override
  _EquiposPageState createState() => _EquiposPageState();
}

class _EquiposPageState extends State<EquiposPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> equipos = ['Equipo A', 'Equipo B', 'Equipo C', 'Equipo D', 'Equipo E'];
  List<String> equiposFiltrados = [];

  @override
  void initState() {
    super.initState();
    equiposFiltrados = equipos;
  }

  void _buscarEquipo(String query) {
    final resultados = equipos.where((equipo) => equipo.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
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
                      onPressed: () {
                  
                      },
                      child: const Text('Mi Equipo'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

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

import 'package:flutter/material.dart';

import 'crear_partido.dart';
import 'equipos.dart';
import 'jugadores.dart';
import 'mis_partidos.dart';
import 'momentos.dart';
import 'perfil.dart';

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        children: [
          buildCard('Mi Perfil', Icons.person, context),
          buildCard('Crear Partido', Icons.sports_soccer, context),
          buildCard('Mis Partidos', Icons.calendar_today, context),
          buildCard('Jugadores', Icons.people, context),
          buildCard('Equipos', Icons.group, context),
          buildCard('Momentos', Icons.access_time, context),
        ],
      ),
    );
  }

  Widget buildCard(String title, IconData icon, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          if (title == 'Mi Perfil') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Perfil()),
            );
          } else if (title == 'Crear Partido') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CrearPartido()),
            );
          } else if (title == 'Mis Partidos') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MisPartidosPage()),
            );
          } else if (title == 'Jugadores') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JugadoresPage()),
            );
          } else if (title == 'Equipos') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EquiposPage()),
            );
          } else if (title == 'Momentos') { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Momentos()),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

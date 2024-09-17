
import 'package:flutter/material.dart';

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 3,  // Tres columnas
        crossAxisSpacing: 10,
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
          print('$title presionado');
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

import 'package:flutter/material.dart';

class MisPartidosPage extends StatelessWidget {
  const MisPartidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de Tus Partidos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumen de tus partidos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Ganados', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text('5', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    Text('Empates', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text('2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    Text('Perdidos', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),

     
            Text(
              'Estadísticas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

         
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Promedio de Partidos por Jugador'),
              subtitle: Text('6 partidos/jugador'),
            ),
            ListTile(
              leading: Icon(Icons.leaderboard),
              title: Text('Ranking de Jugadores'),
              subtitle: Text('Jugador A, Jugador B, Jugador C'),
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Promedio de Goles'),
              subtitle: Text('1.5 goles por partido'),
            ),
          ],
        ),
      ),
    );
  }
}

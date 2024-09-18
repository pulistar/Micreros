import 'package:flutter/material.dart';

//maneja estado multiple 
class MisPartidosPage extends StatelessWidget {
  //constructor de la clase 
  const MisPartidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // barra superior de la página
      appBar: AppBar(
        title: const Text('Resumen de Tus Partidos'), // titulo de la barra superior 
        backgroundColor: Colors.blueAccent, 
      ),
      body: const Padding(
        // rodea todo el contenido de la página con un espaciado de 16 píxeles
        padding: EdgeInsets.all(16.0),
        child: Column(
          // organiza los elementos verticalmente
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              'Resumen de tus partidos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // espaciado entre el título y la fila siguiente

            // fila que contiene tres columnas con estadísticas de partidos
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

            // lista de estadísticas usando ListTile
            ListTile(
              leading: Icon(Icons.person), // icono para representar la estadística
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

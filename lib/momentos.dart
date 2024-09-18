import 'package:flutter/material.dart';

class Momentos extends StatelessWidget {
  //contructor de la clase 
  const Momentos({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Momentos"),
      ),
      // se crea un texto en el centro de pantalla
      body: const Center(
        child: Text("Aquí va el contenido de momentos"),
      ),
    );
  }
}

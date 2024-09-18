import 'package:flutter/material.dart';

class Busqueda extends StatelessWidget {
  //constructor de la clase
  const Busqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busqueda"),
      ),
      //texto centrado 
      body: const Center(
        child: Text("Aquí va el contenido de búsqueda"),
      ),
    );
  }
}

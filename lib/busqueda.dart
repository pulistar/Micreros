import 'package:flutter/material.dart';

class Busqueda extends StatelessWidget {
  const Busqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busqueda"),
      ),
      body: const Center(
        child: Text("Aquí va el contenido de búsqueda"),
      ),
    );
  }
}

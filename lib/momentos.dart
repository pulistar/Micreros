import 'package:flutter/material.dart';

class Momentos extends StatelessWidget {
  const Momentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Momentos"),
      ),
      body: const Center(
        child: Text("Aquí va el contenido de momentos"),
      ),
    );
  }
}

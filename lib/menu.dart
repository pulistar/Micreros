import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Menú'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            buildMenuOption('Editar Perfil', Icons.edit, context),
            buildMenuOption('Soporte', Icons.support, context),
            buildMenuOption('Términos y Condiciones', Icons.article, context),
            buildMenuOption('Eliminar Cuenta', Icons.delete, context),
            buildMenuOption('Invitar Amigos', Icons.group_add, context),
            buildMenuOption('Cerrar Sesión', Icons.logout, context),
          ],
        ),
      ),
    );
  }

  Widget buildMenuOption(String title, IconData icon, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        onTap: () {
        },
      ),
    );
  }
}

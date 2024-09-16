import 'package:flutter/material.dart';

class Encabezado extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Título alineado a la izquierda
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Micreros',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Contenedor para los íconos de búsqueda y menú
          Row(
            children: [
              // Ícono de búsqueda
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('Buscar presionado');
                },
              ),
              // Ícono de menú (hamburguesa)
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('Configuraciones presionadas');
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

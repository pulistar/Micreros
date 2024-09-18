import 'package:flutter/material.dart';

import 'busqueda.dart';
import 'menu.dart';  

class Encabezado extends StatelessWidget implements PreferredSizeWidget {
  // constructor de la clase
  const Encabezado({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Micreros',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // fila que contiene los íconos de búsqueda y menu
          Row(
            children: [
              // boton de búsqueda
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => Busqueda()),
                  ); 
                },
              ),
              // Botón de menu
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Menu()),
                  );
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
  // define el tamaño preferido para la AppBar, usando el valor predeterminado de la altura de la barra de herramientas
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

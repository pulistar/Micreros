import 'package:flutter/material.dart';
class CrearEquipo extends StatefulWidget {
  const CrearEquipo({super.key});

  @override
  _CrearEquipoState createState() => _CrearEquipoState();
}


class _CrearEquipoState extends State<CrearEquipo> {
  // clave global para el formulario
  final _formKey = GlobalKey<FormState>();

  // variables para los campos del formulario
  String _nombreEquipo = '';
  String _ubicacion = '';
  String? _equipoCreado;

  // metodo para crear un equipo
  void _crearEquipo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // actualiza el estado con la información del equipo creado
      setState(() {
        _equipoCreado = 'Nombre: $_nombreEquipo\nUbicación: $_ubicacion';
      });

      // imprime la información del equipo en la consola
      print('Nombre del Equipo: $_nombreEquipo');
      print('Ubicación: $_ubicacion');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Equipo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // formulario para crear un equipo
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // campo para ingresar el nombre del equipo
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre del Equipo',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el nombre del equipo';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nombreEquipo = value!;
                    },
                  ),
                  const SizedBox(height: 16),

                  // campo para ingresar la ubicación
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ubicación',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese la ubicación del equipo';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _ubicacion = value!;
                    },
                  ),
                  const SizedBox(height: 16),

                  // boton para crear el equipo
                  Center(
                    child: ElevatedButton(
                      onPressed: _crearEquipo,
                      child: const Text('Crear Equipo'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // muestra la información del equipo creado si existe
            if (_equipoCreado != null)
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _equipoCreado!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class CrearPartido extends StatefulWidget {
  // contructor de la clase 
  const CrearPartido({super.key});

  @override
  _CrearPartidoState createState() => _CrearPartidoState();
}


class _CrearPartidoState extends State<CrearPartido> {
  // clave global para el formulario
  final _formKey = GlobalKey<FormState>();

  // variables para los campos del formulario
  String _tipoPartido = 'Amistoso';
  String _genero = 'Masculino';
  DateTime _fechaPartido = DateTime.now();
  String _apuesta = '';
  String _comentario = '';

  // lista para almacenar los partidos creados
  final List<Map<String, dynamic>> _partidosCreados = [];

  // metodo para seleccionar la fecha del partido
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaPartido,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _fechaPartido) {
      setState(() {
        _fechaPartido = picked;
      });
    }
  }

  // metodo para crear un partido
  void _crearPartido() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // crea un mapa con la información del nuevo partido
      Map<String, dynamic> nuevoPartido = {
        'tipo': _tipoPartido,
        'genero': _genero,
        'fecha': _fechaPartido,
        'apuesta': _apuesta,
        'comentario': _comentario,
      };

      setState(() {
        // agrega el nuevo partido a la lista de partidos creados
        _partidosCreados.add(nuevoPartido);
      });

      // resetea el formulario y las variables
      _formKey.currentState!.reset();
      _tipoPartido = 'Amistoso';
      _genero = 'Masculino';
      _fechaPartido = DateTime.now();
      _apuesta = '';
      _comentario = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Partido'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // formulario para crear un partido
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // campo para seleccionar el tipo de partido
                    const Text('Tipo de Partido'),
                    DropdownButtonFormField<String>(
                      value: _tipoPartido,
                      items: const [
                        DropdownMenuItem(value: 'Amistoso', child: Text('Amistoso')),
                        DropdownMenuItem(value: 'Torneo', child: Text('Torneo')),
                        DropdownMenuItem(value: 'Competitivo', child: Text('Competitivo')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _tipoPartido = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // campo para seleccionar el género
                    const Text('Género'),
                    DropdownButtonFormField<String>(
                      value: _genero,
                      items: const [
                        DropdownMenuItem(value: 'Masculino', child: Text('Masculino')),
                        DropdownMenuItem(value: 'Femenino', child: Text('Femenino')),
                        DropdownMenuItem(value: 'Mixto', child: Text('Mixto')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _genero = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // campo para seleccionar la fecha del partido
                    const Text('Fecha del Partido'),
                    Row(
                      children: [
                        Text("${_fechaPartido.toLocal()}".split(' ')[0]),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Seleccionar Fecha'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // campo para ingresar la apuesta
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Apuesta',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        _apuesta = value!;
                      },
                    ),
                    const SizedBox(height: 16),

                    // campo para ingresar un comentario
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Comentario',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        _comentario = value!;
                      },
                    ),
                    const SizedBox(height: 16),

                    // boton para crear el partido
                    Center(
                      child: ElevatedButton(
                        onPressed: _crearPartido,
                        child: const Text('Crear Partido'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // muestra la lista de partidos creados si hay alguno
              if (_partidosCreados.isNotEmpty) ...[
                const Text(
                  'Partidos Creados',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _partidosCreados.length,
                  itemBuilder: (context, index) {
                    final partido = _partidosCreados[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text('Tipo de partido: ${partido['tipo']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Género: ${partido['genero']}'),
                            Text('Fecha: ${partido['fecha'].toLocal()}'.split(' ')[0]),
                            Text('Apuesta: ${partido['apuesta']}'),
                            Text('Comentario: ${partido['comentario']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

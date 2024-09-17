import 'package:flutter/material.dart';

class CrearPartido extends StatefulWidget {
  const CrearPartido({super.key});

  @override
  _CrearPartidoState createState() => _CrearPartidoState();
}

class _CrearPartidoState extends State<CrearPartido> {
  final _formKey = GlobalKey<FormState>();

  String _tipoPartido = 'Amistoso';
  String _genero = 'Masculino';
  DateTime _fechaPartido = DateTime.now();
  String _apuesta = '';
  String _comentario = '';

 
  final List<Map<String, dynamic>> _partidosCreados = [];

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

  void _crearPartido() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

    
      Map<String, dynamic> nuevoPartido = {
        'tipo': _tipoPartido,
        'genero': _genero,
        'fecha': _fechaPartido,
        'apuesta': _apuesta,
        'comentario': _comentario,
      };

      setState(() {
        _partidosCreados.add(nuevoPartido);
      });

    
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
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

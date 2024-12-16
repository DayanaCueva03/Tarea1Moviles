import 'package:flutter/material.dart';

class NotasScreen extends StatefulWidget {
  @override
  _NotasScreenState createState() => _NotasScreenState();
}

class _NotasScreenState extends State<NotasScreen> {
  // Lista de notas (puedes reemplazarla con datos reales)
  List<Map<String, dynamic>> _notas = [];

  // Controladores para los campos de texto
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  // Función para agregar una nueva nota
  void _addNota() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final price = double.tryParse(_priceController.text.trim());

    if (title.isNotEmpty && description.isNotEmpty && price != null) {
      setState(() {
        _notas.add({'title': title, 'description': description, 'price': price});
      });
      _titleController.clear();
      _descriptionController.clear();
      _priceController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Notas',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple[600],
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campos para agregar una nueva nota
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título de la nota',
                labelStyle: TextStyle(color: Colors.deepPurple[600]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple[600]!),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción de la nota',
                labelStyle: TextStyle(color: Colors.deepPurple[600]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple[600]!),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Precio',
                labelStyle: TextStyle(color: Colors.deepPurple[600]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple[600]!),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNota,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: Text(
                'Agregar Nota',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Lista de notas
            Expanded(
              child: ListView.builder(
                itemCount: _notas.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        _notas[index]['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[600],
                        ),
                      ),
                      subtitle: Text(
                        _notas[index]['description'],
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Text(
                        '\$${_notas[index]['price'].toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.deepPurple[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Al tocar una nota, ir a la pantalla de detalle
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NotaDetailScreen(nota: _notas[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotaDetailScreen extends StatelessWidget {
  final Map<String, dynamic> nota;

  NotaDetailScreen({required this.nota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle de la Nota',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple[600],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${nota['title']}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Descripción: ${nota['description']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              'Precio: \$${nota['price'].toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

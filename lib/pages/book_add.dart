import 'package:flutter/material.dart';
import 'package:myapp/pages/book_screen.dart';

class BookAdd extends StatefulWidget {
  const BookAdd({super.key});

  @override
  _BookAddState createState() => _BookAddState();
}

class _BookAddState extends State<BookAdd> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _ratingController = TextEditingController();
  final _editorialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar libro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título del libro'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese un título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Autor del libro'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese un autor';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(labelText: 'Rating del libro'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese un rating';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _editorialController,
                decoration: const InputDecoration(labelText: 'Editorial del libro'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese una editorial';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // agregar libro a la base de datos o lista de libros
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookScreen(
                          title: _titleController.text,
                          author: _authorController.text,
                          rating: _ratingController.text,
                          editorial: _editorialController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Agregar libro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
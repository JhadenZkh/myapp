import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  final String title;
  final String author;
  final String rating;
  final String editorial;

  const BookScreen({
    super.key,
    required this.title,
    required this.author,
    required this.rating,
    required this.editorial,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libros'),
      ),
      body: ListView.builder(
        itemCount: 1, // solo un libro
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Autor: $author'),
                  Text('Rating: $rating/5'),
                  Text('Editorial: $editorial'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

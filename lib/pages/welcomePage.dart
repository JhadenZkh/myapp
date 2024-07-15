import 'package:flutter/material.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Ratings'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Número de libros a mostrar
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/150',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Título del Libro',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text('Autor'),
                      const SizedBox(height: 8.0),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 4.0),
                          Text('4.5'),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Esta es una descripción del libro. Aquí se puede mostrar un resumen o detalles relevantes.',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
// Navegar a la pantalla de detalles del libro
                        },
                        child: const Text('Más Detalles'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                tooltip: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                tooltip: 'Explorar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                tooltip: 'Perfil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                tooltip: 'Más Opciones',
              ),
            ],
            currentIndex: 0,
            onTap: (index) {
// Navegar a la pantalla correspondiente
            },
          ),
        ],
      ),
    );
  }
}

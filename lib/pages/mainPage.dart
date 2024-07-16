import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/models/book.dart';

import 'home_screen.dart';
import 'book_screen.dart';
import 'book_add.dart';
import 'star_screen.dart';
import 'user_screen.dart';

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  List imageList = [
    {
      'id': 1,
      'path':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV-PYZF5haIOsx_uSGK2EpXoV7_QtP8kawAw&s'
    },
    {
      'id': 2,
      'path':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST2E_p3Vg9L80BWB_u0wtI0_P2Es_78q0vPR9hJmR-AGObneql'
    },
    {'id': 3, 'path': 'https://m.media-amazon.com/images/I/51ID2Nit3mL.jpg'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: const Text(
          'BookScore',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imageList
                    .map(
                      (e) => Stack(
                        fit: StackFit.expand,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                e['path'],
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: 95,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.blueAccent.withOpacity(0.3)),
                              onPressed: () {},
                              child: const Text('Ver libro'),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    int newIndex = index;
                    setState(() {
                      currentIndex = newIndex;
                    });
                  },
                ),
              ),
              Positioned(
                right: 150,
                bottom: 30,
                child: CarouselIndicator(
                  color: Colors.white.withOpacity(0.5),
                  cornerRadius: 50,
                  activeColor: Colors.red,
                  count: imageList.length,
                  index: currentIndex,
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 55,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Icon(
                Icons.home_filled,
                color: Colors.black,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookScreen(
                      title: 'Default title', // replace with actual title
                      author: 'Default author', // replace with actual author
                      rating: '4.5/5', // replace with actual rating
                      editorial:
                          'Default editorial', // replace with actual editorial
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1589558266.
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.book,
                color: Colors.black,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookAdd()),
                );
              },
              child: const Icon(
                Icons.add_circle_outline,
                size: 55,
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RatingsScreen()),
                );
              },
              child: const Icon(
                Icons.star,
                color: Colors.black,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserScreen()),
                );
              },
              child: const Icon(
                Icons.supervised_user_circle_sharp,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

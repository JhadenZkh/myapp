import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/pages/models/book.dart';

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
          'https://static.wikia.nocookie.net/esharrypotter/images/8/8d/Harry_Potter_y_el_Misterio_del_Pr%C3%ADncipe_Portada_Espa%C3%B1ol.PNG/revision/latest?cb=20151020170658'
    },
    {
      'id': 2,
      'path':
          'https://static.vecteezy.com/system/resources/thumbnails/006/795/097/small/sale-banner-or-poster-with-realistic-podium-in-orange-and-blue-color-business-illustration-free-vector.jpg'
    },
    {
      'id': 3,
      'path':
          'https://static.vecteezy.com/system/resources/previews/003/692/287/original/big-sale-discount-promotion-banner-template-with-blank-product-podium-scene-graphic-free-vector.jpg'
    },
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
                options: CarouselOptions(autoPlay: true),
              ),
              // Positioned(
              //   right: 150,
              //   bottom: 30,
              //   child: CarouselIndicator(
              //     color: Colors.white.withOpacity(0.5),
              //     cornerRadius: 50,
              //     activeColor: Colors.red,
              //     count: imageList.length,
              //     index: currentIndex,
              //   ),
              // ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 55,
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home_filled,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.book,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.add_circle_outline,
              size: 55,
              color: Colors.red,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.supervised_user_circle_sharp,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

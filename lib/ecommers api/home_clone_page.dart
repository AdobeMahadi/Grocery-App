import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/ecommers%20api/catagories_api.dart';
import 'package:http/http.dart' as http;
import 'package:thinkpool/ecommers%20api/productlist.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeClone extends StatefulWidget {
  const HomeClone({super.key});

  @override
  State<HomeClone> createState() => _HomeCloneState();
}

class _HomeCloneState extends State<HomeClone> {
  Future<Catagories> getData() async {
    var productlist = await http
        .get(Uri.parse('https://groceryorzo.neuralwebx.com/api/category/list'));
    var data = jsonDecode(productlist.body.toString());

    if (productlist.statusCode == 200) {
      return Catagories.fromJson(data);
    } else {
      return Catagories.fromJson(data);
    }
  }

  List<String> offers = [
    'https://pbs.twimg.com/media/FOCKfqGWYAQrfFs?format=jpg&name=small',
    'https://pbs.twimg.com/media/FOCKfqGWYAQrfFs?format=jpg&name=small',
    'https://pbs.twimg.com/media/FOCKfqGWYAQrfFs?format=jpg&name=small',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ************<<<<<<<<<<< Welcome Massage >>>>>>>>>>>>**************
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Welcome,",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sanika",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.lightGreenAccent[700],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "Happy Shopping",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),

            // **********<<<<<<<<<<<Catagories Hare>>>>>>>>>>>>>**********
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Catagories",
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ProductList())));
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            // ============>>>>>>>>>>>>   Catagory List Start     <<<<<<<<<<<<<<========
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 4.5,
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                  child: FutureBuilder<Catagories>(
                      future: getData(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.data.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductList()));
                                    },
                                    child: Container(
                                      height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 85,
                                            width: 80,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  snapshot
                                                      .data!.data[index].image
                                                      .toString()),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Center(
                                            child: Text(snapshot
                                                .data!.data[index].categoryName
                                                .toString()),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }));
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
                ),
              ),
            ),
            // ============>>>>>>>>>>>>   Catagory List End     <<<<<<<<<<<<<<========

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Offers",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.1,
              child: PageView(
                children: [
                  CarouselSlider(
                      items: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://pbs.twimg.com/media/FOCKfqGWYAQrfFs?format=jpg&name=small'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://pbs.twimg.com/media/FOCKfqGWYAQrfFs?format=jpg&name=small'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://pbs.twimg.com/media/FOCKfqGWYAQrfFs?format=jpg&name=small'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recently Purchase",
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 4.8,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: const Text(
                'Recently Viewed',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/ecommers%20api/catagories_api.dart';
import 'package:http/http.dart' as http;

class CatagoryList extends StatefulWidget {
  const CatagoryList({super.key});

  @override
  State<CatagoryList> createState() => _CatagoryListState();
}

class _CatagoryListState extends State<CatagoryList> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Row(
            children: [
              Expanded(
                child: FutureBuilder<Catagories>(
                    future: getData(),
                    builder: ((context, snapshot) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(30),
                              child: Container(
                                height: 120,
                                width: 80,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data!.data[index].image),
                                    ),
                                    Text(snapshot
                                        .data!.data[index].categoryName),
                                  ],
                                ),
                              ),
                            );
                          }));
                    })),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

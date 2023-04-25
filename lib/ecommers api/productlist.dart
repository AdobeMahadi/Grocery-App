import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thinkpool/ecommers%20api/account_info.dart/login_page.dart';
import 'package:thinkpool/ecommers%20api/add_to_cart.dart/cart_page.dart';
import 'package:thinkpool/ecommers%20api/catagory_wise_product_view.dart';
import 'package:thinkpool/ecommers%20api/ecommers%20api/catagories_api.dart';
import 'package:thinkpool/ecommers%20api/ecommers%20api/product%20api.dart';
import 'package:thinkpool/ecommers%20api/single_product1_view.dart';
import 'package:thinkpool/ecommers%20api/home_page_bottomnavigation_bar.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // ============>>>>>>>>>>>>   Product List API Start     <<<<<<<<<<<<<<========
  Future<AutoGenerate> getProduct() async {
    var productdata = await http
        .get(Uri.parse('https://groceryorzo.neuralwebx.com/api/products'));

    var data = jsonDecode(productdata.body.toString());

    if (productdata.statusCode == 200) {
      return AutoGenerate.fromJson(data);
    } else {
      return AutoGenerate.fromJson(data);
    }
  }
  // ============>>>>>>>>>>>>   Product List API End     <<<<<<<<<<<<<<========

  // ============>>>>>>>>>>>>   Catagory List API Start     <<<<<<<<<<<<<<========
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
  // ============>>>>>>>>>>>>   Catagory List API End     <<<<<<<<<<<<<<========

  var total = 0;
  var price = 0;

  Widget addButton(int pricep) {
    return IconButton(
        onPressed: (() {
          setState(() {
            total != total++;
            price = pricep + price;
          });
        }),
        icon: Icon(
          Icons.add_box,
          color: Colors.green.shade600,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.green.shade600,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.green.shade600,
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Icon(
                            Icons.person,
                            color: Colors.green.shade600,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            // // ============>>>>>>>>>>>>   Catagory List Start     <<<<<<<<<<<<<<========
            Expanded(
              flex: 2,
              child: FutureBuilder<Catagories>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CatagoryProductView(
                                              id: snapshot.data!.data[index].id,
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 30,
                                      child: CircleAvatar(
                                        radius: 28,
                                        foregroundImage: NetworkImage(snapshot
                                            .data!.data[index].image
                                            .toString()),
                                      ),
                                    ),
                                    Text(snapshot.data!.data[index].categoryName
                                        .toString()),
                                  ],
                                ),
                              ),
                            );
                          }));
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.grey[300],
                        color: Colors.white,
                      ));
                    }
                  }),
            ),
            // // ============>>>>>>>>>>>>   Catagory List End     <<<<<<<<<<<<<<========
            Divider(),
            // ============>>>>>>>>>>>>   Product List Start     <<<<<<<<<<<<<<========

            SizedBox(
              height: 6,
            ),
            Expanded(
              flex: 8,
              child: FutureBuilder<AutoGenerate>(
                  future: getProduct(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          clipBehavior: Clip.antiAlias,
                          itemCount: snapshot.data!.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6.0,
                            crossAxisSpacing: 6.0,
                            mainAxisExtent: 190.0,
                            childAspectRatio: 150,
                          ),
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingleProduct1(
                                              id: snapshot.data!.data[index].id,
                                            )));
                              }),
                              child: Card(
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            snapshot.data!.data[index].image,
                                            fit: BoxFit.fill,
                                          )),
                                      Text(snapshot
                                          .data!.data[index].productName
                                          .toString()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              '₹ ${snapshot.data!.data[index].productPrice}'
                                              '/kg',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          addButton(int.parse(snapshot
                                              .data!.data[index].productPrice)),
                                        ],
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
            // ============>>>>>>>>>>>>   Product List End     <<<<<<<<<<<<<<========
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.green.shade600,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${total.toString()}' '\tITEMS',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '₹${price.toInt()}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                          },
                          child: Row(
                            children: const [
                              Text(
                                'NEXT',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.white,
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

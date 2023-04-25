import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/add_to_cart.dart/cart_page.dart';
import 'package:thinkpool/ecommers%20api/ecommers%20api/api_catagory_wise_product_view.dart';
import 'package:http/http.dart' as http;
import 'package:thinkpool/ecommers%20api/productlist.dart';

class CatagoryProductView extends StatefulWidget {
  var id;
  CatagoryProductView({this.id});

  @override
  State<CatagoryProductView> createState() => _CatagoryProductViewState();
}

class _CatagoryProductViewState extends State<CatagoryProductView> {
// ============ >>>>>>>>>>> Catagory Wise Product View API Call <<<<<<<<<<<<< =============
  Future<CatagoryView> viewCatagory() async {
    final catagorydata = await http.get(Uri.parse(
        'https://groceryorzo.neuralwebx.com/api/category/wise/product/list/${widget.id}'));
    var catdata = jsonDecode(catagorydata.body.toString());

    if (catagorydata.statusCode == 200) {
      return CatagoryView.fromJson(catdata);
    } else {
      return CatagoryView.fromJson(catdata);
    }
  }

  var total = 0;
  var price = 0;

  Widget addButton(int pricep) {
    return IconButton(
        onPressed: (() {
          setState(() {
            total != total++;
            // total!=price++;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductList(),
                            ));
                      }),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.green.shade600,
                      )),
                  IconButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(),
                            ));
                      }),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.green.shade600,
                      ))
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                    child: FutureBuilder(
                        future: viewCatagory(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                itemCount: snapshot.data!.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 6,
                                  crossAxisSpacing: 6,
                                  mainAxisExtent: 180,
                                  childAspectRatio: 170,
                                ),
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Image.network(snapshot
                                                .data!.data[index].image
                                                .toString()),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Text(snapshot
                                              .data!.data[index].productName
                                              .toString()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '₹ ${snapshot.data!.data[index].productPrice.toString()}'
                                                  '/Kg'),
                                              addButton(int.parse(snapshot.data!
                                                  .data[index].productPrice)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.grey[300],
                                color: Colors.white,
                              ),
                            );
                          }
                        })),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
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
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              '₹${price.toInt()}',
                              style: const TextStyle(color: Colors.white),
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
                                  style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}

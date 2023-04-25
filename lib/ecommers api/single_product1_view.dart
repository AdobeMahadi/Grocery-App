import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/add_to_cart.dart/cart_page.dart';
import 'package:thinkpool/ecommers%20api/ecommers%20api/api_single_product_view.dart';
import 'package:http/http.dart' as http;
import 'package:thinkpool/ecommers%20api/productlist.dart';

class SingleProduct1 extends StatefulWidget {
  var id;
  SingleProduct1({
    super.key,
    required this.id,
  });

  @override
  State<SingleProduct1> createState() => _SingleProduct1State();
}

class _SingleProduct1State extends State<SingleProduct1> {
  // >>>>>>>>>>>>>> Single Product View API Call <<<<<<<<<<<<
  Future<SingleProductView> singleData() async {
    var productdata = await http.get(Uri.parse(
        'https://groceryorzo.neuralwebx.com/api/product/${widget.id}'));

    var getdata = jsonDecode(productdata.body.toString());

    if (productdata.statusCode == 200) {
      return SingleProductView.fromJson(getdata);
    } else {
      return SingleProductView.fromJson(getdata);
    }
  }

  // >>>>>>>>>> Single Product View API end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
          child: FutureBuilder<SingleProductView>(
              future: singleData(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductList(),
                                      ));
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.green.shade600,
                                )),
                            Icon(
                              Icons.add_shopping_cart,
                              color: Colors.green.shade600,
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 6.0),
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Image.network(
                            snapshot.data!.data.image,
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.53,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.data.productName
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 28,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.currency_rupee,
                                      size: 24,
                                    ),
                                    // ignore: prefer_interpolation_to_compose_strings
                                    Text(
                                      snapshot.data!.data.productPrice
                                              .toString() +
                                          "" +
                                          "/Kg",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(snapshot.data!.data.productNameFr
                                    .toString()),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Related Items",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 1,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16)),
                                    color: Colors.green[500],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CartPage(
                                                    id: snapshot.data!.data.id,
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 40,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(14),
                                              bottomLeft: Radius.circular(14),
                                              bottomRight: Radius.circular(14)),
                                        ),
                                        child:
                                            const Icon(Icons.add_shopping_cart),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[300],
                      color: Colors.white,
                    ),
                  );
                }
              }))),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/ecommers%20api/api_single_product_view.dart';
import 'package:http/http.dart' as http;
import 'package:thinkpool/ecommers%20api/payment_method.dart/pay_now.dart';

class CartPage extends StatefulWidget {
  var id;
  CartPage({this.id});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future<SingleProductView> addCart() async {
    final cartdata = await http.get(Uri.parse(
        'https://groceryorzo.neuralwebx.com/api/product/${widget.id}'));

    var cartbody = jsonDecode(cartdata.body.toString());

    if (cartdata.statusCode == 200) {
      return SingleProductView.fromJson(cartbody);
    } else {
      return SingleProductView.fromJson(cartbody);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Cart',
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.green.shade600,
                            )),
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.green.shade600,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: addCart(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListTile(
                          leading: Image.network(
                              snapshot.data!.data.image.toString()),
                          title:
                              Text(snapshot.data!.data.productName.toString()),
                          subtitle: Text(
                              snapshot.data!.data.productNameFr.toString()),
                          trailing: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green.shade600),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PayNow()));
                              },
                              child: Text("Pay Now")),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}

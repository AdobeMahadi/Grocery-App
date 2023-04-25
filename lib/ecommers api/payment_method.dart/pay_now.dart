import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/add_to_cart.dart/cart_page.dart';

class PayNow extends StatelessWidget {
  const PayNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==========>>>> App Bar <<<==========
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            }),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green.shade600,
            )),
        title: Text(
          'Select Payment Method',
          style: TextStyle(
            color: Colors.green.shade600,
          ),
        ),
      ),
      // ===========>>> BottomApp Bar <<<=============
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(color: Colors.green.shade600),
              ),
              const Text(
                '৳ 200',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 11,
              width: MediaQuery.of(context).size.width,
              color: Colors.greenAccent.shade100,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Collect your Prepayment voucher & Enjou Extra\nSavings on Selected Cards',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Recommended Methods'),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 10,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/8983/8983163.png'),
                    ),
                    const Text('Credit/Debit Card'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 10,
                      child: Image.network(
                          'https://e7.pngegg.com/pngimages/669/34/png-clipart-american-express-logo-american-express-payment-credit-card-membership-rewards-money-credit-card-blue-text-thumbnail.png'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 10,
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/450px-MasterCard_Logo.svg.png?20140711182052'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 10,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/349/349221.png'),
                    ),
                    IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Other saved methods'),
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                          'https://logos-download.com/wp-content/uploads/2022/01/BKash_Logo_icon-700x662.png'),
                      title: const Text('017******357'),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward)),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Payment methods'),
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 9,
                            child: Image.network(
                                'https://logos-download.com/wp-content/uploads/2022/01/Nagad_Logo_full-700x985.png')),
                        const Text('Nagad'),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 9,
                            child: Image.network(
                                'https://seeklogo.com/images/D/dutch-bangla-rocket-logo-B4D1CC458D-seeklogo.com.png')),
                        const Text('Rocket'),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 9,
                            child: Image.network(
                                'https://examresultbd.com/wp-content/uploads/2016/06/Dutch-Bangla-Bank-Ltd.jpg')),
                        const Text('DBBL'),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 9,
                            child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/1094/1094894.png')),
                        const Text('Installment'),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 9,
                            child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/6491/6491511.png')),
                        const Text('Cash on Delivery'),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 11,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.greenAccent.shade100,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Collect your Prepayment voucher & Enjou Extra\nSavings on Selected Cards',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

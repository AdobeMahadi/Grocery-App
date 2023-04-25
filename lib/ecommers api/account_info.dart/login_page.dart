import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/account_info.dart/sign_up.dart';
import 'package:thinkpool/ecommers%20api/productlist.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  bool passvisible = true;
  @override
  void initState() {
    _emailcontroller.addListener(() {
      setState(() {});
    });
    _passcontroller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network(
                      'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgyAW2uLWTGqrg3-e_i-RzdGH-t8a7Pt4JQ3EdqW2-rx0NL3at7RtP3akztC9CWOK0Ec7iXmV3-b6GO09XIlDf-sfJW4btTSgHcT1kQSsMUgkZCU7EVSj9g3Mlz1i-aYHUA39_Ka68X2TU8e1Xq-T22h-ld617qcapjRyFrxnTg7qNvwSZzhbA517W7Ww/s287/Capture.PNG'),
                ),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Please Login to continue.',
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Form(
                  key: formkey,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.73,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Phone/Email',
                                style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _emailcontroller,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Email field can`t be empty!';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade100,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.green.shade100,
                                      width: 2,
                                    )),
                                prefixIcon: const Icon(Icons.email),
                                hintText: 'Please enter your email!',
                                fillColor: Colors.grey[100],
                                filled: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: passvisible,
                              controller: _passcontroller,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Password can`t be null';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.green.shade100,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.green.shade100)),
                                prefixIcon: Icon(Icons.vpn_key),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passvisible = !passvisible;
                                      });
                                    },
                                    icon: Icon(passvisible
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                hintText: 'Please enter a strong password!',
                                fillColor: Colors.grey[100],
                                filled: true,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password!',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductList()));
                              } else {
                                null;
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.green.shade600),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Don`t you have a account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.green.shade600,
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sign In with',
                            style: TextStyle(
                              color: Colors.green.shade600,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/300/300221.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/5968/5968764.png'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:thinkpool/ecommers%20api/account_info.dart/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _confirmpasscontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();

  bool passvisible = true;
  bool confirmpassvisible = true;

  @override
  void initState() {
    _emailcontroller.addListener(() {
      setState(() {});
    });
    _passcontroller.addListener(() {
      setState(() {});
    });
    _confirmpasscontroller.addListener(() {
      setState(() {});
    });
    _addresscontroller.addListener(() {
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
                // ==========>>>>>>> Heading start <<<<<<<==============
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network(
                      'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgyAW2uLWTGqrg3-e_i-RzdGH-t8a7Pt4JQ3EdqW2-rx0NL3at7RtP3akztC9CWOK0Ec7iXmV3-b6GO09XIlDf-sfJW4btTSgHcT1kQSsMUgkZCU7EVSj9g3Mlz1i-aYHUA39_Ka68X2TU8e1Xq-T22h-ld617qcapjRyFrxnTg7qNvwSZzhbA517W7Ww/s287/Capture.PNG'),
                ),
                const Text(
                  'Hello There!',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Register below with your details',
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontSize: 20,
                  ),
                ),
                // =========>>>>>> Heading End <<<<<<=======
                SizedBox(
                  height: 14,
                ),

                // =========>>>>>>> Sign Up info <<<<<<<<<===========
                Form(
                  key: formkey,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.40,
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
                          // ========>>>> Email Field
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
                          //===========>>>>>> Email Field End <<<<<<<<============

                          // ===========>>>>> Password Field <<<<<<<<<<============
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
                                if (value!.isEmpty) {
                                  return 'Password can`t be null';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long.';
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
                                prefixIcon: const Icon(Icons.vpn_key),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passvisible = !passvisible;
                                      });
                                    },
                                    icon: Icon(passvisible
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                hintText: 'Enter a strong password!',
                                fillColor: Colors.grey[100],
                                filled: true,
                              ),
                            ),
                          ),
                          // ============>>>>>> Password Field End <<<<<<<<============

                          // ============>>>>> Confirm Pass <<<<<<<<<<<=============
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Confirm password',
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
                              obscureText: confirmpassvisible,
                              controller: _confirmpasscontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password can`t be null';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long.';
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
                                        confirmpassvisible =
                                            !confirmpassvisible;
                                      });
                                    },
                                    icon: Icon(confirmpassvisible
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                hintText: 'Enter a strong password!',
                                fillColor: Colors.grey[100],
                                filled: true,
                              ),
                            ),
                          ),
                          // ==========>>>>>>> Confirm Pass End <<<<<<<<<=========

                          // ===========>>>>>> Address Field <<<<<<<<<===========
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Address',
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
                              controller: _addresscontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Address can`t be null';
                                } else if (value.length < 6) {
                                  return 'Enter a valid address';
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
                                prefixIcon: const Icon(Icons.home),
                                hintText: 'Enter your address',
                                fillColor: Colors.grey[100],
                                filled: true,
                              ),
                            ),
                          ),
                          // ============>>>>>> Address Field End <<<<<<<<==============

                          GestureDetector(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
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
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Already have an account!',
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
                                      builder: (context) => const LoginPage()));
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
                                  'Sign In',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

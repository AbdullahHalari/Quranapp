// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quranapp/drawer.dart';
import 'package:quranapp/home.dart';
import 'package:quranapp/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  // const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isHidden = true;
 
  @override
  bool loading = false;
  Widget build(BuildContext context) {
    final TextEditingController fnameController = TextEditingController();
    final TextEditingController lnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController cpasswordController = TextEditingController();
    final TextEditingController urlcontroller = TextEditingController();


    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String fname = fnameController.text;
      final String lname = lnameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String cpassword = cpasswordController.text;
      final String url = urlcontroller.text;
      try {
        setState(() {
          loading = true;
        });
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await db.collection("users").doc(user.user?.uid).set({
          "email": email,
          "first_name": fname,
          "last_name": lname,
          "password": password,
          "confirm_password": cpassword,
          "url": url,
        });
        setState(() {
          loading = false;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
        print("user is registerd");
      } catch (e) {
        Fluttertoast.showToast(msg: 'error caught: $e');
        setState(() {
          loading = false;
        });
        print(e);
      }

      // ignore: use_build_context_synchronously
    }

    return Listener(
        onPointerDown: (PointerDownEvent event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            // backgroundColor: Colors.blue,
            body: Container(
                // ignore: prefer_const_constructors
                constraints: BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/bg2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Image.asset('images/logo1.png',
                              width: 100, height: 150),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(3),
                            child: const Text(
                              'القرآن الكريم',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(color: Colors.amber[800]),
                            cursorColor: Colors.red,
                            controller: fnameController,
                            textInputAction: TextInputAction.next,
                            // onChanged: (val) {
                            //           final trimVal = val.trim();
                            //           if (val != trimVal)
                            //             setState(() {
                            //               fnameController.text = trimVal;
                            //               fnameController.selection = TextSelection.fromPosition(TextPosition(offset: trimVal.length));
                            //             });
                            //         },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber)),
                              hoverColor: Colors.amber[800],
                              labelStyle: const TextStyle(color: Colors.white),
                              fillColor:
                                  const Color.fromRGBO(255, 255, 255, 0.2),
                              filled: true,
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(color: Colors.amber[800]),
                            cursorColor: Colors.red,
                            controller: lnameController,
                            textInputAction: TextInputAction.next,
                            // onChanged: (val) {
                            //           final trimVal = val.trim();
                            //           if (val != trimVal)
                            //             setState(() {
                            //               lnameController.text = trimVal;
                            //               lnameController.selection = TextSelection.fromPosition(TextPosition(offset: trimVal.length));
                            //             });
                            //         },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              hoverColor: Colors.amber[800],
                              labelStyle: const TextStyle(color: Colors.white),
                              labelText: 'Last Name',
                              fillColor:
                                  const Color.fromRGBO(255, 255, 255, 0.2),
                              filled: true,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(color: Colors.amber[800]),
                            cursorColor: Colors.red,
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            // onChanged: (val) {
                            //   final trimVal = val.trim();
                            //   if (val != trimVal)
                            //     setState(() {
                            //       emailController.text = trimVal;
                            //       emailController.selection =
                            //           TextSelection.fromPosition(
                            //               TextPosition(offset: trimVal.length));
                            //     });
                            // },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              hoverColor: Colors.amber[800],
                              labelStyle: const TextStyle(color: Colors.white),
                              fillColor:
                                  const Color.fromRGBO(255, 255, 255, 0.2),
                              filled: true,
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(color: Colors.amber[800]),
                            cursorColor: Colors.red,
                            controller: passwordController,
                            textInputAction: TextInputAction.next,
                            // onChanged: (val) {
                            //           final trimVal = val.trim();
                            //           if (val != trimVal)
                            //             setState(() {
                            //               passwordController.text = trimVal;
                            //               passwordController.selection = TextSelection.fromPosition(TextPosition(offset: trimVal.length));
                            //             });
                            //         },
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              border: const OutlineInputBorder(),
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              hoverColor: Colors.amber[800],
                              labelStyle: const TextStyle(color: Colors.white),
                              labelText: 'Password (at least 6 char)',
                              fillColor:
                                  const Color.fromRGBO(255, 255, 255, 0.2),
                              filled: true,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(color: Colors.amber[800]),
                            cursorColor: Colors.red,
                            controller: cpasswordController,
                            textInputAction: TextInputAction.done,
                            // onChanged: (val) {
                            //           final trimVal = val.trim();
                            //           if (val != trimVal)
                            //             setState(() {
                            //               cpasswordController.text = trimVal;
                            //               cpasswordController.selection = TextSelection.fromPosition(TextPosition(offset: trimVal.length));
                            //             });
                            //         },
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              border: const OutlineInputBorder(),
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              hoverColor: Colors.amber[800],
                              labelStyle: const TextStyle(color: Colors.white),
                              labelText: 'Confirm Password (at least 6 char)',
                              fillColor:
                                  const Color.fromRGBO(255, 255, 255, 0.2),
                              filled: true,
                            ),
                          ),
                        ),
                        loading
                            ? Center(
                                child: new CircularProgressIndicator(
                                  backgroundColor: Color.fromARGB(255, 6, 23, 153),
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.red),
                                  strokeWidth: 8,
                                ),
                              )
                            : Container(
                                // height: 50,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255,4,56,100),
                                      // padding: EdgeInsets.fromLTRB(100, 0, 100, 0)
                                    ),
                                    // textColor: Colors.black,
                                    // color: Colors.red,
                                    // ignore: prefer_const_constructors
                                    child: Text('Sign up'),
                                    onPressed: register)),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 4, 56, 100),
                              // padding: EdgeInsets.fromLTRB(100, 0, 100, 0)
                            ),

                            // textColor: Colors.blue,
                            child: const Text(
                              'Login',
                              // style: TextStyle(
                              //   fontSize: 20,
                              // ),
                            ),
                            onPressed: () {
                              //login screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                          ),
                        )
                      ],
                    )))));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:quranapp/home.dart';
// import 'package:quranapp/services/shared_preferences_service.dart';
import 'package:quranapp/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hungryman/Home1post.dart';
// import 'package:hungryman/home.dart';
// import 'package:hungryman/bottom_bar.dart';
import 'package:quranapp/reset.dart';

// import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class Login extends StatefulWidget {
  // const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  @override
  bool loading = false;
  Widget build(BuildContext context) {
    void login() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = emailController.text;
      final String password = passwordController.text;
      // ignore: no_leading_underscores_for_local_identifiers
      // final PrefService _prefService = PrefService();
      try {
        setState(() {
          loading = true;
        });
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        final DocumentSnapshot snapshot =
            await db.collection("user").doc(user.user!.uid).get();
        snapshot.data();
        setState(() {
          loading = false;
        });
        // _prefService.createCache(passwordController.text).whenComplete(() {
          // if (emailController.text.isNotEmpty &&
          //     passwordController.text.isNotEmpty) {
            // ignore: use_build_context_synchronously
            // Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home()));
            // Navigator.push(
            //     // ignore: prefer_const_constructors
            //     context,
            //     MaterialPageRoute(builder: (context) => const Home()));
        //   }
        // });

        print("user is logged in");
        // final UserCredential user = await auth.createUserWithEmailAndPassword(
        //     email: email, password: password);
        // await db.collection("users").doc(user.user.uid).set({
        //   "email": email,
        //   // "first_name": fname,
        //   // "last_name": lname,
        //   "password": password,
        //   // "confirm_password": cpassword,
        // });
        // print("user is registerd");
      } catch (e) {
        print("error");
        setState(() {
          loading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(e.toString()),
              );
            });
      }
    }

    return WillPopScope(
        onWillPop: () async {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Please First login to enter the app')));

          return false;
        },

        // return
        //  Listener(
        // onPointerDown: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),

        child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: ListView(
                  children: [
                    Container(
                      child: Image.asset(
                        'images/logo.png',
                        width: 100,
                        height: 150,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Quran App',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.amber[800]),
                        cursorColor: Colors.red,
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        onChanged: (val) {
                          final trimVal = val.trim();
                          if (val != trimVal)
                            // ignore: curly_braces_in_flow_control_structures
                            setState(() {
                              emailController.text = trimVal;
                              emailController.selection =
                                  TextSelection.fromPosition(
                                      TextPosition(offset: trimVal.length));
                            });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          fillColor: const Color.fromRGBO(255, 255, 255, 0.2),
                          filled: true,
                          // fillColor: Colors.white,
                          hoverColor: Colors.amber[800],
                          labelStyle: const TextStyle(color: Colors.white),

                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.red,
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        onChanged: (val) {
                          final trimVal = val.trim();
                          if (val != trimVal)
                            setState(() {
                              passwordController.text = trimVal;
                              passwordController.selection =
                                  TextSelection.fromPosition(
                                      TextPosition(offset: trimVal.length));
                            });
                        },
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
                          fillColor: const Color.fromRGBO(255, 255, 255, 0.2),
                          filled: true,
                          labelStyle: const TextStyle(color: Colors.white),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    loading
                        ? Center(
                            child: new CircularProgressIndicator(
                              backgroundColor: Color.fromARGB(255, 6, 23, 153),
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(Colors.red),
                              strokeWidth: 10,
                            ),
                          )
                        : Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 6, 23, 153),
                                  // padding: EdgeInsets.fromLTRB(100, 0, 100, 0)
                                ),
                                onPressed: login,
                                child: const Text("Login")),
                          ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const reset()));
                        },
                        child: Container(
                            height: 15,
                            child: const Align(
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  "reset password",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 255, 0, 0),
                                  ),
                                )))),
                    Container(
                        // height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Column(
                          children: [
                            Text(
                              "Does not have any account?",
                              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 6, 23, 153),
                                      padding: const EdgeInsets.fromLTRB(
                                          100, 0, 100, 0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()));
                                  },
                                  child: const Text("Sign up")),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            )));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.amber[800]),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                filled: true,
                // fillColor: Colors.white,
                hoverColor: Colors.amber[800],
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),

                labelText: 'Email',
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: TextField(
          //     keyboardType: TextInputType.emailAddress,
          //     decoration: InputDecoration(
          //       hintText: 'Enter your Email'
          //     ),
          //      onChanged: (value) {
          //       setState(() {
          //         _email = value.trim();
          //       });
          //     },
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[800],
                    // padding: EdgeInsets.fromLTRB(100, 0, 100, 0)
                  ),
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Fluttertoast.showToast(
                        msg: "check your email inbox, also spam. Thank you!");
                    Navigator.of(context).pop();
                    
                  },
                  child: Text("Send Request")),
            ],
          ),
        ],
      ),
    );
  }
}


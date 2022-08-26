import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Contact extends StatefulWidget {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController message = TextEditingController();

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  Future<void> vaildation() async {
    if (email.text.isEmpty && fullname.text.isEmpty && message.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("All Fleid Is Empty"),
        ),
      );
    } else if (fullname.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("FullName Is Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!Contact.regExp.hasMatch(email.text)) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
    } else if (message.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Message Is Empty"),
        ),
      );
    } else {
      Fluttertoast.showToast(msg: "We will contact you soon!");
      Navigator.of(context).pop();
    }
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final String f_name = fullname.text;
    final String msg = message.text;
    final String _email = email.text;

    try {
      // FirebaseFirestore.instance
      //     .collection('contact')
      //     .doc(FirebaseAuth.instance.currentUser!.email)

      //     .snapshots();
      await db
          .collection("contacts")
          .doc(FirebaseAuth.instance.currentUser!.email).collection("msg")
          .doc()
          .set({
        "email": _email,
        "full_name": f_name,
        "message": msg,
      });
      print("message send success");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 70, 123),
        title: Text(
          "Contact Us",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 232, 232, 232),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.amber[800]),
              cursorColor: Colors.red,
              controller: fullname,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                filled: true,
                // fillColor: Colors.black,
                hoverColor: Colors.amber[800],
                labelStyle: TextStyle(color: Colors.black),

                labelText: 'Full Name',
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (val) {
                final trimVal = val.trim();
                if (val != trimVal)
                  setState(() {
                    email.text = trimVal;
                    email.selection = TextSelection.fromPosition(
                        TextPosition(offset: trimVal.length));
                  });
              },
              style: TextStyle(color: Colors.amber[800]),
              cursorColor: Colors.red,
              controller: email,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                filled: true,
                // fillColor: Colors.black,

                hoverColor: Colors.amber[800],
                labelStyle: TextStyle(color: Colors.black),

                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.amber[800]),
              cursorColor: Colors.red,
              controller: message,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.message_rounded,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                filled: true,
                // fillColor: Colors.black,
                hoverColor: Colors.amber[800],
                labelStyle: TextStyle(color: Colors.black),

                labelText: 'Message',
              ),
            ),
          ),

          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 5, 70, 123),
                  // padding: EdgeInsets.fromLTRB(100, 0, 100, 0)
                ),
                onPressed: vaildation,
                child: Text("SEND")),
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               TextField(
          //                 controller: fullname,
          //                 decoration: InputDecoration(labelText: "Full name"),
          //               ),
          //               TextField(
          //                 controller: fullname,
          //                 decoration: InputDecoration(labelText: "Email"),
          //               ),
          //               TextField(
          //                 controller: fullname,
          //                 decoration: InputDecoration(labelText: "Message"),
          //               ),
          //               ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   primary: Colors.amber,
          //                   padding:
          //                       EdgeInsets.symmetric(horizontal: 90, vertical: 10),
          //                 ),
          //                 child: Text("Submit"),
          //                 onPressed: () {
          //                   vaildation();
          //                 },
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      )),
    );
  }
}

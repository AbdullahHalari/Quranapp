// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/login.dart';
import 'package:quranapp/quran_api.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String full_name = " loading....";
  String email = "loading....";

  var date = DateTime.now();
  var formatterDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
  var formatterTime = DateFormat('H:mm:ss').format(DateTime.now());

  void getData() async {
    // ignore: await_only_futures
    User? user = await FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();
    setState(() {
      full_name = data.data()!['first_name'] + " " + data.data()!['last_name'];
      email = data.data()!['email'];
    });
  }

  void initState() {
    super.initState();
    getData();
  }

  void signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("user logout");
    } catch (e) {
      print(e);
    }
    // await _prefService.removeCache("password").whenComplete(() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => Login()));
    // }
    // );
  }

  @override
  Widget build(BuildContext context) {
     Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Color.fromARGB(255, 247, 208, 90),
              title: Text('القرآن الكريم',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              ),
              content: Text('Do you want to exit القرآن الكريم?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 4, 56, 100),
                  ),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 4, 56, 100),
                  ),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(

        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Please First login to enter the app')));
        onWillPop: showExitPopup,
        child:
    
    
    
    
     Scaffold(
        appBar: AppBar(
            centerTitle: true,
          title: const Text(
            "القرآن الكريم",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)
              
            ),
            
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 0)
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.navigate_next),
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) =>
          //                   getLastViewedPage()));
          //       // _pdfController.nextPage(
          //       //   curve: Curves.ease,
          //       //   duration: const Duration(milliseconds: 100),
          //       // );
          //     },
          //   ),
          // ],
        ),
        drawer: Drawer(
          
          width: 250,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 5, 70, 123),
                  // color: Color.fromRGBO(0, 136, 204, 100),
                ),
                accountName: Text(full_name),
                accountEmail: Text(email),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("images/logo1.png"),
                  backgroundColor: Colors.transparent,
                ),
                // onDetailsPressed: () {},
              ),
              const ListTile(
                leading: Icon(Icons.feedback),
                title: Text("Feedback"),
              ),
              const ListTile(leading: Icon(Icons.people), title: Text("Share")),
              const ListTile(
                  leading: Icon(Icons.policy), title: Text("Privacy Policy")),
              const ListTile(
                  leading: Icon(Icons.rate_review_outlined),
                  title: Text("Rate us")),
              GestureDetector(
                  onTap: () {
                    signout();
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  )),
              const Divider(
                height: 40,
                thickness: 2.0,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            //  SizedBox(height:20),

            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 143, 156, 166),
                ),
                margin: EdgeInsets.all(8),
                height: 80,
                width: MediaQuery.of(context).size.width,
                // width: 300,

                // elevation: 10,
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 5, 70, 123),
                      ),
                      // margin:EdgeInsets.fromLTRB(0, 0, 0, 20),

                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                'images/icon2.png',
                                width: 40,
                                height: 40,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                formatterDate.toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ])),
                  Row(
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            "Current Time: " + formatterTime,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                      ])
                ])),

            SizedBox(height: 3),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 5, 70, 123),
              ),
              margin: EdgeInsets.all(8),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color.fromARGB(255, 5, 70, 123),
                // elevation: 10,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        'images/icon1.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Surah Yunus',
                        style: TextStyle(fontSize: 21.0, color: Colors.white),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Resume",
                              style: TextStyle(
                                color: Color.fromARGB(255, 5, 70, 123),
                              ),
                            )))
                  ],
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: <Widget>[
                  //card 1
                  CupertinoButton(
                    child: Card(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                           border: Border.all(color: Color.fromARGB(255, 5, 70, 123)),
                          // image: DecorationImage(
                          //   image: AssetImage("images/1.jpg"),
                          //   fit: BoxFit.cover,
                          // ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                          Padding(
                      padding: EdgeInsets.all(18),
                      child: Image.asset(
                        'images/icon3.png',
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 5, 70, 123)
                      ),
                    ),
                           Text(
                            "Surah Index",
                            style: TextStyle(
                               color: Color.fromARGB(255, 5, 70, 123),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),]
                        ),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Card is clicked.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('ok'),
                              onPressed: () {
                                Navigator.pop(context, 'ok');
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  //card2

                  CupertinoButton(
                    child: Card(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                           border: Border.all(color: Color.fromARGB(255, 5, 70, 123)),
                          // image: DecorationImage(
                          //   image: AssetImage("images/1.jpg"),
                          //   fit: BoxFit.cover,
                          // ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                         child: Column(
                          children: [
                          Padding(
                      padding: EdgeInsets.all(18),
                      child: Image.asset(
                        'images/icon4.png',
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 5, 70, 123)
                      ),
                    ),
                           Text(
                            "Need to Know",
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 70, 123),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),]
                        ),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Card is clicked.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('ok'),
                              onPressed: () {
                                Navigator.pop(context, 'ok');
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  //card3
                  CupertinoButton(
                    child: Card(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                           border: Border.all(color: Color.fromARGB(255, 5, 70, 123)),
                          // image: DecorationImage(
                          //   image: AssetImage("images/1.jpg"),
                          //   fit: BoxFit.cover,
                          // ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                          Padding(
                      padding: EdgeInsets.all(18),
                      child: Image.asset(
                        'images/icon5.png',
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 5, 70, 123)
                      ),
                    ),
                           Text(
                            "Quran Info",
                            style: TextStyle(
                               color: Color.fromARGB(255, 5, 70, 123),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),]
                        ),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Card is clicked.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('ok'),
                              onPressed: () {
                                Navigator.pop(context, 'ok');
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  //card4
                  CupertinoButton(
                    child: Card(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                         border: Border.all(color: Color.fromARGB(255, 5, 70, 123)),
                          // image: DecorationImage(
                          //   image: AssetImage("images/1.jpg"),
                          //   fit: BoxFit.cover,
                          // ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                          Padding(
                      padding: EdgeInsets.all(18),
                      child: Image.asset(
                        'images/icon6.png',
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 5, 70, 123),
                      ),
                    ),
                           Text(
                            "Goto Page ",
                            style: TextStyle(
                               color: Color.fromARGB(255, 5, 70, 123),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),]
                        ),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Card is clicked.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('ok'),
                              onPressed: () {
                                Navigator.pop(context, 'ok');
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ))
          ],
        )));
  }
}

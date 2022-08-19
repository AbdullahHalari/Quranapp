// // ignore_for_file: unnecessary_const, prefer_const_constructors, avoid_print

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:quranapp/Globals.dart';
// import 'package:quranapp/login.dart';
// import 'package:quranapp/pdf.dart';
// import 'package:quranapp/quran_api.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:quranapp/services/shared_preferences_service.dart';

// class Drawer_home extends StatefulWidget {
//   const Drawer_home({Key? key}) : super(key: key);

//   @override
//   State<Drawer_home> createState() => _Drawer_homeState();
// }

// class _Drawer_homeState extends State<Drawer_home> {
//   // final PrefService _prefService = PrefService();
  // String full_name = " loading....";
  // String email = "loading....";
  // void getData() async {
  //   // ignore: await_only_futures
  //   User? user = await FirebaseAuth.instance.currentUser;
  //   var data = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get();
  //   setState(() {
  //     full_name = data.data()!['first_name'] + " " + data.data()!['last_name'];
  //     email = data.data()!['email'];
  //   });
  // }

//   // late SharedPreferences prefs;

//   /// get bookmarkPage from sharedPreferences
//   // getLastViewedPage() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   if (prefs.containsKey(LAST_VIEWED_PAGE)) {
//   //     var _lastViewedPage = prefs.getInt(LAST_VIEWED_PAGE);
//   //     setState(() {
//   //       int? lastViewedPage = _lastViewedPage;
//   //     });
//   //   }
//   // }

  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // void signout() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     print("user logout");
  //   } catch (e) {
  //     print(e);
  //   }
  //   // await _prefService.removeCache("password").whenComplete(() {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  //   // }
  //   // );
  // }

//   @override
//   Widget build(BuildContext context) {
    // Future<bool> showExitPopup() async {
    //   return await showDialog(
    //         //show confirm dialogue
    //         //the return value will be from "Yes" or "No" options
    //         context: context,
    //         builder: (context) => AlertDialog(
    //           backgroundColor: Color.fromARGB(255, 247, 208, 90),
    //           title: Text('القرآن الكريم',
    //           style: TextStyle(
    //             fontWeight: FontWeight.w900,
    //           ),
    //           ),
    //           content: Text('Do you want to exit القرآن الكريم?'),
    //           actions: [
    //             ElevatedButton(
    //               onPressed: () => Navigator.of(context).pop(false),
    //               style: ElevatedButton.styleFrom(
    //                 primary: Color.fromARGB(255, 4, 56, 100),
    //               ),
    //               //return false when click on "NO"
    //               child: Text('No'),
    //             ),
    //             ElevatedButton(
    //               onPressed: () => Navigator.of(context).pop(true),
    //               style: ElevatedButton.styleFrom(
    //                 primary: Color.fromARGB(255, 4, 56, 100),
    //               ),
    //               //return true when click on "Yes"
    //               child: Text('Yes'),
    //             ),
    //           ],
    //         ),
    //       ) ??
    //       false; //if showDialouge had returned null, then return false
    // }

    // return WillPopScope(

    //     // ScaffoldMessenger.of(context).showSnackBar(
    //     //     SnackBar(content: Text('Please First login to enter the app')));
    //     onWillPop: showExitPopup,
    //     child: Scaffold(
//             appBar: AppBar(
//               title: const Text(
//                 "القرآن الكريم",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               backgroundColor: const Color.fromARGB(255, 4, 56, 100),
//               // actions: <Widget>[
//               //   IconButton(
//               //     icon: const Icon(Icons.navigate_next),
//               //     onPressed: () {
//               //       Navigator.push(
//               //           context,
//               //           MaterialPageRoute(
//               //               builder: (BuildContext context) =>
//               //                   getLastViewedPage()));
//               //       // _pdfController.nextPage(
//               //       //   curve: Curves.ease,
//               //       //   duration: const Duration(milliseconds: 100),
//               //       // );
//               //     },
//               //   ),
//               // ],
//             ),
//             drawer: Drawer(
//               width: 250,
//               child: ListView(
//                 children: [
//                   UserAccountsDrawerHeader(
//                     decoration: const BoxDecoration(
//                       color: Color.fromARGB(255, 5, 70, 123),
//                       // color: Color.fromRGBO(0, 136, 204, 100),
//                     ),
//                     accountName: Text(full_name),
//                     accountEmail: Text(email),
//                     currentAccountPicture: const CircleAvatar(
//                       backgroundImage: AssetImage("images/logo1.png"),
//                       backgroundColor: Colors.transparent,
//                     ),
//                     // onDetailsPressed: () {},
//                   ),
//                   const ListTile(
//                     leading: Icon(Icons.feedback),
//                     title: Text("Feedback"),
//                   ),
//                   const ListTile(
//                       leading: Icon(Icons.people), title: Text("Share")),
//                   const ListTile(
//                       leading: Icon(Icons.policy),
//                       title: Text("Privacy Policy")),
//                   const ListTile(
//                       leading: Icon(Icons.rate_review_outlined), title: Text("Rate us")),
//                   GestureDetector(
//                       onTap: () {
//                         signout();
//                       },
//                       child: ListTile(
//                         leading: Icon(Icons.logout),
//                         title: Text("Logout"),
//                       )),
//                   const Divider(
//                     height: 40,
//                     thickness: 2.0,
//                   ),
//                 ],
//               ),
//             ),
//             body: Quran_api()
//             // SingleChildScrollView(
//             //     child: Topstories(),
//             //     Column(
//             //   children: [
//             //     chat("Surah Fatiha", "verses  7", "سُوْرَۃُ الفَاتِحَة"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Bakarakh", "verses  286", "سُوْرَۃُ البَقَرَة"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Alay Imran", "verses  200", "سُوْرَۃ آلِ عِمْرَان"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Nisa", "verses  176", "سُوْرَۃُ النِّسَاء"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Maidah", "verses  120", "سُوْرَۃُ المَائِدَة"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Anam", "verses  165", "سُوْرَۃُ الأَنْعَام"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah A’araf", "verses  206", "سُوْرَۃُ الأَعْرَاف"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Anfal", "verses  75", "سُوْرَۃُ الأَنْفَال"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Toba	", "verses  129", "سُوْرَۃُ التَّوْبَة"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Younas	", "verses  109", "سُوْرَۃ يُونُس"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Hud	", "verses  123", "سُوْرَۃ هُود"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //     chat("Surah Yousaf	", "verses  111", "سُوْرَۃ يُوسُف"),
//             //     const Divider(
//             //       height: 5,
//             //     ),
//             //   ],
//             //
//             // )
//             ));
//     // );
//   }
// }

// // Widget chat(name, text, time) {
// //   return GestureDetector(
// //     onTap: () {
// //                     print("hello");
// //                   },
// //     child:
// // ListTile(
// //   leading: CircleAvatar(
// //     radius: 20,
// //     backgroundColor: Colors.transparent,
// //     backgroundImage: AssetImage('images/quran.png'),
// //     child: ClipOval(
// //       child:Text("1")
// //       //  Image.asset(
// //       //   'images/quran.png',
// //       //   fit: BoxFit.fill,
// //       // ),
// //     ),
// //   ),
// //   title: Text(
// //     name,
// //     style: const TextStyle(fontSize: 20),
// //   ),
// //   subtitle: Text(text),
// //   trailing: Column(
// //     mainAxisAlignment: MainAxisAlignment.spaceAround,
// //     children: [
// //       Text(
// //         time,
// //         style: const TextStyle(fontSize: 20),
// //       ),
// //     ],
// //   ),
// // ));
// // }

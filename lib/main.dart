import 'package:flutter/material.dart';
import 'package:quranapp/checkuser.dart';
// import 'package:hungryman/Home1.dart';
import 'package:quranapp/login.dart';
import 'package:quranapp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
// import 'package:quranapp/splash_view.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    //  MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => MyProvider()),
    //   ], 
    // child: 
    FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: const Text("something went wrong"),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            // initialRoute: SplashRoute,
            // routes: routes,
            
              debugShowCheckedModeBanner: false,
                  // theme: new ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 4, 56, 100)),
              title: 'Quran App',
              home: userprofile());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    // )
     );
  }
}

// class Form extends StatefulWidget {
//   // const Form
//   //
//   //
//   //
//   //
//   //({ Key? key }) : super(key: key);
// //
//   @override
//   _FormState createState() => _FormState();
// }

// class _FormState extends State<Form> {
//   late bool _loadingInProgress;

//   @override
//   void initState() {
//     super.initState();
//     _loadingInProgress = true;
//     _loadData();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
      
//         body:

//             // Image.asset('images/gwgold.png'),
//             Container(
//       decoration: const BoxDecoration(
//         // color: Colors.white,
//         image: DecorationImage(
//           image:  AssetImage("images/bg.jpg"),
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: ListView(
//           children: [
//             Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "HUNGRY MAN",
//                   style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.amber[800],
//                       fontWeight: FontWeight.w700),
//                 )

//                 // Title(color: Colors.white, child: Text("WELCOME")),
//                 ),
//             Container(
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "you enjoy your meal.",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.amber,
//                   ),
//                 )

//                 // Title(color: Colors.white, child: Text("WELCOME")),
//                 ),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     Navigator.push(
//             //         context, MaterialPageRoute(builder: (context) => Login()));
//             //   },
//             //   child: Text("button")),
//             Container(
//               padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//               child: Image.asset(
//                 'images/logohm.png',
//                 width: 100,
//                 height: 150,
//               ),
//             ),

//             _buildBody(),
            
//             Container(
//               // height: 50,
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Colors.amber[800]),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Signup()));
//                   },
//                   child: const Text("signup")),
//             ),
            
//           ],
//         ),
//       ),
//     ));
//   }

//   Widget _buildBody() {
//     if (_loadingInProgress) {
//       return new Center(
//         child: new CircularProgressIndicator(
//           backgroundColor: Colors.amber[800],
//           valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
//           strokeWidth: 10,
//         ),
//       );
//     } else {
//       return new Container(
//           padding: const EdgeInsets.fromLTRB(10, 40, 10, 30),
//           child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.amber[800],
//               ),
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Login()));
//               },
//               child: const Text("login")));
//     }
//   }

//   Future _loadData() async {
//     await new Future.delayed(const Duration(seconds: 5));
//     _dataLoaded();
//   }

//   void _dataLoaded() {
//     setState(() {
//       _loadingInProgress = false;
//     });
//   }
// }


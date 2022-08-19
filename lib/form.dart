// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quranapp/login.dart';
import 'package:quranapp/pdf.dart';
import 'package:quranapp/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';


class User_Form extends StatefulWidget {
  const User_Form({Key? key}) : super(key: key);

  @override
  State<User_Form> createState() => _User_FormState();
}

class _User_FormState extends State<User_Form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body:

            // Image.asset('images/gwgold.png'),
            Container(
      decoration: BoxDecoration(
        color: Colors.white,
         image: DecorationImage(
        image: AssetImage("images/1.jpg"),
           opacity: 15,
           fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Image.asset(
                'images/logo1.png',
                width: 100,
                height: 150,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "القرآن الكريم",
                  style: TextStyle(
                      fontSize: 40,
                      color:Color.fromARGB(255, 227, 204, 167),
                      fontWeight: FontWeight.w700),
                )

                // Title(color: Colors.white, child: Text("WELCOME")),
                ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  
                  "Recite the Quran slowly with good recitation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    
                    fontSize: 20,
                    color: Color.fromARGB(220, 227, 204, 167),
                  ),
                )

                // Title(color: Colors.white, child: Text("WELCOME")),
                ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Login()));
            //   },
            //   child: Text("button")),
            

            Container(
              // height: 50,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 4, 56, 100)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("Login")),
            ),
            
            Container(
              // height: 50,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 4, 56, 100)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Text("Signup")),
            ),
             Container(
              // height: 50,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 4, 56, 100)),
                  
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const pdf(Surah_number:4)));
                        Fluttertoast.showToast(
                        msg: "Login/SignUp for complete app features");
                  },
                  child: Text("Continue Without An Account")),
            )
            
          ],
        ),
      ),
    ));
  }
}
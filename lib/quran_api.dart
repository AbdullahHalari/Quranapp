// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Quran_api extends StatefulWidget {
  const Quran_api({Key? key}) : super(key: key);

  @override
  State<Quran_api> createState() => _Quran_apiState();
}

class _Quran_apiState extends State<Quran_api> {
  // getuser() async {
  final topUrl = "https://raw.githubusercontent.com/AbdullahHalari/Quran_api/master/surah_api.json";

  Future<List<usermodel>> getArticle() async {
    Response res = await get(Uri.parse(topUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['data'];

      List<usermodel> articles =
          body.map((dynamic item) => usermodel.fromJson(item)).toList();
      print(articles);
      return articles;
    } else {
      throw ("Not Found");
    }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getArticle(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else
                // ignore: curly_braces_in_flow_control_structures

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: CircleAvatar(
                        // radius: 20,
                        backgroundColor: Color.fromARGB(255, 4, 56, 100),
                        // backgroundImage: AssetImage('images/quran.png'),
                        child: ClipOval(
                            child: Text(
                          snapshot.data[i].number.toString() != null
                              ? snapshot.data[i].number.toString()
                              : '00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15.0,
                          ),
                        )
                            //  Image.asset(
                            //   'images/quran.png',
                            //   fit: BoxFit.fill,
                            // ),
                            ),
                      ),
                      title: Text(
                        snapshot.data[i].name != null
                            ? snapshot.data[i].name
                            : 'سُوْرَۃُ...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                      ),
                      subtitle: Text(
                        
                                    snapshot.data[i].englishNameTranslation !=
                                null
                            ? snapshot.data[i].englishNameTranslation
                            : 'Not Found',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                      ),
                      // trailing:
                      trailing:  Text(
                          "verses: ${snapshot.data[i].numberOfAyahs.toString() != null
                              ? snapshot.data[i].numberOfAyahs.toString()
                              : '00'}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        
                      ),
                    );
                  },
                );
            }));
  }
}

class usermodel {
  String name;
  String englishNameTranslation;
  int number;
  int numberOfAyahs;

  usermodel({
    required this.name,
    required this.englishNameTranslation,
    required this.number,
    required this.numberOfAyahs,
  });
  factory usermodel.fromJson(Map<String, dynamic> json) {
    return usermodel(
      name: json['name'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      number: json['number'],
      numberOfAyahs: json['numberOfAyahs'],
    );
  }
}

// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:quranapp/ayat.dart';
import 'package:quranapp/reset.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class Quran_api extends StatefulWidget {
  const Quran_api({Key? key}) : super(key: key);

  @override
  State<Quran_api> createState() => _Quran_apiState();
}

class _Quran_apiState extends State<Quran_api> {
  // getuser() async {
  final topUrl =
      "https://raw.githubusercontent.com/AbdullahHalari/Quran_api/master/quran2.json";
  // final nexturl =
  //     "https://quranenc.com/api/v1/translation/sura/urdu_junagarhi/2";
  // late PDFDocument document;

  Future<List<usermodel>> getArticle() async {
    Response res = await get(Uri.parse(topUrl));
    // Response res1 = await get(Uri.parse(nexturl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      // Map<String, dynamic> json1 = jsonDecode(res1.body);

      List<dynamic>body = json['data'];
      // List<dynamic> body1 = json1['results'];

      List<usermodel> articles =
          body.map((dynamic item) => usermodel.fromJson(item)).toList();
      // List<Result> articles1 =
      //     body1.map((dynamic item) => Result.fromJson(item)).toList();

      // print(articles1);
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
                    return InkWell(
                        // onTap: () {
                        //   document = PDFDocument.fromURL(snapshot.data[i].pdf != null
                        //           ? snapshot.data[i].pdf
                        //           : 'wait..',) as PDFDocument;
                        // },
                        child: ListTile(
                            leading: CircleAvatar(
                              // radius: 20,
                              // backgroundColor: Color.fromARGB(255, 4, 56, 100),
                              backgroundImage: AssetImage('images/1.png'),
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
                              snapshot.data[i].englishName != null
                                  ? snapshot.data[i].englishName
                                  : 'wait..',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data[i].englishNameTranslation != null
                                  ? snapshot.data[i].englishNameTranslation
                                  : 'Not Found',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing:
                                // Padding(
                                //   padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                // child:
                                Container(
                              width: 90,
                              child: Text(
                                snapshot.data[i].name != null
                                    ? snapshot.data[i].name
                                    : 'سُوْرَۃُ...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  // ),
                                ),
                              ),
                            )));
                  },
                );
            }));
  }
}

class usermodel {
  // Ayahs ayahs;
  String name;
  String englishNameTranslation;
  String englishName;
  int number;
  String pdf;
  // int numberOfAyahs;

  usermodel({
    // required this.ayahs,
    required this.name,
    required this.englishNameTranslation,
    required this.number,
    required this.englishName,
    required this.pdf,
    // required this.numberOfAyahs,
  });
  factory usermodel.fromJson(Map<String, dynamic> json) {
    return usermodel(
      // ayahs: Ayahs.fromJson(json['ayahs']),
      name: json['name'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      englishName: json['englishName'] as String,
      number: json['number'],
      pdf: json['pdf']
    );
  }
}

class Result {
  String id;
  String sura;
  String aya;
  String arabicText;
  String translation;
  String footnotes;

  Result(
      {required this.id,
      required this.sura,
      required this.aya,
      required this.arabicText,
      required this.translation,
      required this.footnotes});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      sura: json['sura'],
      aya: json['aya'],
      arabicText: json['arabic_text'],
      translation: json['translation'],
      footnotes: json['footnotes'],
    );
  }
}

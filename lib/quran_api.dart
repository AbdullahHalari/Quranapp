// ignore_for_file: curly_braces_in_flow_control_structures, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:quranapp/SurahViewBuilder.dart';
import 'package:quranapp/ayat.dart';
import 'package:quranapp/login.dart';
import 'package:quranapp/main.dart';
import 'package:quranapp/pdf.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import 'package:quranapp/ayat.dart';
import 'package:quranapp/reset.dart';

class Quran_api extends StatefulWidget {
  const Quran_api({Key? key}) : super(key: key);

  @override
  State<Quran_api> createState() => _Quran_apiState();
}

class _Quran_apiState extends State<Quran_api> {
  // getuser() async {
  final topUrl = "images/quran2.json";
  // final nexturl =
  //     "https://quranenc.com/api/v1/translation/sura/urdu_junagarhi/2";
  // late PDFDocument document;

  Future<List<usermodel>> getArticle() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("images/quran2.json");
    // Response res1 = await get(Uri.parse(nexturl));

    Map<String, dynamic> json = jsonDecode(res);
    // Map<String, dynamic> json1 = jsonDecode(res1.body);

    List<dynamic> body = json['data'];
    // List<dynamic> body1 = json1['results'];

    List<usermodel> articles =
        body.map((dynamic item) => usermodel.fromJson(item)).toList();
    // List<Result> articles1 =
    //     body1.map((dynamic item) => Result.fromJson(item)).toList();

    // print(articles1);
    // print(articles);
    return articles;

    // }
  }

  //  late PdfViewerController _pdfViewerController;

  // @override
  // void initState() {
  //   _pdfViewerController = PdfViewerController();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getArticle(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: new CircularProgressIndicator(
                      backgroundColor: Color.fromARGB(255, 6, 23, 153),
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                      strokeWidth: 8,
                    ),
                  ),
                );
              } else
                // ignore: curly_braces_in_flow_control_structures

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    // Myy()
                                    pdf(Surah_number: snapshot.data[i].page)
                                // SurahViewBuilder(pages: snapshot.data[i].number)
                                ),
                          );
                        },
                        child: ListTile(
                            leading: CircleAvatar(
                              // radius: 20,
                              backgroundColor: Colors.transparent,
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
                                color: Color.fromARGB(255, 77, 72, 72),
                                fontSize: 15.0,
                                // ),
                              ),
                            ),
                            trailing:
                                // Padding(
                                //   padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                // child:
                                Container(
                              width: 100,
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: snapshot.data[i].name != null
                                          ? snapshot.data[i].name
                                          : 'سُوْرَۃُ...',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        // ),
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            "\n (Page no: ${snapshot.data[i].page.toString() != null ? snapshot.data[i].page.toString() : 'Not Found'})",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 59, 67, 74))),
                                  ],
                                ),
                              ),
                              // Text(
                              // snapshot.data[i].name != null
                              //     ? snapshot.data[i].name
                              //     : 'سُوْرَۃُ...',
                              // style: TextStyle(
                              //   fontWeight: FontWeight.bold,
                              //   color: Colors.black,
                              //   fontSize: 17.0,
                              //   // ),
                              // ),
                              // ),
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
  int page;

  usermodel({
    // required this.ayahs,
    required this.name,
    required this.englishNameTranslation,
    required this.number,
    required this.englishName,
    required this.page,
  });
  factory usermodel.fromJson(Map<String, dynamic> json) {
    return usermodel(
      // ayahs: Ayahs.fromJson(json['ayahs']),
      name: json['name'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      englishName: json['englishName'] as String,
      number: json['number'],
      page: json['page'],
    );
  }
}

// class Result {
//   String id;
//   String sura;
//   String aya;
//   String arabicText;
//   String translation;
//   String footnotes;

//   Result(
//       {required this.id,
//       required this.sura,
//       required this.aya,
//       required this.arabicText,
//       required this.translation,
//       required this.footnotes});

//   factory Result.fromJson(Map<String, dynamic> json) {
//     return Result(
//       id: json['id'],
//       sura: json['sura'],
//       aya: json['aya'],
//       arabicText: json['arabic_text'],
//       translation: json['translation'],
//       footnotes: json['footnotes'],
//     );
//   }
// }

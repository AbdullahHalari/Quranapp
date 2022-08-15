// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Ayat extends StatefulWidget {
  const Ayat({Key? key}) : super(key: key);

  @override
  State<Ayat> createState() => _AyatState();
}

class _AyatState extends State<Ayat> {
  final topUrl =
      "https://raw.githubusercontent.com/AbdullahHalari/Quran_api/master/quran2.json";
  // final nexturl =
  //     "https://quranenc.com/api/v1/translation/sura/urdu_junagarhi/2";

  Future<List<Ayahs>> getArticle() async {
    Response res = await get(Uri.parse(topUrl));
    // Response res1 = await get(Uri.parse(nexturl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      // Map<String, dynamic> json1 = jsonDecode(res1.body);

      List<dynamic> body = json['data'];
      // List<dynamic> body1 = json1['results'];

      List<Ayahs> articles =
          body.map((dynamic item) => Ayahs.fromJson(item)).toList();
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
                  child: Center(child:new CircularProgressIndicator(
                              backgroundColor: Color.fromARGB(255, 6, 23, 153),
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(Colors.red),
                              strokeWidth: 8,
                            ),),
                );
              } else
                // ignore: curly_braces_in_flow_control_structures

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                 
                    
                    return
                    
                    Column(
                        children: [
                             Align(
                              alignment: Alignment.centerRight,
                               child: Container(
                               child:   Text(
                                                           snapshot.data[i].text != null
                                    ? snapshot.data[i].text
                                    : 'wait..',
                                                            // textAlign: TextAlign.right,
                                                           style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                                           ),
                                                         
                               )),
                             ),
                        ],

                    );
                  },
                );
            }));
  }
}

class Ayahs {
  // int number;
  String text;
  // int numberInSurah;
  // int juz;
  // int manzil;
  // int page;
  // int ruku;
  // int hizbQuarter;
  // bool sajda;

  Ayahs({
    // required this.number,
    required this.text,
    // required this.numberInSurah,
    // required this.juz,
    // required this.manzil,
    // required this.page,
    // required this.ruku,
    // required this.hizbQuarter,
    // required this.sajda
  });

  factory Ayahs.fromJson(Map<String, dynamic> json) {
    return Ayahs(
      // number: json['number'],
      text: json['pdf'],
      // numberInSurah: json['numberInSurah'],
      // juz: json['juz'],
      // manzil: json['manzil'],
      // page: json['page'],
      // ruku: json['ruku'],
      // hizbQuarter: json['hizbQuarter'],
      // sajda: json['sajda'],
    );
  }
}

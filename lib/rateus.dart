import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';

class Rateus extends StatefulWidget {
  const Rateus({Key? key}) : super(key: key);

  @override
  _RateusState createState() => _RateusState();
}

class _RateusState extends State<Rateus> {

  final _dialog = RatingDialog(
   
    title: Text('Your opinion matters to us!',
    textAlign:TextAlign.center,
     style: TextStyle(
      fontSize: 25
    ),),
    
    message:
    Text('Rate your experience using القرآن الكريم app so far',
    textAlign:TextAlign.center,
    style: TextStyle(
      fontSize: 15,
      color: Colors.grey
    ),),
    starSize: 30,
    
    image: Image.asset("images/logo1.png",width :90,height: 90,),
    submitButtonText: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      
      if (response.rating < 3.0) {
       //login build remaing
      } else {
        
        StoreRedirect.redirect(androidAppId: 'com.example.quranapp',iOSAppId: 'com.example.quranapp');
      }
    }, 
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Rate Us",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 232, 232, 232),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child:_dialog
      )
    );
  }
}
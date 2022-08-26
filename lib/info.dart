// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 5, 70, 123)),
        title: const Text(
          "Information About Quran",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 5, 70, 123),
          ),
        ),),
        
        body:  SingleChildScrollView(
    child:
         Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("The Holy Quran has 114 surahs & The Holy Quran has 30 parts    ",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),
    
    
    
    Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("The revelation started in the Holy month of Ramadan    ",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),





    Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("Quran was revealed over 23 years: 13 in Mecca and 10 in Madina",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),




    Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("Whoever reads one letter of the Quran gets 10 Rewards",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),




    Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("Baqarah is the longest sura but Kawthar is the shortest sura",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),


    Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("Quran was revealed to Prophet Muhammad (PBUH) through the angel Jibril",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("Prophet (PBUH) was 40 years old when the first verse of Quran was revealed to Him",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("The literal meaning of Quran is “that which is being read”",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),



    Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("25 Prophets are mentioned in the Holy Quran",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),
    Padding(padding: EdgeInsets.all(8), 
              child:
              
               Row(
 
      children: <Widget>[
        
        Padding
        (
          padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
         child: Icon(Icons.info),),
        Expanded(
          child: Text("The Quran will intercede for people who recited it on Judgment Day",
          style: TextStyle(
            fontSize: 20
          ),
          ),
        ),
      ],
    ),),
    Divider(
      height: 5,
      thickness: 1,
      
    ),

    ],),
            
        ),
        
     ) 
        );
    
    
    
   
  }
}
 
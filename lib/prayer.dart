// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';


class Prayertime extends StatefulWidget {
  const Prayertime({Key? key}) : super(key: key);

  @override
  State<Prayertime> createState() => _PrayertimeState();
}

class _PrayertimeState extends State<Prayertime> {
  @override
  adhan() {
     final myCoordinates = Coordinates(24.8614622,
        67.00993879999999); // Replace with your own location lat, lng.

    final params = CalculationMethod.singapore.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    var _format = HijriCalendar.now();
  print(_format.fullDate()); //Thulatha, Ramadan 14, 1439 h
  print(_format.toFormat("mm dd yy")); //09 14 39
  var date = DateTime.now();
  var formatterDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
  var formatterTime = DateFormat('H:mm:ss').format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 5, 70, 123)),
          title: const Text(
            "Prayer Timing",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 5, 70, 123),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child:
        SafeArea(
          
        child: Column(
          children: [
                      // SizedBox(height: 15,),
           
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 24, 111, 181),

                               border: Border.all(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 3,
              ), //Border.all
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 5, 100, 226),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ), //Offset
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
                            ),
                            // margin:EdgeInsets.fromLTRB(0, 0, 0, 20),
                      
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    // Padding(
                                    //   padding: EdgeInsets.all(15),
                                    //   child: Image.asset(
                                    //     'images/icon2.png',
                                    //     width: 40,
                                    //     height: 40,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                   
                                       Padding(
                                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                         child: Text(
                                          textAlign:TextAlign.center,
                                            _format.fullDate().toString(),
                                            style: TextStyle(
                                                fontSize: 25.0, color: Colors.white,
                                                fontWeight:FontWeight.bold
                                                ),
                                                
                                          ),
                                       ),
                                     Padding(
                                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                         child: Text(
                                            formatterDate,
                                            style: TextStyle(
                                                fontSize: 20.0, color: Color.fromARGB(255, 255, 255, 255)),
                                          ),
                                       ),
                                    
                                  ]),
                            )),
                      ),
                     
                    

//  SizedBox(height: 15,),

        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
        child: Card(
          
          elevation: 8,
          child: ListTile(
            leading: Image.asset("images/icon8.png",width: 40,height: 40,color: Color.fromARGB(255, 5, 70, 123),),
            title: Text('Fajr ',
            style: TextStyle(
              fontSize: 30
            ),
            ),        
           
            trailing: Text(DateFormat.jm().format(prayerTimes.fajr),style: TextStyle(
              fontSize: 30
            ),),
          ),
        ), ),
        

         Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
        child: Card(
          
          elevation: 8,
          child: ListTile(
            leading: Image.asset("images/icon8.png",width: 40,height: 40,color: Color.fromARGB(255, 5, 70, 123),),
            title: Text('Sunrise',
            style: TextStyle(
              fontSize: 30
            ),
            ),        
           
            trailing: Text(DateFormat.jm().format(prayerTimes.sunrise),style: TextStyle(
              fontSize: 30
            ),),
          ),
        ), ),

         Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
        child: Card(
          
          elevation: 8,
          child: ListTile(
            leading: Image.asset("images/icon8.png",width: 40,height: 40,color: Color.fromARGB(255, 5, 70, 123),),
            title: Text('Dhuhr ',
            style: TextStyle(
              fontSize: 30
            ),
            ),        
           
            trailing: Text(DateFormat.jm().format(prayerTimes.dhuhr),style: TextStyle(
              fontSize: 30
            ),),
          ),
        ), ),

         Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
        child: Card(
          
          elevation: 8,
          child: ListTile(
            leading: Image.asset("images/icon8.png",width: 40,height: 40,color: Color.fromARGB(255, 5, 70, 123),),
            title: Text('Asr',
            style: TextStyle(
              fontSize: 30
            ),
            ),        
           
            trailing: Text(DateFormat.jm().format(prayerTimes.asr),style: TextStyle(
              fontSize: 30
            ),),
          ),
        ), ),

         Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
        child: Card(
          
          elevation: 8,
          child: ListTile(
            leading: Image.asset("images/icon8.png",width: 40,height: 40,color: Color.fromARGB(255, 5, 70, 123),),
            title: Text('Maghrib ',
            style: TextStyle(
              fontSize: 30
            ),
            ),        
           
            trailing: Text(DateFormat.jm().format(prayerTimes.maghrib),style: TextStyle(
              fontSize: 30
            ),),
          ),
        ), ),

         Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
        child: Card(
          
          elevation: 8,
          child: ListTile(
            leading: Image.asset("images/icon8.png",width: 40,height: 40,color: Color.fromARGB(255, 5, 70, 123),),
            title: Text('Isha ',
            style: TextStyle(
              fontSize: 30
            ),
            ),        
           
            trailing: Text(DateFormat.jm().format(prayerTimes.isha),style: TextStyle(
              fontSize: 30
            ),),
          ),
        ), ),

      
        
        
         ],
        )
      ),






        
        )
    //   Row(  
    //     children: [  
    //        Expanded(
    //       child: SizedBox(
    //         height: 200.0,
    //         child:   
    //    ListView(
    //       children: [
        
   
            
    // ListTile(
    //   title: Text("bjgjhg"),
    //   trailing: Text(
    //       "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---"),
    // ),
    // // print(
    // //     "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");

    // ListTile(
    //   title: Text("bjgjhg"),
    //   trailing: Text(DateFormat.jm().format(prayerTimes.fajr)),
    // ),
    // ListTile(
    //   title: Text("bjgjhg"),
    //   trailing: Text(DateFormat.jm().format(prayerTimes.fajr)),
    // ),
    // // print(DateFormat.jm().format(prayerTimes.fajr));
    // // print(DateFormat.jm().format(prayerTimes.sunrise));
    // // print(DateFormat.jm().format(prayerTimes.dhuhr));
    // // print(DateFormat.jm().format(prayerTimes.asr));
    // // print(DateFormat.jm().format(prayerTimes.maghrib));
    // // print(DateFormat.jm().format(prayerTimes.isha));

    // // Custom Timezone Usage. (Most of you won't need this).
          
    //       ],
    //   )))])
    );
   
  }

  Widget build(BuildContext context) {
    return adhan();
  }
}

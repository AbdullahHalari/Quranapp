import 'package:flutter/material.dart';

class Need extends StatefulWidget {
  const Need({Key? key}) : super(key: key);

  @override
  State<Need> createState() => _NeedState();
}

class _NeedState extends State<Need> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      home: DefaultTabController(  
        length: 2,  
        child:
    
     Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 5, 70, 123)),
        title: const Text(
          "Need to Know",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 5, 70, 123),
          ),
        ),
        bottom: TabBar(
          labelColor: Color.fromARGB(255, 5, 70, 123),
          tabs: [
            Tab(text: "URDU"),
            Tab(text: "ENGLISH")
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Container(
            child: Image.asset("images/nu.jpg"),
          ),
          Container(
            child: Image.asset("images/ne.jpg"),
          )
        ],
      ),
     ))
    );
  }
}

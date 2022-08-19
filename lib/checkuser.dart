import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/drawer.dart';
import 'package:quranapp/home.dart';
import 'package:quranapp/login.dart';
import 'package:quranapp/drawer.dart';
import 'package:quranapp/form.dart';


Widget userprofile() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
   return Home();
    //signed out
  } else {
    return User_Form();
    //signed in
  }
}
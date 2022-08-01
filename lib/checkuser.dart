import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/home.dart';
import 'package:quranapp/login.dart';
import 'package:quranapp/home.dart';

Widget userprofile() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
   return Home();
    //signed out
  } else {
    return Login();
    //signed in
  }
}
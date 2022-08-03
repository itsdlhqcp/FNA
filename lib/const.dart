import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efotballactseller_app/views/screens/cart_screens.dart';
import 'package:efotballactseller_app/views/screens/feeds_screens.dart';
import 'package:efotballactseller_app/views/screens/home_screens.dart';
import 'package:efotballactseller_app/views/screens/profile_screen.dart';
import 'package:efotballactseller_app/views/screens/search_screen.dart';
import 'package:efotballactseller_app/views/screens/upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

var backgroundColor = Colors.black;
var buttonColor = Colors.red[400];


Color kblue = Color(0xFF4756DF);
Color kwhite = Color(0xFFFFFFFF);
Color kblack = Color(0xFF000000);
Color kbrown300 = Color(0xFF8D6E63);
Color kbrown = Color(0xFF795548);
Color kgrey = Color(0xFFC0C0C0);

//FIREBASE

var firebaseAuth = FirebaseAuth.instance;

var firebaseStore = FirebaseFirestore.instance;

var firebaseStorage = FirebaseStorage.instance;

//pages

List pages = [
  HomeScreen(),
  FeedsScreen(),
  SearchScreen(),
  CartScreen(),
  UploadProductForm(),
  ProfileScreen(),
];

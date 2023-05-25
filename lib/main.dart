import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';
import 'package:flutter_chatt_app/home_screen.dart';
import 'package:flutter_chatt_app/signin_or_login.dart';
import 'package:flutter_chatt_app/welcomescreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null
        ? WelcomeScreen()
        : HomeScreen();
  }
}

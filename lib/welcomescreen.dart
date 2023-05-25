import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';
import 'package:flutter_chatt_app/signin_or_login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Timer timer;
  double opacity = 0;
  double opacity2 = 0;
  late Timer timer2;
  @override
  void initState() {
    timer = Timer(Duration(seconds: 1), () {
      opacity = 1;

      setState(() {});
    });
    timer2 = Timer(Duration(seconds: 2), () {
      opacity2 = 1;
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Spacer(),
        Image.asset(AssetsConstant.welcomeImage),
        SizedBox(height: 30),
        AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: opacity,
          child: Text(
            "Welcome to our freedom \n messaging app",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(height: 20),
        AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: opacity2,
          child: Text(
            "Freedom talk any person of your\n mother launges",
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 200),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Signin_or_Login();
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Skip",
                style: TextStyle(fontSize: 17),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16,
              )
            ],
          ),
        ),
      ]),
    );
  }
}

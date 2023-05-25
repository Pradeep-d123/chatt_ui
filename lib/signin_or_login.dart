import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';
import 'package:flutter_chatt_app/home_screen.dart';
import 'package:flutter_chatt_app/signin.dart';
import 'package:flutter_chatt_app/singup.dart';

class Signin_or_Login extends StatelessWidget {
  const Signin_or_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(AssetsConstant.logoImage),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignIn();
            }));
          },
          child: Container(
            height: 40,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.green),
            child: Center(
                child: Text("Signin",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Colors.white))),
          ),
        ),
        SizedBox(height: 18),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignUp();
            }));
          },
          child: Container(
            height: 40,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.orange),
            child: Center(
                child: Text("Signup",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Colors.white))),
          ),
        )
      ]),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';
import 'package:flutter_chatt_app/forgotpasswordscreen.dart';
import 'package:flutter_chatt_app/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsConstant.logoImage),
              Text("Email Id"),
              TextField(
                controller: emailidController,
                decoration: InputDecoration(focusedBorder: InputBorder.none),
              ),
              SizedBox(height: 30),
              Text("Password"),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(focusedBorder: InputBorder.none),
              ),
              SizedBox(height: 50),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (emailidController.text.endsWith("@gmail.com") &&
                        passwordController.text.trim().length > 8) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: emailidController.text,
                                password: passwordController.text);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter Correct feild")));
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Signin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ForgotPassword();
                        }));
                      },
                      child: Text("Forgot Password ?")))
            ],
          ),
        ),
      ),
    );
  }
}

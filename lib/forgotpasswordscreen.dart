import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailidController = TextEditingController();
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
              SizedBox(height: 100),
              Center(
                child: InkWell(
                  onTap: () {
                    if (emailidController.text.endsWith("@gmail.com")) {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailidController.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "link has been sent to your email for password reset")));
                        Navigator.pop(context);
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter correct Email id")));
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                    child: Center(
                        child: Text(
                      "Reset password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

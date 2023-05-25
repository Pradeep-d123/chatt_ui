import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';
import 'package:flutter_chatt_app/home_screen.dart';
import 'package:flutter_chatt_app/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsConstant.logoImage,
              ),
              Transform.translate(
                offset: Offset(0, -40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    Container(
                      height: 30,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Email Id"),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          hintText: "Please Enter Email Id"),
                    ),
                    SizedBox(height: 20),
                    Text("Phone Number"),
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          hintText: "Please Enter Phone Number"),
                    ),
                    SizedBox(height: 20),
                    Text("Password"),
                    Container(
                      height: 30,
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Confirm Password"),
                    Container(
                      height: 30,
                      child: TextField(
                        controller: confirmController,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          if (emailController.text.endsWith("gmail.com") &&
                              phoneController.text.length == 10 &&
                              passwordController.text.trim().length > 8 &&
                              passwordController.text ==
                                  confirmController.text) {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                              userCredential.user
                                  ?.updateDisplayName(nameController.text);
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(emailController.text)
                                  .set({
                                "name": nameController.text,
                                "image": "",
                                "email": emailController.text,
                                "phone": phoneController.text
                              });
                              FirebaseFirestore.instance
                                  .collection("chatts")
                                  .doc(emailController.text)
                                  .set({"email": emailController.text});
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              "Please enter correct feild",
                              style: TextStyle(color: Colors.red),
                            )));
                          }
                        },
                        child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text("Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.white,
                                    )))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignIn();
                            }));
                          },
                          child: Text("Already have a account?")),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

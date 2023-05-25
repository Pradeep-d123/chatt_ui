import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/singup.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.amber),
                ),
                Positioned(
                  bottom: 0,
                  right: -10,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 28,
                      )),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(FirebaseAuth.instance.currentUser?.displayName ?? "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return SignUp();
                  }), (route) => false);
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}

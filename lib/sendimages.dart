import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SendImages extends StatelessWidget {
  const SendImages({super.key, required this.imagepath});
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(File(imagepath)),
          SizedBox(height: 150),
          InkWell(
            onTap: () {
            
            },
            child: Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.green),
              child: Center(
                child: Text(
                  "Send",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

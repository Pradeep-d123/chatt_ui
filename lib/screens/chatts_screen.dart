import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter_chatt_app/chats.dart';

class ChattsScreen extends StatefulWidget {
  const ChattsScreen({super.key, this.email});
  final String? email;

  @override
  State<ChattsScreen> createState() => _ChattsScreenState();
}

class _ChattsScreenState extends State<ChattsScreen> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: ((context, index) {
          return Chat(
              image: "",
              name: "",
              time: DateTime.now(),
              email: widget.email ?? "");
        }));
  }
}

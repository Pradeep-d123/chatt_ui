import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/sendimages.dart';
import 'package:image_picker/image_picker.dart';

class Message_Typing_Feild extends StatefulWidget {
  final void Function(String) onsend;
  const Message_Typing_Feild({super.key, required this.onsend});

  @override
  State<Message_Typing_Feild> createState() => _Message_Typing_FeildState();
}

class _Message_Typing_FeildState extends State<Message_Typing_Feild> {
  TextEditingController sendmessageController = TextEditingController();
  final imagepiker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.emoji_emotions_outlined)),
                  Expanded(
                      child: TextField(
                          controller: sendmessageController,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              hintText: "Message"))),
                  IconButton(
                      onPressed: () async {
                        final file = await imagepiker.pickImage(
                            source: ImageSource.gallery);
                         if(file!=null){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SendImages(imagepath: file.path);
                        }));

                         }
                      
                      },
                      icon: Icon(Icons.attach_file)),
                  IconButton(
                    onPressed: () async {
                      final file = await imagepiker.pickImage(
                          source: ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_alt_outlined),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(40)),
            child: ValueListenableBuilder(
              valueListenable: sendmessageController,
              builder: (context, _, a) {
                return IconButton(
                    onPressed: () {
                      widget.onsend(sendmessageController.text);
                      sendmessageController.clear();
                    },
                    icon: sendmessageController.text.isNotEmpty
                        ? Icon(Icons.send, color: Colors.white)
                        : Icon(Icons.mic, color: Colors.white));
              },
            ),
          )
        ],
      ),
    );
  }
}

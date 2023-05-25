import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';
import 'package:flutter_chatt_app/conversation_screen.dart';

class People extends StatelessWidget {
  const People({super.key, this.about, this.image, this.name,this.email,this.status});
  final String? name;
  final String? image;
  final String? about;
  final String? email;
  final String? status;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ConversationScreen(
              
              email: email,
              name: name,
              image: image,);
              
          }));
        },
        child: Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundImage: (image == null || image?.trim() == "")
                    ? AssetImage(AssetsConstant.nodpImage) as ImageProvider
                    : NetworkImage(image!)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name ?? ""),
                SizedBox(height: 10),
                Text(about ?? "Hey i am using Chatts")
              ],
            )
          ],
        ),
      ),
    );
  }
}

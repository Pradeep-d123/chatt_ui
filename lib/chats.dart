import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/conversation_screen.dart';

class Chat extends StatelessWidget {
  const Chat(
      {super.key, required this.image, required this.name, required this.time,required this.email});
  final String name;
  final String image;
  final DateTime time;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ConversationScreen(
              name: name,
              image: image,
              email: email
            );
          }));
        },
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(),
                Positioned(
                  right: 0,
                  bottom: 4,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                  ),
                )
              ],
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(name), Text("Last message")],
              ),
            ),
            Text("${time.minute} minute ago")
          ],
        ),
      ),
    );
  }
}

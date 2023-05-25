import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/consatnt/assets_constant.dart';
import 'package:flutter_chatt_app/message_typing.dart';
import 'package:flutter_chatt_app/models/messages.dart';
import 'package:flutter_chatt_app/singal_messages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({
    super.key,
    required this.name,
    required this.image,
    required this.email,
  });
  final String? name;
  final String? image;
  final String? email;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  List<MessagesModel> messages = [];

  final ValueNotifier<String> statusControler = ValueNotifier("");
  getMessages() {
    DocumentReference message = FirebaseFirestore.instance
        .collection("chatts")
        .doc(FirebaseAuth.instance.currentUser?.email);
    message
        .collection(widget.email ?? "")
        .orderBy("time")
        .snapshots()
        .listen((event) {
      messages.clear();
      print("current user ${FirebaseAuth.instance.currentUser?.email}");
      print("sener ${widget.email ?? ""}");
      for (var i = 0; i < event.size; i++) {
        final message = MessagesModel.fromjson(event.docs[i].data());
        messages.add(message);
        messages = messages.reversed.toList();
        print("messages$message");

        if (mounted) {
          setState(() {});
        }
      }
    });

    message.snapshots().listen((event) {
      try {
        statusControler.value =
            (event.data() as Map<String, dynamic>)[widget.email ?? ""];
      } catch (e) {
        print("Error $e");
        print(widget.email);
      }
    });
  }
  

  @override
  void initState() {
    getMessages();
    // TODO: implement initState
    super.initState();
  }

  userStatusUpdate(bool isKeyboardOpend) {
    FirebaseFirestore.instance.collection("chatts").doc(widget.email).set({
      FirebaseAuth.instance.currentUser?.email ?? "":
          isKeyboardOpend ? "Online" : "Typing......"
    });
  }

  @override
  Widget build(BuildContext context) {
    bool keybord = MediaQuery.of(context).viewInsets.bottom == 0;
    print("keybord ${keybord}");
    userStatusUpdate(keybord);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        titleSpacing: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(value: 1, child: Text("View contact")),
                    PopupMenuItem(child: Text("Media,links,and docs")),
                    PopupMenuItem(child: Text("Mute Notification")),
                    PopupMenuItem(child: Text("wallpaper")),
                    PopupMenuItem(child: Text("More")),
                    PopupMenuItem(
                        child: InkWell(onTap: () {
                        
                        }, child: Text("map")))
                  ])
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Row(
          children: [
            CircleAvatar(
                backgroundImage:
                    (widget.image == null || widget.image?.trim() == "")
                        ? AssetImage(AssetsConstant.nodpImage) as ImageProvider
                        : NetworkImage(widget.image!)),
            SizedBox(width: 10),
            Column(
              children: [
                Text(widget.name ?? ""),
                ValueListenableBuilder(
                  valueListenable: statusControler,
                  builder: (context, _, __) {
                    return Text(
                      statusControler.value,
                      style: TextStyle(fontSize: 12),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final currentdate = messages[index].time?.toDate();
                  return Singal_Messages(
                      isfrom: messages[index].isfrom ?? true,
                      isread: false,
                      text: messages[index].text ?? "",
                      time: currentdate ?? DateTime.now());
                }),
          ),
          Message_Typing_Feild(
            onsend: (text) async {
              await FirebaseFirestore.instance
                  .collection("chatts")
                  .doc(FirebaseAuth.instance.currentUser?.email ?? "")
                  .collection(widget.email ?? "")
                  .add(MessagesModel(
                          isfrom: false, text: text, time: Timestamp.now())
                      .tojson());
              await FirebaseFirestore.instance
                  .collection("chatts")
                  .doc(widget.email)
                  .collection(FirebaseAuth.instance.currentUser?.email ?? "")
                  .add(MessagesModel(
                          isfrom: true, text: text, time: Timestamp.now())
                      .tojson());
            },
          )
        ],
      ),
    ));
  }
}

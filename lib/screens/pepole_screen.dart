import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/models/profile.dart';
import 'package:flutter_chatt_app/pepole.dart';

class PepoleScreen extends StatefulWidget {
  const PepoleScreen({super.key});

  @override
  State<PepoleScreen> createState() => _PepoleScreenState();
}

class _PepoleScreenState extends State<PepoleScreen> {
  List<ProfileModel> profiledata = [];
  getprofiledata() {
    FirebaseFirestore.instance.collection("users").snapshots()..listen((event) {
      profiledata.clear();
      for (var i = 0; i < event.size; i++) {
        final data = ProfileModel.fromjson(event.docs[i].data());
        if (FirebaseAuth.instance.currentUser?.email != data.email) {
          profiledata.add(data);
          
        }
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    getprofiledata();
    // TODO: implement
    // getinitState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: profiledata.length,
        itemBuilder: ((context, index) {
          return People(
            email: profiledata[index].email,
            image: profiledata[index].image,
            name: profiledata[index].name,
          );
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chatt_app/app_bar.dart';
import 'package:flutter_chatt_app/calls.dart';
import 'package:flutter_chatt_app/chats.dart';
import 'package:flutter_chatt_app/pepole.dart';
import 'package:flutter_chatt_app/screens/calls_screen.dart';
import 'package:flutter_chatt_app/screens/chatts_screen.dart';
import 'package:flutter_chatt_app/screens/pepole_screen.dart';
import 'package:flutter_chatt_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                titleSpacing: 0,
                backgroundColor: Colors.green.shade300,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp, size: 18)),
                title: Text("Chats"),
                bottom: PreferredSize(
                    child: App_Bar(),
                    preferredSize: Size(double.infinity, 50))),
            body: _selectedindex == 0
                ? ChattsScreen()
                : _selectedindex == 1
                    ? PepoleScreen()
                    : _selectedindex == 2
                        ? CallsScreen()
                        : ProfileScreen(),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedindex,
                selectedItemColor: Colors.green,
                onTap: (value) {
                  _selectedindex = value;
                  setState(() {});
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.messenger),
                    label: "Chats",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people_alt),
                    label: "Pepole",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.call_sharp), label: "Calls"),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(), label: "Profile"),
                ])));
  }
}

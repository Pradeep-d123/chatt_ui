import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class App_Bar extends StatelessWidget {
  const App_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Center(child: Text("Recent Message")),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Center(child: Text("Active")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

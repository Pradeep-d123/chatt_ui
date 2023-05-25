import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 15),
      child: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: 26,
                      child: Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.green,
                        size: 18,
                      ),
                    ),
                    Text("10:10"),
                  ],
                )
              ],
            ),
          ),
          InkWell(
            child: Icon(
              Icons.phone,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}

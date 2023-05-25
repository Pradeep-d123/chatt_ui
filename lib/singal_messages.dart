import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Singal_Messages extends StatelessWidget {
  const Singal_Messages(
      {super.key,
      required this.isfrom,
      required this.isread,
      required this.text,
      required this.time});
  final bool isfrom;
  final bool isread;
  final String text;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: isfrom ? Alignment.topLeft : Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                minHeight: 30,
                maxWidth: MediaQuery.of(context).size.width - 110,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color:
                        isfrom ? Colors.grey.shade200 : Colors.green.shade200,
                    borderRadius: BorderRadius.circular(5)),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(text),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 3,
                      child: Row(
                        children: [
                          Text(
                            "${time.hour}:${time.minute}",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 5),
                          if (!isfrom)
                            Icon(
                              Icons.done_all,
                              color: Colors.blue,
                              size: 16,
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}

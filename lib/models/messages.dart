import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
  String? text;
  bool? isfrom;
  Timestamp? time;

  MessagesModel({this.isfrom, this.text, this.time});

  static MessagesModel fromjson(Map<String, dynamic> json) {
    return MessagesModel(
        text: json["text"], isfrom: json["isfrom"], time: json["time"]);
  }

  tojson() {
    return {"text": text, "isfrom": isfrom, "time": time};
  }
}

// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.user,
    required this.fakedatabase,
  });

  String user;
  int fakedatabase;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"],
        fakedatabase: json["fakedatabase"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "fakedatabase": fakedatabase,
      };
}

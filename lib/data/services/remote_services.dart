import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpoddemo/data/models/data_model.dart';

final databaseprovider = Provider<RemoteServices>((ref) => RemoteServices());

class RemoteServices {
  static var client = http.Client();
  static Future<Data?> fetchdata() async {
    try {
      var response = await client.get(Uri.parse('http://localhost:3000/data'));

      if (response.statusCode == 200) {
        var jsonstring = response.body;

        return dataFromJson(jsonstring);
      } else {
        return null;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<void> initdata(Data d) async {
    try {
      var response = await client.patch(
        Uri.parse('http://localhost:3000/data/'),
        body: jsonEncode({"fakedatabase": 0}),
        headers: {"Content-type": "application/json"},
      );
      print('nanesh');
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> increment(Data d) async {
    try {
      var response = await client.patch(
        Uri.parse('http://localhost:3000/data/'),
        body: jsonEncode({"fakedatabase": d.fakedatabase + 1}),
        headers: {"Content-type": "application/json"},
      );
      print('nanesh');
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> decrement(Data d) async {
    try {
      var response = await client.patch(
        Uri.parse('http://localhost:3000/data/'),
        body: jsonEncode({"fakedatabase": d.fakedatabase - 1}),
        headers: {"Content-type": "application/json"},
      );
      print('nanesh');
    } on Exception catch (e) {
      // TODO
    }
  }
}

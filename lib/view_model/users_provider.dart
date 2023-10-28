import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:screll_sample/model/usermodel.dart';

import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  // UsersProvider() {
  //   fetchUsers();
  // }
  String apiID = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse(apiID),
      );
      if (response.statusCode == 200) {
        final usersdata = await json.decode(response.body);
        return List<UserModel>.from(
            usersdata.map((user) => UserModel.fromJson(user)));
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}

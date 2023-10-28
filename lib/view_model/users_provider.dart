import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:screll_sample/model/usermodel.dart';

import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  UsersProvider() {
    fetchUsers();
  }
  // UsersModel? usersmodel;
  List<UserModel> users = [];
  String apiID = 'https://jsonplaceholder.typicode.com/users';

  // Stream<Map<String, dynamic>>? getMyUsers() {
  //   return
  // }

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse(apiID),
      );
      if (response.statusCode == 200) {
        //  usersModelFromMap(response.body);

        final usersdata = await json.decode(response.body);
        //  usersmodel = UsersModel.fromMap(usersdata);
        // users = List<UserModel>.from(
        //     usersdata.map((user) => UserModel.fromJson(user)));
        return List<UserModel>.from(
            usersdata.map((user) => UserModel.fromJson(user)));
        // notifyListeners();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}

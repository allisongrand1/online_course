import 'dart:convert';
import 'package:cleanarchitecture/module_data/model/user.dart';
import 'package:http/http.dart' as http;

import 'user_repository.dart';

class UserProvider {
  Future<UserModel> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      var user1 = userJson.map((json) => User.fromJson(json)).toList();

      var usermodel = UserModel.fromDomain(user1);
      return usermodel;

      /* userJson.map((json) => User.fromJson(json)).toList(); */
    } else {
      throw Exception('Error fetching users');
    }
  }
}

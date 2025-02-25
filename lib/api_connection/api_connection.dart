import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Api {
  static const baseUrl = "http://192.168.56.1/db_tpm/";

  // Function to add a new user
  static Future<bool> addUser(Map<String, String> currentUser) async {
    var url = Uri.parse("${baseUrl}postUser.php");

    try {
      final res = await http.post(url, body: currentUser);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("Response Data: $data");
        return data["success"] == true;
      } else {
        print("Failed to get response: ${res.statusCode}");
        return false;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      return false;
    }
  }

  // Function to get users
  static Future<List<Map<String, dynamic>>> getUsers() async {
    var url = Uri.parse("${baseUrl}getUsers.php");

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        if (data["success"] == true) {
          return List<Map<String, dynamic>>.from(data["users"]);
        } else {
          print("No users found.");
          return [];
        }
      } else {
        print("Failed to fetch users: ${res.statusCode}");
        return [];
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      return [];
    }
  }
}

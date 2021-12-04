import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Auth {
  static final Auth _auth = Auth._internal();
  //static const String baseUrl = "quack-app-backend.herokuapp.com";
  static const String baseUrl = "127.0.0.1:8000";
  static bool istest = false;

  factory Auth() {
    return _auth;
  }

  Auth._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _authFile async {
    final path = await _localPath;
    return File('$path/auth.txt');
  }

  get json => null;

  Future<String> getAuth() async {
    try {
      final file = await _authFile;
      final lp = await _localPath;
      // Read the file
      final contents = await file.readAsString();
      log("[core/auth.dart] Got auth: $contents from $lp");
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      log("[core/auth.dart] Did NOT get auth.txt");
      return "";
    }
  }

  Future<Map> register(String name, email, password) async {
    // TODO: verify
    var body = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
    });

    final uri = Uri.http(baseUrl, "/user/register");
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    final details = jsonDecode(response.body);
    print(details);
    if (response.statusCode == 201) {
      print("[core/auth] Successfully registered user ${response.body}");
      return Future.value(details);
    }
    print("[core/auth] Failed to register user ${response.body}");
    return Future.value(details);
  }

  Future<List> authenticate(String email, password) async {
    if (istest) {
      return Future.value([
        {},
        {"access_token": ""},
        jsonEncode({
          "_id": {"\$oid": "61882c265f992e7f6d141036"},
          "devices": [],
          "email": "test@emory.edu",
          "favorites": [],
          "friends": ["felipe@emory.edu", "mitchie@emory.edu"],
          "is_sharing_location": false,
          "loc": 1,
          "name": "Test User",
          "password": "password1!",
          "verified": false
        })
      ]);
    }

    if (email != "" && password != "") {
      final body = jsonEncode({
        "email": email,
        "password": password,
      });

      final uri = Uri.http(baseUrl, "/user/login");
      final response = await http.post(uri,
          headers: {"Content-Type": "application/json"}, body: body);
      if (response.statusCode == 200) {
        print("[core/auth] Successfully logged in");
        final List r = jsonDecode(response.body);
        return Future.value(r);
      }
      print("[core/auth] Failed to login ${response.body}");
      return Future.value(jsonDecode(response.body));
    }

    return Future.value([]);
  }

  Future<void> saveAuth(String email, String password) async {
    if (istest) return;

    String lp = await _localPath;
    print(
        "[core/auth.dart] Saving auth with email: $email and password $password at $lp");
    final file = await _authFile;
    // Write the file
    file.writeAsString('$email,$password');
  }

  Future<void> destroy() async {
    // TODO: Delete any user data on destroy
    await saveAuth("", "");
  }

  String getBaseURL() {
    return baseUrl;
  }

  bool isTest() {
    return istest;
  }

  void setTest() {
    istest = true;
  }
}

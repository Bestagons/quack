import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Auth {
  static final Auth _auth = Auth._internal();
  static const String baseUrl = "127.0.0.1:8000";
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

  Future<bool> register(String name, email, password) async {
    // TODO: verify
    var body = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
    });

    final uri = Uri.http(baseUrl, "/register");
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 201) {
      print("[core/auth] Successfully registered user ${response.body}");
      return Future.value(true);
    }
    print("[core/auth] Failed to register user ${response.body}");
    return Future.value(false);
  }

  Future<bool> authenticate(String email, password) async {
    if (email != "" && password != "") {
      // TODO: verify
      final queryParams = {
        "email": email,
        "password": password,
      };

      final uri = Uri.http(baseUrl, "/login", queryParams);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print("[core/auth] Successfully logged in");
        return Future.value(true);
      }
      print("[core/auth] Failed to login ${response.body}");
    }

    return Future.value(false);
  }

  Future<void> saveAuth(String email, String password) async {
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
}

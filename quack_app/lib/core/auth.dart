import 'dart:developer';
import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Auth {
  static final Auth _auth = Auth._internal();

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

  Future<bool> register(String email, password) async {
    // TODO: verify
    final queryParams = {
      "email": email,
      "password": password,
    };

    final uri = Uri.https("http://127.0.0.1", "/login", queryParams);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> authenticate(String credentials) async {
    if (credentials.contains(",")) {
      List<String> creds = credentials.split(",");
      String email = creds[0];
      String password = creds[1];
      if (email != "" && password != "") {
        // TODO: verify
        final queryParams = {
          "email": email,
          "password": password,
        };

        final uri = Uri.https("http://127.0.0.1", "/login", queryParams);
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          return Future.value(true);
        }
      }
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

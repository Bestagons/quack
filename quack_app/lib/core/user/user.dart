import 'package:quack_app/core/user/user_data.dart';

class User {
  UserData userData = UserData.empty();

  static final User _user = User._internal();

  factory User() {
    return _user;
  }

  User._internal();

  Future<void> initialize(String email, password, token, userJson) async {
    userData = UserData(email, password, token);
    await userData.initialize(userJson);
    return Future.value();
  }
}

import 'package:motor_diary/user.dart';

class DataStorage {
  static final DataStorage _instance = DataStorage._internal();

  factory DataStorage() {
    return _instance;
  }

  DataStorage._internal();

  User? user;

  void saveUser(User newUser) {
    user = newUser;
  }

  User? getUser() {
    return user;
  }
}

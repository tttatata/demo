import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    phone: '',
    address: '',
    type: '',
    token: '',
  );
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}

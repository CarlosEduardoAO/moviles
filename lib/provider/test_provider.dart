import 'package:flutter/material.dart';

class TestProvider with ChangeNotifier {
  String _user = '';

  String get user => _user;
  set user(String value) {
    this.user = value;
    notifyListeners();
  }
}
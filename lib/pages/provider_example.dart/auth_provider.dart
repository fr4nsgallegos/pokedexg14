import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogged = false;
  String _user = "";

  bool get isLogged => _isLogged;
  String get user => _user;

  void login(String name) {
    _isLogged = true;
    _user = name;
    notifyListeners();
  }

  void logout() {
    _isLogged = false;
    _user = "";
    notifyListeners();
  }
}

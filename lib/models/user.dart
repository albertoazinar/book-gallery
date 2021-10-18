import 'package:flutter/material.dart';

class User {
  final String? uid;
  final String? fullname;
  final String? birthDate;
  final String? email;


  User({
    required this.uid,
    required this.fullname,
    required this.birthDate,
    required this.email,
  });
}

class UserAuthed with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void signOut() {
    _user = null;
  }
}
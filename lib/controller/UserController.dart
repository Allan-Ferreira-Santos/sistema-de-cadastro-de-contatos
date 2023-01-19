import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';

import '../model/User.dart';

class UserController {
  Register(email, cpf, password, confirmPassword) {
    User newUser = User(
        email: email,
        cpf: cpf,
        password: password,
        confirmPassword: confirmPassword);

    SaveUser(newUser);
  }
}

SaveUser(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString(PreferencesKeys.activeUser, json.encode(user.toJson()));

  print("Salvando Dados" + user.toString());
}

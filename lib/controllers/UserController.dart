import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';

import '../models/User.dart';

class UserController {
  /*
  * Register new User
  * @author  Allan F Santos
  * @version 1.0 - 20230120 - initial release
  * @param email - email user
  * @param cpf - cpf user
  * @param password - password user
  * @param confirmPassword - confirm password user
  * @return void
  */

  register(email, cpf, password, confirmPassword) {
    User newUser = User(
        email: email,
        cpf: cpf,
        password: password,
        confirmPassword: confirmPassword);

    saveUser(newUser);
  }

  /*
  * Get user
  * @author  Allan F Santos
  * @version 1.0 - 20230120 - initial release
  * @return User
  */

  Future<User> getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser.toString());

    User user = User.fromJson(mapUser);

    return user;
  }

  /*
  * Verify address and password of user
  * @author  Allan F Santos
  * @version 1.0 - 20230120 - initial release
  * @param response - data address and password of user
  * @return Map<String, dynamic>
  */

  login(Map<String, dynamic> response) async {
    User savedUser = await getSavedUser();
    Map<String, dynamic> data = {};

    if (response['email'] == savedUser.email &&
        response['password'] == savedUser.password) {
      data['loginError'] = false;
      data['success'] = true;
    } else {
      data['loginError'] = true;
      data['success'] = false;
    }
    return data;
  }
}

saveUser(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString(PreferencesKeys.activeUser, json.encode(user.toJson()));

  print("Salvando Dados" + user.toString());
}

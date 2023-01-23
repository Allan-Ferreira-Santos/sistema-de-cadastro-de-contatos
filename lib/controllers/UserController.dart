import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';

import '../models/User.dart';

class UserController {
  /*
   * Logout user
   * @author  Allan F Santos
   * @version 1.0 - 20230122 - initial release
   * @return  bool
   */

  Future<bool> logout(String password) async {
    User savedUser = await getSavedUser();
    final prefs = await SharedPreferences.getInstance();

    if (savedUser.password == password) {
      await prefs.clear();
      return true;
    }
    return false;
  }

  /*
  * Register new User
  * @author  Allan F Santos
  * @version 1.0 - 20230121 - initial release
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
  * @version 1.0 - 20230121 - initial release
  * @return user
  */

  Future<User> getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser.toString());

    User user = User.fromJson(mapUser);

    return user;
  }

  /*
  * Verify email and password of user
  * @author  Allan F Santos
  * @version 1.0 - 20230121 - initial release
  * @param response - data email and password of user
  * @return data
  */

  login(Map<String, dynamic> response) async {
    User savedUser = await getSavedUser();
    Map<String, dynamic> data = {};

    if (response['email'] == savedUser.email &&
        response['password'] == savedUser.password) {
      data['loginError'] = false;
      data['success'] = true;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(PreferencesKeys.firstRun, true);
    } else {
      data['loginError'] = true;
      data['success'] = false;
    }
    return data;
  }

  /*
  * Save user
  * @author  Allan F Santos
  * @param User user - data user
  * @version 1.0 - 20230121 - initial release
  * @return <void>
  */

  saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(PreferencesKeys.activeUser, json.encode(user.toJson()));
  }
}

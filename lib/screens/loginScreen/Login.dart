import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';
import 'package:test_vaga/components/input/Input.dart';

import '../../components/input/InputObscure.dart';
import '../../model/User.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _LoginPassword = TextEditingController();
  TextEditingController _LoginEmail = TextEditingController();

  Login() async {
    String mail = _LoginEmail.text;
    String password = _LoginPassword.text;

    User savedUser = await _getSavedUser();

    print(savedUser.toJson());

    if (mail == savedUser.email && password == savedUser.password) {
      Navigator.of(context).pushNamed(
        '/HomeScreen',
      );
    } else {
      print('aqui foi');
    }
  }

  Future<User> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser.toString());

    User user = User.fromJson(mapUser);

    return user;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
            body: Container(
                color: Colors.blueGrey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                  child: Form(
                                key: _formKey,
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                    width: size.width * 0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 30, bottom: 20),
                                          width: size.width,
                                          child: Text(
                                            'Seja Bem-Vindo',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Text('Email'),
                                        ),
                                        Container(
                                          child: Input(
                                            textStyle:
                                                TextStyle(color: Colors.black),
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'E-mail inválido!';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                _LoginEmail.text = value;
                                              });
                                            },
                                            fillColor: Colors.white,
                                            filled: true,
                                            obscureText: false,
                                            placeholder: "Digite o Email",
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Text('Senha'),
                                        ),
                                        Container(
                                          child: ObscureInput(
                                            colorIcon: Colors.black,
                                            textStyle:
                                                TextStyle(color: Colors.black),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                            onChange: (value) {
                                              _LoginPassword.text = value;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty ||
                                                  value.length < 8) {
                                                return 'senha Invalida!';
                                              }
                                              return null;
                                            },
                                            placeholder: 'Digite sua Senha',
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Login();
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20),
                                            padding: EdgeInsets.all(10),
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              'Entrar',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              '/CreateAccount',
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 20, bottom: 30),
                                            padding: EdgeInsets.all(10),
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              'Clique aqui para criar sua Conta',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ))
                            ],
                          ),
                        ),
                      )
                    ]))));
  }
}

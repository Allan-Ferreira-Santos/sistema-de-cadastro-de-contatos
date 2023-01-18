import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_vaga/components/input/Input.dart';

import '../../components/input/InputObscure.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
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
                              Container(
                                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  height: size.height * 0.5,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 30),
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
                                        child: Text('Nome'),
                                      ),
                                      Container(
                                        child: Input(
                                          textStyle:
                                              TextStyle(color: Colors.black),
                                          controller: null,
                                          initialValue: null,
                                          keyboardType: TextInputType.text,
                                          onChanged: (value) {},
                                          fillColor: Colors.white,
                                          filled: true,
                                          autofocus: false,
                                          obscureText: false,
                                          placeholder: "Nome",
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                          contentPadding:
                                              EdgeInsets.fromLTRB(15, 0, 0, 0),
                                          controller: null,
                                          onChange: (value) {},
                                          validator: null,
                                          placeholder: 'Digite sua Senha',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              30, 30, 30, 30),
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
                            ],
                          ),
                        ),
                      )
                    ]))));
  }
}

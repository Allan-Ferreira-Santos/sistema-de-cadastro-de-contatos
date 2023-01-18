import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_vaga/components/input/InputCpf.dart';

import '../../components/input/Input.dart';
import '../../components/input/InputObscure.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      child: Icon(
                                                        Icons
                                                            .chevron_left_outlined,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20, top: 20),
                                                    width: size.width,
                                                    child: Text(
                                                      'Preencha todos os Campos para se cadastrar',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  )),
                                            ],
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
                                            controller: null,
                                            initialValue: null,
                                            keyboardType: TextInputType.text,
                                            onChanged: (value) {},
                                            fillColor: Colors.white,
                                            filled: true,
                                            autofocus: false,
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
                                          child: Text('Cpf'),
                                        ),
                                        Container(
                                          child: InputCpf(
                                            controller: null,
                                            initialValue: null,
                                            validator: null,
                                            onChange: (value) {},
                                            placeholder: 'Digite seu CPF',
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
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Text('Confirme sua Senha'),
                                        ),
                                        Container(
                                          child: ObscureInput(
                                            colorIcon: Colors.black,
                                            textStyle:
                                                TextStyle(color: Colors.black),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                            controller: null,
                                            onChange: (value) {},
                                            validator: null,
                                            placeholder: 'Confirme sua Senha',
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              '/',
                                            );
                                          },
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
                                              'Cadastrar',
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
                              )
                            ],
                          ),
                        ),
                      )
                    ]))));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_vaga/components/input/InputCpf.dart';
import 'package:test_vaga/controllers/UserController.dart';

import '../../components/input/Input.dart';
import '../../components/input/InputObscure.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: size.width * 0.3,
              height: size.height * 0.8,
              decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const SizedBox(
                                child: Icon(
                                  Icons.chevron_left_outlined,
                                  size: 30,
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 8,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(bottom: 20, top: 20),
                              width: size.width,
                              child: const Text(
                                'Preencha todos os Campos para se cadastrar',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: const Text('Email'),
                            ),
                            SizedBox(
                              child: Input(
                                textStyle: const TextStyle(color: Colors.black),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-mail inválido!';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _email.text = value;
                                  });
                                },
                                fillColor: Colors.white,
                                filled: true,
                                obscureText: false,
                                placeholder: "Digite o Email",
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: const Text('Cpf'),
                            ),
                            SizedBox(
                              child: InputCpf(
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length != 14) {
                                    return 'CPF inválido!';
                                  }
                                  return null;
                                },
                                onChange: (value) {
                                  setState(() {
                                    _cpf.text = value;
                                  });
                                },
                                placeholder: 'Digite seu CPF',
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: const Text('Senha'),
                            ),
                            SizedBox(
                              child: ObscureInput(
                                colorIcon: Colors.black,
                                textStyle: const TextStyle(color: Colors.black),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                onChange: (value) {
                                  _password.text = value;
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
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: const Text('Confirme sua Senha'),
                            ),
                            SizedBox(
                              child: ObscureInput(
                                colorIcon: Colors.black,
                                textStyle: const TextStyle(color: Colors.black),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 8) {
                                    return 'senha Invalida!';
                                  } else if (_password.text !=
                                      _confirmPassword.text) {
                                    return 'Senha errada!';
                                  }
                                  return null;
                                },
                                onChange: (value) {
                                  _confirmPassword.text = value;
                                },
                                placeholder: 'Confirme sua Senha',
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  UserController().register(
                                      _email.text,
                                      _cpf.text,
                                      _password.text,
                                      _confirmPassword.text);

                                  Navigator.of(context).pushNamed(
                                    '/',
                                  );
                                }
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(30, 30, 30, 30),
                                padding: const EdgeInsets.all(10),
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
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
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:test_vaga/components/input/InputCpf.dart';
import 'package:test_vaga/controllers/UserController.dart';

import '../../components/input/Input.dart';
import '../../components/input/InputObscure.dart';
import '../../helpers/Validator.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController mail = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 34, 32, 32),
        body: Center(
          child: Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: size.width * 0.3,
              height: size.height * 0.88,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 144, 143, 141),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            'Crie sua Conta',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
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
                                  if (Validator().emailValidator(value) !=
                                      null) {
                                    String response =
                                        Validator().emailValidator(value);

                                    return response;
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    mail.text = value;
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
                                  if (Validator().cpfValidator(value) != null) {
                                    String response =
                                        Validator().cpfValidator(value);

                                    return response;
                                  }
                                  return null;
                                },
                                onChange: (value) {
                                  setState(() {
                                    cpf.text = value;
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
                                  password.text = value;
                                },
                                validator: (value) {
                                  if (Validator().passwordValidator(value) !=
                                      null) {
                                    String response =
                                        Validator().passwordValidator(value);

                                    return response;
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
                                  if (Validator().passwordValidator(value) !=
                                      null) {
                                    String response =
                                        Validator().passwordValidator(value);

                                    return response;
                                  } else if (password.text !=
                                      confirmPassword.text) {
                                    return 'Senha errada!';
                                  }
                                  return null;
                                },
                                onChange: (value) {
                                  confirmPassword.text = value;
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
                                  UserController().register(mail.text, cpf.text,
                                      password.text, confirmPassword.text);

                                  Navigator.of(context).pushNamed(
                                    '/',
                                  );
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 15),
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
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  'Voltar ',
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

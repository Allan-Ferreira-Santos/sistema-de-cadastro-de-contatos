import 'package:flutter/material.dart';
import 'package:test_vaga/components/input/Input.dart';

import '../../components/input/InputObscure.dart';
import '../../controllers/UserController.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  bool loginError = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController loginPassword = TextEditingController();
  final TextEditingController loginEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Form(
        key: _formKey,
        child: Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            width: size.width * 0.3,
            height: size.height * 0.6,
            decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  width: size.width,
                  child: const Text(
                    'Seja Bem-Vindo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
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
                        loginEmail.text = value;
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
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: const Text('Senha'),
                ),
                SizedBox(
                  child: ObscureInput(
                    colorIcon: Colors.black,
                    textStyle: const TextStyle(color: Colors.black),
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    onChange: (value) {
                      loginPassword.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
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
                if (loginError) ...[
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: size.width,
                    child: const Text(
                      'Usuario ou senha invalido',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> data = {
                        'email': loginEmail.text,
                        'password': loginPassword.text
                      };

                      Map<String, dynamic> response =
                          await UserController().login(data);

                      if (response['success']) {
                        setState(() {
                          loginError = response['loginError'];
                        });
                        Navigator.of(context).pushNamed(
                          '/HomeScreen',
                        );
                      } else {
                        setState(() {
                          loginError = response['loginError'];
                        });
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
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
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    padding: const EdgeInsets.all(10),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
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
      )),
    );
  }
}

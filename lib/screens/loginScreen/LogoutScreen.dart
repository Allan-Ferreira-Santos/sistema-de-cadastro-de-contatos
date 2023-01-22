import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_vaga/components/input/Input.dart';
import 'package:test_vaga/controllers/UserController.dart';

import '../../components/input/InputObscure.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  String? password;
  bool passwordError = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Logout',
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              "Para deslogar precisa colocar sua senha em baixo ao deslogar você perdera todas suas informações",
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            ObscureInput(
              colorIcon: Colors.black,
              textStyle: const TextStyle(color: Colors.black),
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              onChange: (value) {
                password = value;
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
            if (passwordError != true) ...[const Text('Senha Invalida')]
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          child: const Text('Confirmar'),
          onPressed: () async {
            bool error = await UserController().logout(password!);
            setState(() {
              passwordError = error;
            });

            if (error == true) {
              Navigator.of(context).pushNamed('/');
            }
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          child: const Text('cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

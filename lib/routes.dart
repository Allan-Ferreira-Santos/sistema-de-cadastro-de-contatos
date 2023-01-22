import 'package:flutter/material.dart';
import 'package:test_vaga/screens/SplashScreen.dart';
import 'package:test_vaga/screens/home/ContactRegister.dart';
import 'package:test_vaga/screens/home/HomeScreen.dart';
import 'package:test_vaga/screens/loginScreen/CreateAccount.dart';
import 'package:test_vaga/screens/loginScreen/Login.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => SplashScreen(),
  '/Login': (BuildContext context) => const LoginScreens(),
  '/CreateAccount': (BuildContext context) => const CreateAccount(),
  '/HomeScreen': (BuildContext context) => const HomeScreen(),
  '/ContactRegister': (BuildContext context) => ContactRegister(
      currentContact:
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?),
};

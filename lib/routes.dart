import 'package:flutter/material.dart';
import 'package:test_vaga/screens/loginScreen/CreateAccount.dart';
import 'package:test_vaga/screens/loginScreen/Login.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => LoginScreens(),
  '/CreateAccount': (BuildContext context) => CreateAccount(),
};

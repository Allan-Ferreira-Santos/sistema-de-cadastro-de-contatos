import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool firstRun = true;
  @override
  void initState() {
    initialSetup();
    super.initState();
  }

  /*
  * Initial setup
  * @author  Allan F Santos
  * @version 1.0 - 20230121 - initial release
  * @return  void
  */
  Future<void> initialSetup() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(PreferencesKeys.firstRun) == true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/Login', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 32, 32),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

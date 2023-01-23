import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:test_vaga/controllers/ContactController.dart';
import 'package:test_vaga/screens/home/contactsScreen.dart';
import 'package:test_vaga/screens/home/mapScreen.dart';

import '../../helpers/FunctionsClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? search;
  late List contacts;
  late List markers = <Marker>[];
  bool progress = true;
  bool showWigte = false;

  @override
  void initState() {
    super.initState();
    initialSetup();
  }

  /*
  * Initial setup
  * @author  Allan F Santos
  * @version 1.0 - 20230121 - initial release
  * @return  void
  */

  Future<void> initialSetup() async {
    if (!await FunctionsClass().verifyInternalUrl()) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }

    contacts = await ContactController().getContacts();
    if (contacts.isNotEmpty) {
      markers = await ContactController().allMarkersContancts(contacts);
      showWigte = true;
    }

    setState(() {
      progress = false;
    });
  }

  showSpecificWidget(bool showContact) {
    if (showContact) {
      return Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ContactsScreen(
              contactsList: contacts,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: MapScreen(markers: markers),
          )
        ],
      );
    }
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        "sem contatos, por favor adicione um contato",
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: const Color.fromARGB(255, 255, 255, 255)),
        textAlign: TextAlign.center,
      ),
      Container(
        padding: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/ContactRegister',
            );
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: const Text(
              'Adicionar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
      body: progress
          ? const Center(child: CircularProgressIndicator())
          : showSpecificWidget(showWigte),
    );
  }
}

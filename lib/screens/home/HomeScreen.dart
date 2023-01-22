import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:test_vaga/controllers/ContactController.dart';
import 'package:test_vaga/screens/home/contactsScreen.dart';
import 'package:test_vaga/screens/home/mapScreen.dart';

import '../../helpers/FunctionsClass.dart';
import '../loginScreen/LogoutScreen.dart';

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
  * @author  SGV
  * @version 1.0 - 20220111 - initial release
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
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ContactsScreen(
              contactsList: contacts,
            ),
          ),
          Container(
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
            .copyWith(color: Colors.black),
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/ContactRegister',
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text(
            'Adicionar',
            style: TextStyle(color: Colors.black),
          ),
        ),
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: progress
          ? const Center(child: CircularProgressIndicator())
          : showSpecificWidget(showWigte),
    );
    return Scaffold(
      body: Column(children: [
        SizedBox(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: size.width * 0.4,
                height: size.height,
                color: const Color.fromARGB(255, 161, 149, 149),
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            width: size.width * 0.33,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 20), // add padding to adjust text
                                isDense: true,
                                hintText: ("search"),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15), // add padding to adjust icon
                                  child: Icon(
                                    Icons.search,
                                    size: 28,
                                  ),
                                ),
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.name,
                              initialValue: null,
                              onChanged: (value) {
                                setState(() {
                                  search = value;
                                });
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/ContactRegister',
                              );
                            },
                            child: const SizedBox(
                              child: Icon(Icons.add),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const LogoutScreen();
                                },
                              );
                            },
                            child: const Icon(Icons.exit_to_app),
                          ),
                        ],
                      ),
                    ),
                    if (contacts.isNotEmpty) ...[
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0; i < contacts.length; i++) ...[
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          child: Text(contacts[i]["name"][0]),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                contacts[i]["name"],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                contacts[i]["cpf"],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ],
                        ),
                      )
                    ]
                  ],
                ),
              ),
              Container(
                height: size.height,
                width: size.width * 0.6,
                color: Colors.amber,
              )
            ],
          ),
        )
      ]),
    );
  }
}

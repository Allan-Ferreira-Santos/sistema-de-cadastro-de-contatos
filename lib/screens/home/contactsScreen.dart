import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_vaga/helpers/FunctionsClass.dart';

import '../../controllers/ContactController.dart';
import '../loginScreen/LogoutScreen.dart';

class ContactsScreen extends StatefulWidget {
  final contactsList;

  const ContactsScreen({Key? key, this.contactsList}) : super(key: key);
  @override
  ContactsScreenState createState() => ContactsScreenState();
}

class ContactsScreenState extends State<ContactsScreen>
    with TickerProviderStateMixin<ContactsScreen> {
  List contactList = [];
  bool showProccessLoad = true;
  String? search;

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
    if (!await FunctionsClass().verifyInternalUrl()) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    } else {
      contactList = widget.contactsList;
    }
    setState(() {
      showProccessLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: verifyAndShowWidget(contactList)),
    );
  }

/*
  * verify if exist contact 
  * @author  Allan F Santos
  * @version 1.0 - 20220420 - initial release
  * param <String> contactList - contact list 
  * @return<widget>
  */
  verifyAndShowWidget(var contactList) {
    Size size = MediaQuery.of(context).size;
    if (contactList.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: size.width * 0.31,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      )),
                      hintText: ("search"),
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 10), // add padding to adjust icon
                        child: Icon(
                          Icons.search,
                          size: 28,
                          color: Colors.white,
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
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
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
                  child: const Icon(Icons.exit_to_app,
                      color: Colors.white, size: 26),
                ),
              ],
            ),
            const SizedBox(height: 20),
            showContactList(search),
          ],
        ),
      );
    } else {
      return Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
            Text(
              ('no contact'),
              textAlign: TextAlign.center,
            ),
          ]));
    }
  }

  /*
  * Show list of contact 
  * @author  Allan F Santos
  * @version 1.0 - 20230121 - initial release
  * param <String> search - filter search 
  * @return<widget>
  */

  showContactList(String? search) {
    List contactFilter = [];
    if (search == null || search.isEmpty) {
      contactFilter = contactList
        ..sort((a, b) =>
            a['cpf'].toLowerCase()!.compareTo(b['cpf'].toLowerCase()));
    } else {
      search = FunctionsClass.removeAccents(search).toLowerCase();
      for (var contact in contactList) {
        if (FunctionsClass.removeAccents(contact['cpf'])
            .toLowerCase()
            .contains(search)) {
          contactFilter.add(contact);
        }
      }
    }
    return Expanded(
        child: ListView(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            children: [
          for (var contact in contactFilter) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    height: MediaQuery.of(context).size.height / 13,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
                      child: Text(
                        contact['name'][0],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 12,
                    child: SizedBox(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: contact['name'] != null &&
                                      contact['name'] != '!UNKNOWN!'
                                  ? Text(
                                      contact['name'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  : const Text('UNKNOWN')),
                          Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: contact['cpf'] != null &&
                                      contact['cpf'] != '!UNKNOWN!'
                                  ? Text(
                                      contact['cpf'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  : const Text('UNKNOWN')),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/ContactRegister', (route) => false,
                            arguments: contact);
                      },
                      child: const SizedBox(
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () async {
                        return showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: const Text(
                                  'Deseja deletar o contato?',
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.green,
                                    ),
                                    child: const Text('Delete'),
                                    onPressed: () async {
                                      log(contact['cpf']);
                                      await ContactController()
                                          .deleteContact(contact['cpf']);
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              '/HomeScreen', (route) => false);
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
                                ]);
                          },
                        );
                      },
                      child: const SizedBox(
                        child: Icon(
                          Icons.delete_outline,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ]));
  }
}

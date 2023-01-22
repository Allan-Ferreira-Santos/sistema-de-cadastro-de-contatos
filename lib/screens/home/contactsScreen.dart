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
  * @author  SGV
  * @version 1.0 - 20220111 - initial release
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
  * @author  SGV
  * @version 1.0 - 20220420 - initial release
  * param <String> contactList - contact list 
  * @return<widget>
  */
  verifyAndShowWidget(var contactList) {
    Size size = MediaQuery.of(context).size;
    if (contactList.isNotEmpty) {
      return Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                width: size.width * 0.33,
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20), // add padding to adjust text
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
          const SizedBox(height: 20),
          showContactList(search),
        ],
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
  * @author  SGV
  * @version 1.0 - 20220419 - initial release
  * @version 1.2 - 20220429 - Do a search without an accent and placing everything in to lower case
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
        child: ListView(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), children: [
      for (var contact in contactFilter) ...[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              height: MediaQuery.of(context).size.height / 13,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey,
                child: Text(contact['name'][0]),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                width: MediaQuery.of(context).size.width * 0.3,
                child: contact['name'] != null && contact['name'] != '!UNKNOWN!'
                    ? Text(
                        contact['name'].toString(),
                      )
                    : Text('UNKNOWN')),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/ContactRegister', (route) => false,
                        arguments: contact);
                  },
                  child: SizedBox(
                    child: Icon(Icons.edit),
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
                            title: Text(
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
                                  Navigator.of(context).pushNamedAndRemoveUntil(
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
                  child: SizedBox(
                    child: Icon(Icons.delete_outline),
                  ),
                )),
          ],
        ),
        SizedBox(height: 10),
      ],
    ]));
  }
}

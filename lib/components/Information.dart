import 'package:flutter/material.dart';

class InformationContacts extends StatefulWidget {
  late List? contacts;

  InformationContacts({Key? key, this.contacts}) : super(key: key);

  @override
  State<InformationContacts> createState() => _InformationContactsState();
}

class _InformationContactsState extends State<InformationContacts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container();
  }
}

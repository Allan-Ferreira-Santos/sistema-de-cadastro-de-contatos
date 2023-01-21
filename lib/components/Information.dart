import 'package:flutter/material.dart';
import 'package:test_vaga/models/Contact.dart';

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
    return Container(
      child: Column(
        children: [
          for (var i = 0; i < widget.contacts!.length; i++) ...[
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(widget.contacts![i]["name"]),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(widget.contacts![i]["cpf"]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Icon(Icons.edit),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Icon(Icons.delete_outline),
                      ))
                ],
              ),
            )
          ],
        ],
      ),
    );
  }
}

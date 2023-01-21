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
    return SizedBox(
      child: Column(
        children: [
          for (var i = 0; i < widget.contacts!.length; i++) ...[
            SizedBox(
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(widget.contacts![i]["name"]),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(widget.contacts![i]["cpf"]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Icon(Icons.edit),
                      )),
                  const Expanded(
                      flex: 1,
                      child: SizedBox(
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

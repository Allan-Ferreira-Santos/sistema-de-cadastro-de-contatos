import 'package:flutter/material.dart';

class information extends StatefulWidget {
  const information({super.key});

  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
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
                          child: Text('sdfsdf'),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('sdfsdf'),
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
      ),
    );
  }
}

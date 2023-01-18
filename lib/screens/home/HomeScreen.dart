import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_vaga/components/information.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? search;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
      body: Column(children: [
        Container(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: size.width * 0.4,
                height: size.height,
                color: Color.fromARGB(255, 161, 149, 149),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
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
                            child: Container(
                              child: Icon(Icons.add),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Icon(Icons.exit_to_app),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: information(),
                    ),
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
    ));
  }
}

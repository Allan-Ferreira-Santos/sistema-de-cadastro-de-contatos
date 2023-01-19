import 'package:flutter/material.dart';

import '../../components/input/Input.dart';
import '../../components/input/InputCpf.dart';

class ContactRegister extends StatefulWidget {
  const ContactRegister({super.key});

  @override
  State<ContactRegister> createState() => _ContactRegisterState();
}

class _ContactRegisterState extends State<ContactRegister> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
            body: Container(
                color: Colors.blueGrey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: size.height * 0.9,
                          child: SingleChildScrollView(
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 0, 30, 0),
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        child: Icon(
                                                          Icons
                                                              .chevron_left_outlined,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 10,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20, top: 20),
                                                      width: size.width,
                                                      child: Text(
                                                        'Cadastre um novo Contato',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 15),
                                            child: Text('Email'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "Digite o Email",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Nome'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "Digite o seu Nome",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Telefone'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "Digite seu numero",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 15, bottom: 10),
                                            child: Text('Cpf'),
                                          ),
                                          Container(
                                            child: InputCpf(
                                              controller: null,
                                              initialValue: null,
                                              validator: null,
                                              onChange: (value) {},
                                              placeholder: 'Digite seu CPF',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Cep'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "Digite seu CEP",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Bairro'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Endereço'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Numero'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "Digite seu Numero",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Localidade'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('UF'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Text('Complemento'),
                                          ),
                                          Container(
                                            child: Input(
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              controller: null,
                                              initialValue: null,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                              fillColor: Colors.white,
                                              filled: true,
                                              autofocus: false,
                                              obscureText: false,
                                              placeholder: "Digite Complemento",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                '/HomeScreen',
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30, 30, 30, 30),
                                              padding: EdgeInsets.all(10),
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Text(
                                                'Cadastrar',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ))
                    ]))));
  }
}

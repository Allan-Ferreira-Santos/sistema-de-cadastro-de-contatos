import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

import '../../components/input/Input.dart';
import '../../components/input/InputCpf.dart';
import '../../components/input/InputPhone.dart';
import '../../components/input/InputZip.dart';
import 'package:http/http.dart' as http;

class ContactRegister extends StatefulWidget {
  const ContactRegister({super.key});

  @override
  State<ContactRegister> createState() => _ContactRegisterState();
}

class _ContactRegisterState extends State<ContactRegister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _zip = TextEditingController();

  _RegisterContact() {
    print('aqui');
  }

  searchZip() async {
    String cep = _zip.text;
    var url = 'https://viacep.com.br/ws/$cep/json/';

    var response = await http.get(Uri.parse(url));

    print('response' + response.body);

    var json = jsonDecode(response.body);

    return json;
  }

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
                                                        /* Navigator.pop(context); */

                                                        searchZip();
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
                                          Form(
                                              key: _formKey,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15),
                                                    child: Text('Email'),
                                                  ),
                                                  Container(
                                                    child: Input(
                                                      textStyle: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'E-mail inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _email.text = value;
                                                        });
                                                      },
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      obscureText: false,
                                                      placeholder:
                                                          "Digite o Email",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      keyboardType:
                                                          TextInputType.text,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Nome inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _nome.text = value;
                                                        });
                                                      },
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      obscureText: false,
                                                      placeholder:
                                                          "Digite seu Nome",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      child: InputPhone(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Telefone inválido!';
                                                      }
                                                      return null;
                                                    },
                                                    onChange: (value) {
                                                      setState(() {
                                                        _phone.text = value;
                                                      });
                                                    },
                                                    placeholder:
                                                        'Digite seu número com DDD',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            15, 0, 0, 0),
                                                  )),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 15, bottom: 10),
                                                    child: Text('Cpf'),
                                                  ),
                                                  Container(
                                                    child: InputCpf(
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty ||
                                                            value.length !=
                                                                14) {
                                                          return 'CPF inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      onChange: (value) {
                                                        setState(() {
                                                          _cpf.text = value;
                                                        });
                                                      },
                                                      placeholder:
                                                          'Digite seu CPF',
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      child: InputZip(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'CEP inválido!';
                                                      }
                                                      return null;
                                                    },
                                                    onChange: (value) {
                                                      setState(() {
                                                        _zip.text = value;
                                                      });
                                                    },
                                                    placeholder:
                                                        'Digite seu CEP',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            15, 0, 0, 0),
                                                    suffixIcon: Icon(
                                                      Icons.map_sharp,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                  )),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10, top: 10),
                                                    child: Text('Bairro'),
                                                  ),
                                                  Container(
                                                    child: Input(
                                                      textStyle: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      onChanged: (value) {},
                                                      fillColor: Colors.white,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Bairro inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      filled: true,
                                                      obscureText: false,
                                                      placeholder: "",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      keyboardType:
                                                          TextInputType.text,
                                                      onChanged: (value) {},
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Endereço inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      obscureText: false,
                                                      placeholder: "",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      keyboardType:
                                                          TextInputType.text,
                                                      onChanged: (value) {},
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      obscureText: false,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Numero inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      placeholder:
                                                          "Digite seu Numero",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 0, 0, 0),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10, top: 10),
                                                    child: Text('Cidade'),
                                                  ),
                                                  Container(
                                                    child: Input(
                                                      textStyle: TextStyle(
                                                          color: Colors.black),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      onChanged: (value) {},
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Cidade inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      obscureText: false,
                                                      placeholder: "",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      keyboardType:
                                                          TextInputType.text,
                                                      onChanged: (value) {},
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      obscureText: false,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'UF inválido!';
                                                        }
                                                        return null;
                                                      },
                                                      placeholder: "",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      keyboardType:
                                                          TextInputType.text,
                                                      onChanged: (value) {},
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      obscureText: false,
                                                      placeholder:
                                                          "Digite Complemento",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 0, 0, 0),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        _RegisterContact();
                                                      }
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              30, 30, 30, 30),
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Text(
                                                        'Cadastrar',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ))
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ))
                    ]))));
  }
}

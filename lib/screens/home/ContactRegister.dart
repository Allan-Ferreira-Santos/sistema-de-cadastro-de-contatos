import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/controllers/ContactController.dart';
import 'package:test_vaga/models/Contact.dart';

import '../../components/input/Input.dart';
import '../../components/input/InputCpf.dart';
import '../../components/input/InputPhone.dart';

class ContactRegister extends StatefulWidget {
  const ContactRegister({super.key});

  @override
  State<ContactRegister> createState() => _ContactRegisterState();
}

class _ContactRegisterState extends State<ContactRegister> {
  final _formKey = GlobalKey<FormState>();

  bool result = false;

  String? district;
  String? address;
  String? city;
  String? uf;
  String? complement;
  String? number;

  final _email = TextEditingController();
  final _nome = TextEditingController();
  final _phone = TextEditingController();
  final _cpf = TextEditingController();
  final zip = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                width: size.width * 0.3,
                height: size.height * 0.9,
                decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const SizedBox(
                                      child: Icon(
                                        Icons.chevron_left_outlined,
                                        size: 30,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 10,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, top: 20),
                                    width: size.width,
                                    child: const Text(
                                      'Cadastre um novo Contato',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: const Text('Email'),
                                ),
                                SizedBox(
                                  child: Input(
                                    textStyle:
                                        const TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
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
                                    placeholder: "Digite o Email",
                                    hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: const Text('Nome'),
                                ),
                                SizedBox(
                                  child: Input(
                                    textStyle:
                                        const TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
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
                                    placeholder: "Digite seu Nome",
                                    hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: const Text('Telefone'),
                                ),
                                SizedBox(
                                    child: InputPhone(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Telefone inválido!';
                                    }
                                    return null;
                                  },
                                  onChange: (value) {
                                    setState(() {
                                      _phone.text = value;
                                    });
                                  },
                                  placeholder: 'Digite seu número com DDD',
                                  hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                )),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 10),
                                  child: const Text('Cpf'),
                                ),
                                SizedBox(
                                  child: InputCpf(
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length != 14) {
                                        return 'CPF inválido!';
                                      }
                                      return null;
                                    },
                                    onChange: (value) {
                                      setState(() {
                                        _cpf.text = value;
                                      });
                                    },
                                    placeholder: 'Digite seu CPF',
                                    hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  ),
                                ),
                                Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Cep'),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              child: Input(
                                                controller: zip,
                                                textStyle: const TextStyle(
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (value) {},
                                                fillColor: Colors.white,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Cep inválido!';
                                                  }
                                                  return null;
                                                },
                                                filled: true,
                                                obscureText: false,
                                                placeholder: "Digite o seu CEP",
                                                hintStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: InkWell(
                                                onTap: () async {
                                                  Map<String, dynamic> data = {
                                                    'cep': zip.text,
                                                  };

                                                  Map<String, dynamic>
                                                      responseZip =
                                                      await ContactController()
                                                          .searchZip(data);

                                                  log(responseZip.toString());

                                                  if (responseZip.isNotEmpty) {
                                                    setState(() {
                                                      district =
                                                          responseZip['bairro'];
                                                      address = responseZip[
                                                          'logradouro'];
                                                      city = responseZip[
                                                          'localidade'];
                                                      uf = responseZip['uf'];
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 0, 20, 0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              83,
                                                              175,
                                                              86),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                  child: const Text(
                                                    'Search',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Bairro'),
                                    ),
                                    SizedBox(
                                      child: Input(
                                        controller: TextEditingController(
                                            text: district),
                                        enabled: false,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Bairro inválido!';
                                          }
                                          return null;
                                        },
                                        filled: true,
                                        obscureText: false,
                                        placeholder: "",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Endereço'),
                                    ),
                                    SizedBox(
                                      child: Input(
                                        enabled: false,
                                        controller: TextEditingController(
                                            text: address),
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        filled: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Endereço inválido!';
                                          }
                                          return null;
                                        },
                                        obscureText: false,
                                        placeholder: "",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Numero'),
                                    ),
                                    SizedBox(
                                      child: Input(
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          setState(() {
                                            number = value;
                                          });
                                        },
                                        fillColor: Colors.white,
                                        filled: true,
                                        obscureText: false,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Numero inválido!';
                                          }
                                          return null;
                                        },
                                        placeholder: "Digite seu Numero",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Cidade'),
                                    ),
                                    SizedBox(
                                      child: Input(
                                        controller:
                                            TextEditingController(text: city),
                                        enabled: false,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        filled: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Cidade inválido!';
                                          }
                                          return null;
                                        },
                                        obscureText: false,
                                        placeholder: "",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('UF'),
                                    ),
                                    SizedBox(
                                      child: Input(
                                        controller:
                                            TextEditingController(text: uf),
                                        enabled: false,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        filled: true,
                                        obscureText: false,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'UF inválido!';
                                          }
                                          return null;
                                        },
                                        placeholder: "",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Complemento'),
                                    ),
                                    SizedBox(
                                      child: Input(
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          setState(() {
                                            complement = value;
                                          });
                                        },
                                        fillColor: Colors.white,
                                        filled: true,
                                        obscureText: false,
                                        placeholder: "Digite Complemento",
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          Map<String, dynamic> contact = {};
                                          contact['city'] = city;
                                          contact['address'] = address;
                                          contact['complement'] = complement;
                                          contact['cpf'] = _cpf.text;
                                          contact['district'] = district;
                                          contact['email'] = _email.text;
                                          contact['name'] = _nome.text;
                                          contact['number'] = number;
                                          contact['phone'] = _phone.text;
                                          contact['uf'] = uf;

                                          Map<String, dynamic> response =
                                              await ContactController()
                                                  .saveContact(contact);

                                          log(response.toString());
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            30, 30, 30, 30),
                                        padding: const EdgeInsets.all(10),
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Text(
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
                                ))
                              ],
                            )),
                      ]),
                ))));
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_vaga/controllers/ContactController.dart';
import 'package:test_vaga/helpers/Validator.dart';

import '../../components/input/Input.dart';
import '../../components/input/InputCpf.dart';
import '../../components/input/InputPhone.dart';
import '../../helpers/FunctionsClass.dart';

class ContactRegister extends StatefulWidget {
  final Map<String, dynamic>? currentContact;

  const ContactRegister({Key? key, this.currentContact}) : super(key: key);

  @override
  State<ContactRegister> createState() => _ContactRegisterState();
}

class _ContactRegisterState extends State<ContactRegister> {
  final _formKey = GlobalKey<FormState>();

  bool result = false;
  bool errorRegisterContact = false;
  bool errorSearchZip = false;
  bool edit = false;

  final mail = TextEditingController();
  final nome = TextEditingController();
  final phone = TextEditingController();
  final cpf = TextEditingController();
  final zip = TextEditingController();
  final district = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final uf = TextEditingController();
  final complement = TextEditingController();
  final number = TextEditingController();

  @override
  void initState() {
    if (widget.currentContact != null) {
      mail.text = widget.currentContact!['email'];
      nome.text = widget.currentContact!['name'];
      phone.text = widget.currentContact!['phone'];
      cpf.text = widget.currentContact!['cpf'];
      zip.text = widget.currentContact!['zip'];
      district.text = widget.currentContact!['district'];
      address.text = widget.currentContact!['address'];
      city.text = widget.currentContact!['city'];
      uf.text = widget.currentContact!['uf'];
      complement.text = widget.currentContact!['complement'];
      number.text = widget.currentContact!['number'];
      edit = true;
    }
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
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 34, 32, 32),
        body: Center(
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                width: size.width * 0.3,
                height: size.height * 0.9,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 144, 143, 141),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(bottom: 30, top: 30),
                                child: const Text(
                                  'Cadastre um novo Contato',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
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
                                    initialValue: mail.text,
                                    textStyle:
                                        const TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (Validator().emailValidator(value) !=
                                          null) {
                                        String response =
                                            Validator().emailValidator(value);

                                        return response;
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        mail.text = value;
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
                                    initialValue: nome.text,
                                    textStyle:
                                        const TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (Validator().nomeValidator(value) !=
                                          null) {
                                        String response =
                                            Validator().nomeValidator(value);

                                        return response;
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        nome.text = value;
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
                                  initialValue: phone.text,
                                  validator: (value) {
                                    if (Validator().phoneValidator(value) !=
                                        null) {
                                      String response =
                                          Validator().phoneValidator(value);

                                      return response;
                                    }
                                    return null;
                                  },
                                  onChange: (value) {
                                    setState(() {
                                      phone.text = value;
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
                                    initialValue: cpf.text,
                                    validator: (value) {
                                      if (Validator().cpfValidator(value) !=
                                          null) {
                                        String response =
                                            Validator().cpfValidator(value);

                                        return response;
                                      }
                                      return null;
                                    },
                                    onChange: (value) {
                                      setState(() {
                                        cpf.text = value;
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
                                SizedBox(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Cep'),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: SizedBox(
                                              child: Input(
                                                initialValue: zip.text,
                                                maxLength: 8,
                                                textStyle: const TextStyle(
                                                    color: Colors.black),
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (value) {
                                                  setState(() {
                                                    zip.text = value;
                                                  });
                                                },
                                                fillColor: Colors.white,
                                                validator: (value) {
                                                  if (Validator().cepValidator(
                                                          value) !=
                                                      null) {
                                                    String response =
                                                        Validator()
                                                            .cepValidator(
                                                                value);

                                                    return response;
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
                                                  if (zip.text.length > 0) {
                                                    Map<String, dynamic> data =
                                                        {
                                                      'cep': zip.text,
                                                    };

                                                    Map<String, dynamic>
                                                        responseZip =
                                                        await ContactController()
                                                            .searchZip(data);

                                                    log(responseZip.toString());

                                                    if (responseZip[
                                                            'success'] ==
                                                        true) {
                                                      setState(() {
                                                        errorSearchZip = false;

                                                        district.text =
                                                            responseZip[
                                                                'bairro'];
                                                        address.text =
                                                            responseZip[
                                                                'logradouro'];
                                                        city.text = responseZip[
                                                            'localidade'];
                                                        uf.text =
                                                            responseZip['uf'];
                                                      });
                                                    } else {
                                                      setState(() {
                                                        errorSearchZip = true;
                                                      });
                                                    }
                                                  } else {
                                                    setState(() {
                                                      errorSearchZip = true;
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
                                    if (errorSearchZip) ...[
                                      Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        width: size.width,
                                        child: const Text(
                                          'Cep não encontrado',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: const Text('Bairro'),
                                    ),
                                    SizedBox(
                                      child: Input(
                                        controller: TextEditingController(
                                            text: district.text),
                                        enabled: false,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        validator: (value) {
                                          if (Validator()
                                                  .districtValidator(value) !=
                                              null) {
                                            String response = Validator()
                                                .districtValidator(value);

                                            return response;
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
                                            text: address.text),
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        filled: true,
                                        validator: (value) {
                                          if (Validator()
                                                  .addressValidator(value) !=
                                              null) {
                                            String response = Validator()
                                                .addressValidator(value);

                                            return response;
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
                                        initialValue: number.text,
                                        maxLength: 5,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          setState(() {
                                            number.text = value;
                                          });
                                        },
                                        fillColor: Colors.white,
                                        filled: true,
                                        obscureText: false,
                                        validator: (value) {
                                          if (Validator()
                                                  .numberValidator(value) !=
                                              null) {
                                            String response = Validator()
                                                .numberValidator(value);

                                            return response;
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
                                        controller: TextEditingController(
                                            text: city.text),
                                        enabled: false,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        filled: true,
                                        validator: (value) {
                                          if (Validator()
                                                  .cityValidator(value) !=
                                              null) {
                                            String response = Validator()
                                                .cityValidator(value);

                                            return response;
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
                                        controller: TextEditingController(
                                            text: uf.text),
                                        enabled: false,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {},
                                        fillColor: Colors.white,
                                        filled: true,
                                        obscureText: false,
                                        validator: (value) {
                                          if (Validator().ufValidator(value) !=
                                              null) {
                                            String response =
                                                Validator().ufValidator(value);

                                            return response;
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
                                        initialValue: complement.text,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          setState(() {
                                            complement.text = value;
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
                                    if (errorRegisterContact) ...[
                                      Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        width: size.width,
                                        child: const Text(
                                          'Email ou cpf ja cadastrado',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                    InkWell(
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          Map<String, dynamic> contact = {};
                                          contact['city'] = city.text;
                                          contact['address'] = address.text;
                                          contact['complement'] =
                                              complement.text;
                                          contact['cpf'] = cpf.text;
                                          contact['district'] = district.text;
                                          contact['email'] = mail.text;
                                          contact['name'] = nome.text;
                                          contact['number'] = number.text;
                                          contact['zip'] = zip.text;
                                          contact['phone'] = phone.text;
                                          contact['uf'] = uf.text;
                                          if (edit) {
                                            await ContactController()
                                                .edit(contact);
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                              '/HomeScreen',
                                              (route) => false,
                                            );
                                          } else {
                                            Map<String, dynamic> response =
                                                await ContactController()
                                                    .saveContact(contact, edit);

                                            log(response.toString());

                                            if (response['success'] == true) {
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                '/HomeScreen',
                                                (route) => false,
                                              );
                                            } else {
                                              setState(() {
                                                errorRegisterContact = true;
                                              });
                                            }
                                          }
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 30, 0, 20),
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
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        padding: const EdgeInsets.all(10),
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Text(
                                          'Voltar',
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

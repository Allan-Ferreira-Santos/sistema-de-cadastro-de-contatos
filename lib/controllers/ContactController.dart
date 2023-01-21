import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';
import 'package:test_vaga/helpers/Request.dart';

class ContactController {
  searchZip(Map<String, dynamic> responseZip) async {
    String cep = responseZip['cep'];

    log(cep);

    Map<String, dynamic> data = {};

    var url = 'https://viacep.com.br/ws/$cep/json/';

    var response = await Request().request(typeRequest: true, url: url);
/* 
    log(response.toString()); */

    log("teste" + response['response']['erro'].toString());

    if (response['response']['erro'] != true) {
      data["bairro"] = response['response']['bairro'];
      data["logradouro"] = response['response']['logradouro'];
      data["localidade"] = response['response']['localidade'];
      data["uf"] = response['response']['uf'];
      data['cepError'] = false;
      data['success'] = true;
    } else {
      data['cepError'] = true;
      data['success'] = false;
    }
    return data;
  }

  /*
   * can the data be saved
   * @author  SGV
   * @param <Map<String,dynamic>> data - data contact 
   * @version 1.0 - 20230112 - initial release
   * @return  bool
   */

  Future<bool> canTheDataBeSaved(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? response = prefs.getString(PreferencesKeys.contact);

    List contacts = response != null ? json.decode(response) : [];

    if (contacts.isNotEmpty) {
      for (var i = 0; i < contacts.length; i++) {
        Map<String, dynamic> contact = contacts[i];
        if (contact['email'] == data['email'] ||
            contact['cpf'] == data['cpf']) {
          return false;
        }
      }
    }
    return true;
  }

  Future<Map<String, dynamic>> saveContact(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List contacts = [];
    Map<String, dynamic> result = {'success': false};
    String? response = prefs.getString(PreferencesKeys.contact);

    if (!await canTheDataBeSaved(data)) {
      result['checkContact'] = true;
      return result;
    }

    if (response != null && response.isNotEmpty) {
      contacts = json.decode(response);
      contacts.add(data);
    } else {
      contacts.add(data);
    }

    prefs.setString(PreferencesKeys.contact, jsonEncode(contacts));

    result['success'] = true;

    return result;
  }

  Future<List> getContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List contacts = [];

    String? response = prefs.getString(PreferencesKeys.contact);

    contacts = response != null ? jsonDecode(response) : [];

    return contacts;
  }
}

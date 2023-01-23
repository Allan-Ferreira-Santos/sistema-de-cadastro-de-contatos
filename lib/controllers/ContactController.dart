import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocode/geocode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';
import 'package:test_vaga/helpers/Request.dart';
import 'package:latlong2/latlong.dart';

class ContactController {
  /*
  * Zip code search
  * @author  Allan F Santos
  * @version 1.0 - 20230122 - initial release
  * @param Map<String, dynamic> responseZip - zip 
  * @return data
  */

  searchZip(Map<String, dynamic> responseZip) async {
    String cep = responseZip['cep'];

    log(cep);

    Map<String, dynamic> data = {};

    var url = 'https://viacep.com.br/ws/$cep/json/';

    var response = await Request().request(typeRequest: true, url: url);
    log(response.toString());

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
   * @author  Allan F Santos
   * @param <Map<String,dynamic>> data - data contact 
   * @version 1.0 - 20230122 - initial release
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

  /*
   * Save contacts
   * @author  Allan F Santos
   * @param <Map<String,dynamic>> data - data contact 
   * @param bool edit - bool edit contact 
   * @version 1.0 - 20230121 - initial release
   * @return  result
   */

  Future<Map<String, dynamic>> saveContact(
      Map<String, dynamic> data, bool edit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List contacts = [];

    Map<String, dynamic> result = {'success': false};
    String? response = prefs.getString(PreferencesKeys.contact);

    if (!await canTheDataBeSaved(data)) {
      result['checkContact'] = true;
      return result;
    }

    data = await createCoordinatesContact(data);

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

  /*
   * Edit contacts
   * @author  Allan F Santos
   * @param <Map<String,dynamic>> data - data contact 
   * @version 1.0 - 20230121 - initial release
   * @return <void>
   */

  Future<void> edit(Map<String, dynamic> data) async {
    List contacts = [];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? response = prefs.getString(PreferencesKeys.contact);

    contacts = json.decode(response!);

    for (var i = 0; i < contacts.length; i++) {
      Map<String, dynamic> currentContact = contacts[i];

      if (currentContact['cpf'] == data['cpf']) {
        data = await createCoordinatesContact(data);
        contacts[i] = data;
        await prefs.setString(PreferencesKeys.contact, jsonEncode(contacts));
      }
    }
  }

  /*
   * All contacts
   * @author  Allan F Santos 
   * @version 1.0 - 20230121 - initial release
   * @return contacts
   */

  Future<List> getContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List contacts = [];

    String? response = prefs.getString(PreferencesKeys.contact);

    contacts = response != null ? jsonDecode(response) : [];

    return contacts;
  }

  /*
   * create coordinates specific of contact
   * @author  Allan F Santos
   * @param <Map<String,dynamic>> data - data of Contact 
   * @version 1.0 - 20230122 - initial release
   * @return data
   */

  Future<Map<String, dynamic>> createCoordinatesContact(
      Map<String, dynamic> data) async {
    String addrees = data['address'] +
        ' ' +
        data['number'] +
        ', ' +
        data['district'] +
        ', ' +
        data['city'];

    GeoCode geoCode = GeoCode();
    try {
      Coordinates coordinates =
          await geoCode.forwardGeocoding(address: addrees);
      data['coordinates'] = {
        'Latitude': coordinates.latitude,
        'Longitude': coordinates.longitude
      };
    } catch (e) {
      data['coordinates'] = {
        'Latitude': '0',
        'Longitude': '0',
      };
    }
    log('##################');
    log(data.toString());
    return data;
  }

  /*
  * All markers contacts
  * @author  Allan F Santos
  * @param <List> contacts - all contacts
  * @version 1.0 - 20230122 - initial release
  * @return markers
  */

  Future<List<Marker>> allMarkersContancts(List contacts) async {
    List<Marker> markers = [];
    for (var contact = 0; contact < contacts.length; contact++) {
      Map<String, dynamic> coordinates = contacts[contact]['coordinates'];

      markers.add(
        Marker(
          width: 100,
          height: 100,
          point: LatLng(double.parse(coordinates['Latitude'].toString()),
              double.parse(coordinates['Longitude'].toString())),
          builder: (ctx) => const Icon(
            Icons.add_location_sharp,
            color: Colors.green,
          ),
        ),
      );
    }
    return markers;
  }

  /*
   * Delete contact
   * @author  Allan F Santos
   * @param <String> id - id of Contact 
   * @version 1.0 - 20230121 - initial release
   * @return <void>
   */

  Future<void> deleteContact(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List contacts = [];

    String? response = prefs.getString(PreferencesKeys.contact);

    contacts = jsonDecode(response!);

    for (var contact = 0; contact < contacts.length; contact++) {
      Map<String, dynamic> currentContact = contacts[contact];
      if (id == currentContact['cpf']) {
        contacts.removeAt(contact);
      }
    }
    prefs.setString(PreferencesKeys.contact, jsonEncode(contacts));
  }
}

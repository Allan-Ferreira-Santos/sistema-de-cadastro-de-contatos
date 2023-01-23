import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  /*
   * Request
   * @author  Allan F Santos
   * @param url - url 
   * @param bool typeRequest - Type request
   * @version 1.0 - 20230122 - initial release
   * @return  result
   */

  Future<Map<String, dynamic>> request(
      {String? url, bool typeRequest = true}) async {
    Map<String, dynamic> result = {'success': false};

    var response = typeRequest
        ? await http.get(Uri.parse(url!))
        : await http.post(Uri.parse(url!));
    if (response.statusCode == 200) {
      result['success'] = true;
      result['response'] = jsonDecode(response.body);
    }
    return result;
  }
}

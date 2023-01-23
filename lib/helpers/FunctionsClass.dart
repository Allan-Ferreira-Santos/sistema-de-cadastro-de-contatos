import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vaga/Constants.dart';

class FunctionsClass {
  /*
   * Verify if login to user
   * @author  Allan F Santos
   * @version 1.0 - 20230122 - initial release
   * @return  bool
   */
  Future<bool> verifyInternalUrl() async {
    bool session = false;
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(PreferencesKeys.firstRun) == true) {
      session = true;
    }
    return session;
  }

  /*
  * Delete accent in String
  * @author  Allan F Santos
  * @version 1.0 - 20230122 - initial release
  * @return  String
  */

  static String removeAccents(String str) {
    var withDia =
        'ŠŒŽšœžŸ¥µÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøüùúûýýþÿŔŕƒ';
    var withoutDia =
        'SOZsozYYuaaaaaaaceeeeiiiidnoooooouuuuybsaaaaaaaceeeeiiiidnoooooouuuuyybyRra';
    for (int i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }
    return str;
  }
}

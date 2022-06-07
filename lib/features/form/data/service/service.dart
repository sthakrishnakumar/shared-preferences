import 'package:shared_preferences/shared_preferences.dart';

class Service {
  saveData({required String data}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('form_data', data);
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('form_data');
  }
}

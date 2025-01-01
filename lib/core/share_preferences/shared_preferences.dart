import 'package:shared_preferences/shared_preferences.dart';

void storePassword(String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('user_password', password);
}

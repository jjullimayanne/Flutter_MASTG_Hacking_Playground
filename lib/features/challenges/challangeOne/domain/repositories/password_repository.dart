import 'package:shared_preferences/shared_preferences.dart';

class PasswordRepository {
  final SharedPreferences _prefs;

  PasswordRepository(this._prefs);

  Future<void> savePassword(String password) async {
    await _prefs.setString(
        'user_password', password); // Armazenando a senha de forma insegura
  }

  String? getStoredPassword() {
    return _prefs.getString('user_password'); // Recuperando a senha armazenada
  }
}

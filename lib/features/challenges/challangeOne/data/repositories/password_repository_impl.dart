import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/password_repository.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final SharedPreferences _prefs;

  PasswordRepositoryImpl(this._prefs);

  @override
  Future<void> savePassword(String password) async {
    await _prefs.setString(
        'user_password', password); // Senha armazenada de forma insegura
  }

  @override
  String? getStoredPassword() {
    return _prefs.getString('user_password');
  }
}

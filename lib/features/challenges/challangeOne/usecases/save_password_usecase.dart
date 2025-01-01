import 'package:flutter_uncrackable/features/challenges/challangeOne/domain/repositories/password_repository.dart';


class SavePasswordUseCase {
  final PasswordRepository _passwordRepository;

  SavePasswordUseCase(this._passwordRepository);

  Future<void> execute(String password) async {
    await _passwordRepository
        .savePassword(password); 
  }
}

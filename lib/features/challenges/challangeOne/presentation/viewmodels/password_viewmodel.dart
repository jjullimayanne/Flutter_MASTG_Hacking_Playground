import 'package:flutter_uncrackable/features/challenges/challangeOne/usecases/validate_password_usecase.dart';

class PasswordViewModel {
  final ValidatePasswordUseCase validatePasswordUseCase;

  PasswordViewModel(this.validatePasswordUseCase);

  String validatePassword(String inputPassword) {
    return validatePasswordUseCase.execute(inputPassword);
  }
}

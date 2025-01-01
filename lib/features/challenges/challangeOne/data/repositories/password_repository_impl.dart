import 'package:flutter_uncrackable/features/challenges/challangeOne/domain/entities/password_result_entity.dart';

import '../../domain/repositories/password_repository.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  @override
  PasswordResult validatePassword(String password) {
    const correctPassword = "SuperSecretKey123";
    if (password == correctPassword) {
      return PasswordResult(
        isSuccess: true,
        message: "Correct! Here is your flag: FLAG{flutter_is_secure}",
      );
    } else {
      return PasswordResult(
        isSuccess: false,
        message: "Incorrect password. Try again.",
      );
    }
  }
}

import 'package:flutter_uncrackable/features/challenges/challangeOne/domain/entities/password_result_entity.dart';

abstract class PasswordRepository {
  PasswordResult validatePassword(String password);
}

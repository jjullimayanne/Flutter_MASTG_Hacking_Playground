import 'package:flutter_uncrackable/features/challenges/domain/entities/challenge_entity.dart';

abstract class ChallengeRepository {
  List<Challenge> fetchChallenges();
}

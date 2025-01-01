import 'package:flutter_uncrackable/features/challenges/domain/repositories/challenge_repository.dart';

import '../../domain/entities/challenge_entity.dart';

class ChallengeRepositoryImpl implements ChallengeRepository {
  @override
  List<Challenge> fetchChallenges() {
    return [
      Challenge(title: 'Desafio 1', id: 'challenge1'),
      Challenge(title: 'Desafio 2', id: 'challenge2'),
    ];
  }
}

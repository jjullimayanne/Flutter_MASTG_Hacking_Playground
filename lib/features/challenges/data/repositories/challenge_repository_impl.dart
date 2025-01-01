import 'package:flutter_uncrackable/features/challenges/domain/repositories/challenge_repository.dart';

import '../../domain/entities/challenge_entity.dart';

class ChallengeRepositoryImpl implements ChallengeRepository {
  @override
  List<Challenge> fetchChallenges() {
    return [
      Challenge(
        title: 'Validação de Senha e Primeiros Conceitos de Segurança',
        id: 'challenge1',
        isAvailable: true,
      ),
      Challenge(
        title: 'Desafio de Comunicação Insegura',
        id: 'challenge2',
      ),
      Challenge(
        title: 'Desafio de Depuração Insegura',
        id: 'challenge2',
      ),
      Challenge(
        title: 'Desafio de Manipulação de Sessão e Autenticação',
        id: 'challenge2',
      ),
      Challenge(
        title: 'Desafio de Armazenamento Seguro',
        id: 'challenge2',
      ),
      Challenge(
        title: 'Desafio de Permissões Excessivas',
        id: 'challenge2',
      ),
      Challenge(
        title: 'Desafio de Logging Inseguro',
        id: 'challenge2',
      ),
      Challenge(
        title: 'Desafio de Validação de Entrada e Prevenção de Injeção',
        id: 'challenge2',
      ),
    ];
  }
}

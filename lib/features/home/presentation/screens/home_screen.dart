import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/features/challenges/data/repositories/challenge_repository_impl.dart';
import 'package:flutter_uncrackable/features/challenges/domain/entities/challenge_entity.dart';
import 'package:flutter_uncrackable/features/home/usecase/get_route_by_id_usecase.dart';

class HomeScreen extends StatelessWidget {
  final ChallengeRepositoryImpl repository;
  final GetRouteByIdUsecase getRouteById;

  HomeScreen({
    super.key,
  })  : repository = ChallengeRepositoryImpl(),
        getRouteById = GetRouteByIdUsecase();

  @override
  Widget build(BuildContext context) {
    final challenges = repository.fetchChallenges();

    return Scaffold(
      appBar: AppBar(
        title: const Text('UnCrackable Flutter Challenges'),
      ),
      body: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final Challenge challenge = challenges[index];
          return ListTile(
            title: Text(challenge.title),
            trailing: const Icon(Icons.arrow_forward),
            onTap: challenge.isAvailable
                ? () {
                    final route = getRouteById(challenge.id);
                    if (route != null) {
                      Navigator.pushNamed(context, route);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Rota não encontrada')),
                      );
                    }
                  }
                : null,
            subtitle: challenge.isAvailable
                ? null
                : const Text('Desafio ainda não disponível',
                    style: TextStyle(color: Colors.grey)),
          );
        },
      ),
    );
  }
}

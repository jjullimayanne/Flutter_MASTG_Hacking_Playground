import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/core/routes/routes_constants.dart';
import 'package:flutter_uncrackable/features/challenges/challangeOne/presentation/screens/password_screen.dart';
import 'package:flutter_uncrackable/features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteNames.challenge1:
        return MaterialPageRoute(builder: (_) => const PasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota não encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/core/routes/route.dart';
import 'package:flutter_uncrackable/core/routes/routes_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter UnCrackable',
      initialRoute: RouteNames.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

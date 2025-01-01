import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/core/routes/route.dart';
import 'package:flutter_uncrackable/core/routes/routes_constants.dart';

import 'features/challenges/challangeOne/core/utils/integrity_checker.dart';

void main() {
  if (!kDebugMode) {
    IntegrityChecker.checkAppIntegrity();
    if (IntegrityChecker.isDebuggerAttached()) {
      throw Exception("Debugger detected!");
    }
  }

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

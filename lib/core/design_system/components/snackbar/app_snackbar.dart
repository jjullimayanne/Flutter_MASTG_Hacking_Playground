import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/core/design_system/colors/app_colors.dart';

class AppSnackbar {
  static void show(BuildContext context, String message,
      {bool isError = true}) {
    final color = isError ? AppColors.error : AppColors.success;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

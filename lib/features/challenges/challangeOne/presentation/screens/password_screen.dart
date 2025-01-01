import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/core/design_system/components/buttons/app_button.dart';
import 'package:flutter_uncrackable/core/design_system/components/snackbar/app_snackbar.dart';
import 'package:flutter_uncrackable/features/challenges/challangeOne/usecases/validate_password_usecase.dart';

import '../viewmodels/password_viewmodel.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _controller = TextEditingController();
  late final PasswordViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PasswordViewModel(ValidatePasswordUseCase());
  }

  void _onSubmit() {
    final input = _controller.text;
    final resultMessage = _viewModel.validatePassword(input);

    AppSnackbar.show(
      context,
      resultMessage,
      isError: resultMessage.contains("incorreta"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UnCrackable Level 1")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite a Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              label: "Verificar",
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

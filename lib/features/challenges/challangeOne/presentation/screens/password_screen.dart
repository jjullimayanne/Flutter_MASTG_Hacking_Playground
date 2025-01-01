import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/core/design_system/components/buttons/app_button.dart';
import 'package:flutter_uncrackable/core/design_system/components/snackbar/app_snackbar.dart';
import 'package:flutter_uncrackable/features/challenges/challangeOne/data/repositories/password_repository_impl.dart';
import 'package:flutter_uncrackable/features/challenges/challangeOne/usecases/save_password_usecase.dart';
import 'package:flutter_uncrackable/features/challenges/challangeOne/usecases/validate_password_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../viewmodels/password_viewmodel.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _controller = TextEditingController();
  late final PasswordViewModel _viewModel;
  late final SavePasswordUseCase _savePasswordUseCase;
  bool _isPasswordVisible = false;
  bool _savePassword = false;

  @override
  void initState() {
    super.initState();
    _viewModel = PasswordViewModel(ValidatePasswordUseCase());
    _initializeUseCase();
  }

  void _initializeUseCase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final passwordRepository = PasswordRepositoryImpl(prefs);
    _savePasswordUseCase = SavePasswordUseCase(passwordRepository);
  }

  void _onSubmit() async {
    final input = _controller.text;
    final resultMessage = _viewModel.validatePassword(input);

    AppSnackbar.show(
      context,
      resultMessage,
      isError: resultMessage.contains("incorreta"),
    );

    if (_savePassword) {
      await _savePasswordUseCase.execute(input);
      AppSnackbar.show(
        context,
        'Senha salva com sucesso!',
        isError: false,
      );
    }
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
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Digite a Senha',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _savePassword,
                  onChanged: (bool? value) {
                    setState(() {
                      _savePassword = value!;
                    });
                  },
                ),
                const Text('Salvar Senha'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppButton(
          label: "Verificar",
          onPressed: _onSubmit,
        ),
      ),
    );
  }
}

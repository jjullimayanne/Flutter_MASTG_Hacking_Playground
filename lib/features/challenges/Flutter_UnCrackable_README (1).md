
# Flutter UnCrackable - Replicando OWASP MASP

Bem-vindo ao **Flutter UnCrackable**, um projeto inspirado no **OWASP Mobile Application Security Project (MASP)**. 
Este repositório visa replicar os conceitos de segurança mobile apresentados no OWASP, adaptados para o desenvolvimento em **Flutter**. Aqui você encontrará implementações práticas, desafios de segurança e exemplos para aprimorar suas habilidades de segurança mobile com Flutter.

## Objetivo do Projeto

O objetivo deste projeto é:
- Demonstrar como implementar medidas de segurança em aplicativos Flutter.
- Replicar os desafios clássicos de segurança, como o **UnCrackable-Level1.apk**, no contexto do Flutter.
- Fornecer exemplos práticos de como proteger aplicativos contra ameaças comuns.

## Estrutura Inicial do App

O projeto está configurado com as seguintes funcionalidades básicas:

### **1. Tela Inicial (Home Screen)**
A tela inicial lista os desafios disponíveis no app.
- Permite navegar até desafios específicos através de uma interface limpa e organizada.
- Cada desafio é tratado como uma feature independente.

**Exemplo de código:**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_uncrackable/features/challenges/data/repositories/challenge_repository_impl.dart';
import 'package:flutter_uncrackable/features/challenges/domain/entities/challenge_entity.dart';
import 'package:flutter_uncrackable/features/home/usecase/get_route_by_id_usecase.dart';

class HomeScreen extends StatelessWidget {
  final ChallengeRepositoryImpl repository;
  final GetRouteByIdUsecase getRouteById;

  // TODO: Implementar Dependency Injection (DI) no futuro para gerenciar dependências.

  HomeScreen({
    super.key,
  })  : repository = ChallengeRepositoryImpl(),
        getRouteById = GetRouteByIdUsecase();

  @override
  Widget build(BuildContext context) {
    final challenges = repository.fetchChallenges();

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Desafios')),
      body: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final Challenge challenge = challenges[index];
          return ListTile(
            title: Text(challenge.title),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              final route = getRouteById(challenge.id);
              if (route != null) {
                Navigator.pushNamed(context, route);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Rota não encontrada')),
                );
              }
            },
          );
        },
      ),
    );
  }
}
```

---

### **2. Desafio 1: Validação de Senha**
Uma tela simples que valida a senha inserida pelo usuário.
- Ao inserir a senha correta, exibe uma flag.
- Implementa lógica básica de validação.

**Exemplo de código:**

```dart
import 'package:flutter/material.dart';

import '../../data/repositories/password_repository_impl.dart';
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
    _viewModel = PasswordViewModel(PasswordRepositoryImpl());
  }

  void _onSubmit() {
    setState(() {
      _viewModel.validatePassword(_controller.text);
    });
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
              decoration: const InputDecoration(labelText: 'Enter Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text("Submit"),
            ),
            const SizedBox(height: 16),
            Text(_viewModel.message),
          ],
        ),
      ),
    );
  }
}
```

---

## Próximos Passos

### **1. Adicionar Proteções**
- **Proteção contra Debugging**
  - Detectar quando o app está sendo depurado e bloquear a execução.

- **Verificação de Integridade**
  - Implementar verificação de hash para evitar modificações no APK.

- **Ofuscação**
  - Ativar ofuscação no build de release para dificultar a engenharia reversa.

### **2. Novos Desafios**
- **Armazenamento Inseguro**
  - Demonstrar como dados podem ser comprometidos ao usar `SharedPreferences` sem criptografia.

- **Comunicação Insegura**
  - Simular comunicações HTTP sem validação TLS.

- **Hardcoding de Chaves**
  - Exemplo de chaves e credenciais embutidas no código-fonte.

### **3. Melhorar Arquitetura**
- Implementar **Dependency Injection (DI)** para gerenciar dependências.
- Adicionar testes unitários e de integração para os desafios.

---

## Como Executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seuprojeto/flutter-uncrackable.git
   cd flutter-uncrackable
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:
   ```bash
   flutter run
   ```

---

## Recursos Adicionais

- [OWASP Mobile Security Testing Guide (MASTG)](https://owasp.org/www-project-mobile-security-testing-guide/)
- [OWASP Mobile Application Security Verification Standard (MASVS)](https://owasp.org/www-project-mobile-security/masvs/)
- [Documentação Flutter](https://flutter.dev/docs)

---

**Disclaimer:** Este projeto é destinado a fins educacionais. Não utilize as técnicas aqui descritas para comprometer aplicativos ou sistemas que você não possui autorização para testar.

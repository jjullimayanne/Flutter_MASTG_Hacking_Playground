
# Flutter UnCrackable - Replicando OWASP MASP

Bem-vindo ao **Flutter UnCrackable**, um projeto inspirado no **OWASP Mobile Application Security Project (MASP)**. 
Este repositório visa replicar os conceitos de segurança mobile apresentados no OWASP, adaptados para o desenvolvimento em **Flutter**. Aqui você encontrará implementações práticas, desafios de segurança e exemplos para aprimorar suas habilidades de segurança mobile com Flutter.

<img src="https://github.com/user-attachments/assets/a8873ca7-d405-48b9-82b0-7724d53318cf" alt="Descrição da imagem" width="300">

## Objetivo do Projeto

O objetivo deste projeto é:
- Demonstrar como implementar medidas de segurança em aplicativos Flutter.
- Replicar os desafios clássicos de segurança, como o **UnCrackable-Level1.apk**, no contexto do Flutter.
- Fornecer exemplos práticos de como proteger aplicativos contra ameaças comuns.

## Estrutura do Projeto

O projeto segue uma arquitetura **Clean Architecture MVVM**, com a seguinte organização:

```plaintext
lib/
├── core/
│   └── utils/
│       └── integrity_checker.dart    // Verificação de integridade do aplicativo
├── data/
│   └── repositories/
│       └── password_repository_impl.dart  // Implementação do repositório
├── domain/
│   ├── entities/
│   │   └── password_result.dart      // Resultado da validação
│   └── repositories/
│       └── password_repository.dart  // Interface do repositório
├── presentation/
│   ├── viewmodels/
│   │   └── password_viewmodel.dart   // Lógica do ViewModel
│   └── views/
│       └── password_screen.dart      // Tela principal
└── main.dart                         // Configurações iniciais
```

## O que é OWASP MASP?

O **OWASP Mobile Application Security Project (MASP)** é uma iniciativa que fornece diretrizes e ferramentas para criar aplicativos móveis seguros. Ele abrange:
- **OWASP MASVS (Mobile Application Security Verification Standard):** Padrão de verificação de segurança para aplicativos móveis.
- **OWASP MASTG (Mobile Application Security Testing Guide):** Guia de teste de segurança para aplicativos móveis.

Este projeto foca em replicar alguns conceitos do MASP para Flutter, como:
- Verificações de integridade do aplicativo.
- Bloqueio contra debugging e análise dinâmica.
- Implementação de proteção básica contra engenharia reversa.

## Segurança em Flutter: Boas Práticas

Aqui estão algumas práticas essenciais para desenvolver aplicativos Flutter mais seguros:

1. **Evite Chaves Hardcoded**
   - Nunca inclua chaves de API ou informações sensíveis diretamente no código.
   - Use soluções como **Secure Storage** ou serviços como o **Firebase Remote Config**.

2. **Ative a Ofuscação**
   - Para proteger o código do aplicativo, ative a ofuscação nas configurações do build com ProGuard ou R8.
   - Adicione regras ao arquivo `proguard-rules.pro`.

3. **Implemente SSL Pinning**
   - Proteja a comunicação do aplicativo com servidores backend implementando **SSL Pinning**.

4. **Valide Entradas**
   - Sempre valide as entradas do usuário no cliente e no servidor.

5. **Use Flutter Secure Storage**
   - Armazene informações confidenciais, como tokens de autenticação, usando o pacote **flutter_secure_storage**.

6. **Desabilite Debugging em Produção**
   - Detecte e bloqueie o modo de depuração em tempo de execução para evitar exploração.

## Desafio 1: Validação de Senha e Primeiros Conceitos de Segurança

<img src="https://github.com/user-attachments/assets/100dd110-fe71-4ae3-9927-9f47fdb35e63" alt="Descrição da imagem" width="300">



No **Desafio 1**, você aprenderá e implementará os seguintes conceitos de segurança:

### **1. Validação de Entradas**
- **Por que é importante?**
  - Entradas do usuário podem ser exploradas para ataques como *SQL Injection* ou bypass de lógica.
- **O que implementar?**
  - Lógica de validação simples para verificar uma senha fixa.
- **Exemplo:**
  ```dart
  void validatePassword(String password) {
    if (password == "SuperSecretKey123") {
      print("FLAG{flutter_is_secure}");
    } else {
      print("Senha incorreta. Tente novamente.");
    }
  }
  ```

### **2. Debugger Detection**
- **Por que é importante?**
  - Debuggers podem ser usados para inspecionar, alterar ou bypassar lógica sensível no aplicativo.
- **O que implementar?**
  - Detectar a presença de depuradores e bloquear a execução.
- **Exemplo:**
  ```dart
  import 'dart:developer';

  bool isDebuggerAttached() {
    bool debug = false;
    assert(debug = true);
    return debug;
  }

  void checkDebugger() {
    if (isDebuggerAttached()) {
      throw Exception("Debugger detectado! Execução interrompida.");
    }
  }
  ```

### **3. Verificação de Integridade**
- **Por que é importante?**
  - Certifica-se de que o aplicativo não foi modificado (por exemplo, via engenharia reversa).
- **O que implementar?**
  - Verificação de hash hardcoded do APK.
- **Exemplo:**
  ```dart
  String calculateAppHash() {
    return "abc123";
  }

  void checkAppIntegrity() {
    if (calculateAppHash() != "abc123") {
      throw Exception("Falha na verificação de integridade!");
    }
  }
  ```

### **4. Ofuscação de Código**
- **Por que é importante?**
  - Dificulta a engenharia reversa do código.
- **O que implementar?**
  - Configurar ofuscação no build de release.
- **Comando:**
  ```bash
  flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols
  ```

---

## Pré-requisitos

- **Flutter SDK**: Certifique-se de ter o Flutter instalado ([Guia de Instalação](https://flutter.dev/docs/get-started/install)).
- **Ambiente Android ou iOS Configurado**: Dispositivo físico ou emulador.
- **Ferramentas de Segurança**: Se desejar testar a segurança do aplicativo, instale ferramentas como **JADX**, **Frida** e **Objection**.

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

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests para melhorar o projeto.

## Recursos Adicionais

- [OWASP Mobile Security Testing Guide (MASTG)](https://owasp.org/www-project-mobile-security-testing-guide/)
- [OWASP Mobile Application Security Verification Standard (MASVS)](https://owasp.org/www-project-mobile-security/masvs/)
- [Documentação Flutter](https://flutter.dev/docs)

---

**Disclaimer:** Este projeto é destinado a fins educacionais. Não utilize as técnicas aqui descritas para comprometer aplicativos ou sistemas que você não possui autorização para testar.

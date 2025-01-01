
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

# Vulnerabilidades e Como Explorá-las

Aqui estão as vulnerabilidades presentes no seu app Flutter, juntamente com as ferramentas que podem ser usadas para explorá-las e como realizar a exploração.

## 1. Armazenamento Inseguro de Senhas (Hardcoded)
**Vulnerabilidade**: A senha está hardcoded no código, o que significa que ela está diretamente exposta no código-fonte e pode ser facilmente extraída.

### Como Explorar:
- **Ferramentas**:
  - **JADX** ou **APKTool**: Usadas para descompilar o APK e procurar pela senha hardcoded no código-fonte.
  - **Frida**: Pode ser usada para manipular a execução do código em tempo real e modificar a senha ou verificar sua presença na memória do dispositivo.

### Passos para Explorar:
1. Descompilar o APK com **JADX** ou **APKTool**.
2. Procure pela string "SuperSecretKey123" no código.
3. Use **Frida** para alterar a senha ou manipular a validação de senha.

---

## 2. Armazenamento Inseguro de Senha no SharedPreferences
**Vulnerabilidade**: A senha, quando salva, é armazenada em SharedPreferences de forma insegura (sem criptografia), o que torna fácil para um atacante acessar essa senha se tiver acesso ao dispositivo.

### Como Explorar:
- **Ferramentas**:
  - **Frida** ou **Objection**: Usadas para inspecionar e manipular os dados armazenados no SharedPreferences enquanto o app está em execução.
  - **JADX/Objection**: Para inspecionar o arquivo APK e verificar onde a senha é armazenada sem criptografia.

### Passos para Explorar:
1. Utilize **Frida** ou **Objection** para acessar e modificar o valor armazenado no SharedPreferences.
2. Procure pela chave `'user_password'` dentro dos dados do SharedPreferences e obtenha o valor armazenado.

---

## 3. Falta de Criptografia e Validação Adequada
**Vulnerabilidade**: Não há criptografia para armazenar dados sensíveis e a validação da senha é feita com uma comparação simples, facilitando o bypass de segurança.

### Como Explorar:
- **Ferramentas**:
  - **Frida** ou **Objection**: Permitem manipular a lógica de validação da senha em tempo de execução.
  - **JADX**: Para procurar a função de validação e modificar a senha.

### Passos para Explorar:
1. Use **Frida** ou **Objection** para interceptar a validação de senha.
2. Modifique o valor da variável que armazena a senha ou altere o fluxo de execução para contornar a validação.

---

## 4. Falha de Verificação de Integridade (Sem Proteção contra Depuração)
**Vulnerabilidade**: O app não verifica adequadamente a presença de um depurador, permitindo que ferramentas como Frida ou JDB possam ser usadas para burlar o código.

### Como Explorar:
- **Ferramentas**:
  - **Frida**: Permite injetar código JavaScript no app em tempo de execução e manipular variáveis ou funções.
  - **JDB**: Ferramenta de depuração que pode ser usada para inspecionar o comportamento do app e manipular a execução.

### Passos para Explorar:
1. Use **Frida** para manipular a execução do app enquanto ele está sendo depurado, ignorando a falha de verificação de integridade.
2. Utilize **JDB** para depurar o app e modificar o fluxo de execução.

---

## 5. Armazenamento Inseguro de Tokens de Sessão
**Vulnerabilidade**: O token de sessão ou outros dados sensíveis são armazenados em SharedPreferences ou outro armazenamento inseguro sem criptografia.

### Como Explorar:
- **Ferramentas**:
  - **Frida** ou **Objection**: Permitem acessar e modificar dados armazenados no SharedPreferences em tempo de execução.
  - **JADX**: Usado para verificar onde os tokens estão armazenados no código.

### Passos para Explorar:
1. Use **Frida** ou **Objection** para acessar o **SharedPreferences** e recuperar tokens de sessão armazenados.
2. Modifique os dados sensíveis, como tokens ou credenciais.

---

## 7. Permitir Depuração em Produção (Sem Proteção contra Ferramentas como Frida)
**Vulnerabilidade**: O app permite que ferramentas de depuração como Frida e Objection sejam usadas sem qualquer tipo de proteção para interromper a execução ou detectar a presença de depuradores.

### Como Explorar:
- **Ferramentas**:
  - **Frida** ou **Objection**: Permitem manipular o app em tempo de execução, injetar código e burlar a lógica de segurança.
  
### Passos para Explorar:
1. Use **Frida** ou **Objection** para interagir dinamicamente com o app.
2. Modifique o comportamento do app para contornar qualquer proteção de depuração.

---

## Conclusão

Essas são as principais vulnerabilidades no seu app Flutter e as ferramentas que podem ser usadas para explorá-las. A exploração dessas falhas pode ser feita de forma **educacional** para entender como melhorar a segurança dos aplicativos móveis.


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

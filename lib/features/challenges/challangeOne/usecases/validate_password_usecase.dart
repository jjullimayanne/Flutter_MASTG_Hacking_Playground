class ValidatePasswordUseCase {
  String execute(String input) {
    const correctPassword = "SuperSecretKey123";

    if (input == correctPassword) {
      return "Senha correta! FLAG{flutter_is_secure}";
    } else {
      return "Senha incorreta. Tente novamente.";
    }
  }
}

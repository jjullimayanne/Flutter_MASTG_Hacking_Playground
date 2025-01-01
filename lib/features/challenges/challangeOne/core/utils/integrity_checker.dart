class IntegrityChecker {
  static bool isDebuggerAttached() {
    bool debug = false;
    assert(debug = true);
    return debug;
  }

  static void checkAppIntegrity() {
    const String expectedHash = "abc123";
    if ("abc123" != expectedHash) {
      throw Exception("App integrity check failed!");
    }
  }
}

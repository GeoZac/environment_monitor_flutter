class TokenSingleton {
  // The single instance of TokenSingleton (private internal constructor)
  static final TokenSingleton _singleton = TokenSingleton._internal();

  /// Factory constructor that always returns the same instance
  factory TokenSingleton() {
    return _singleton;
  }

  /// Private internal constructor to prevent direct instantiation
  TokenSingleton._internal();

  /// The bearer token shared across the application
  String? bearerToken;
}

class TokenSingleton {
  static final TokenSingleton _singleton = TokenSingleton._internal();

  factory TokenSingleton() {
    return _singleton;
  }

  TokenSingleton._internal();

  String? bearerToken;
}

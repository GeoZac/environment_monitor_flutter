import 'package:environment_monitor/utils/token_singleton.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Token Singleton Test', () {
    TokenSingleton singleton1 = TokenSingleton();
    TokenSingleton singleton2 = TokenSingleton();

    singleton1.bearerToken = "token1";
    String? token1 = singleton1.bearerToken;
    String? token2 = singleton2.bearerToken;

    expect(token1, equals("token1"));
    expect(token2, equals("token1"));
    expect(singleton1, same(singleton2));
  });
}

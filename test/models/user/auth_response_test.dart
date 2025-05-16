import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:environment_monitor/models/user/auth_response.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test AuthResponse.fromJson', () {
    // Sample JSON data
    final json = {
      "expires": 3600,
      "unconvUser": {
        "id": "8058c27e-6a6c-4bd0-95b4-c47f08eb5e31",
        "username": "new_user",
        "email": "testuser@gmail.com",
      },
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJ1c2VybmFtZSI6Im5ld191c2VyIiwiaWF0IjoxNjkyNTAyNTk2LCJpc3MiOiJ1bmNvbnYiLCJleHAiOjE2OTI1MDYxOTZ9.DDamZcTHVkI_m4KUV9AVIFDQ9XbeyEsAix7Kz9CTQUg",
    };

    final AuthResponse authResponse = AuthResponse.fromJson(json);

    // Verify the values
    expect(authResponse.expires, 3600);
    expect(authResponse.unconvUser.id, "8058c27e-6a6c-4bd0-95b4-c47f08eb5e31");
    expect(authResponse.unconvUser.username, "new_user");
    expect(authResponse.unconvUser.email, "testuser@gmail.com");
  });

  test("Failure", (() {
    // Test case 2: JSON missing 'id' field
    final json2 = {
      "expires": 3600,
    };

    expect(() => AuthResponse.fromJson(json2), throwsFormatException);
  }));

  test('AuthResponse.toJson() should return a valid JSON map', () {
    // Create an instance of the class to test
    final instance = AuthResponse(
      expires: 7200,
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
        accountNonExpired: true,
        accountNonLocked: true,
        credentialsNonExpired: true,
        enabled: true,
        authorities: [
          UnconvAuthority.unconvUser,
        ],
      ),
      token:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJ1c2VybmFtZSI6Im5ld191c2VyIiwiaWF0IjoxNjkyNTAyNTk2LCJpc3MiOiJ1bmNvbnYiLCJleHAiOjE2OTI1MDYxOTZ9.DDamZcTHVkI_m4KUV9AVIFDQ9XbeyEsAix7Kz9CTQUg",
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['expires'], equals(7200));
    expect(json['unconvUser']['id'],
        equals('a5bbd1bd-c89b-4219-b0a8-379abe41b879'));
    expect(json['unconvUser']['username'], equals("Test User"));
    expect(json['unconvUser']['email'], equals("test@example.com"));
  });
}

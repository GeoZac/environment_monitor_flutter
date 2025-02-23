import 'package:environment_monitor/models/exception/bad_request_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BadRequestResponse', () {
    test('should parse from JSON correctly', () {
      final jsonResponse = {
        "type": "https://zalando.github.io/problem/constraint-violation",
        "status": 400,
        "violations": [
          {"field": "email", "message": "E-mail cannot be empty"},
          {"field": "password", "message": "Invalid Password"},
          {"field": "password", "message": "Password cannot be empty"},
          {"field": "username", "message": "Invalid Username"},
          {"field": "username", "message": "Username cannot be empty"}
        ],
        "title": "Constraint Violation"
      };

      final response = BadRequestResponse.fromJson(jsonResponse);

      expect(response.type,
          "https://zalando.github.io/problem/constraint-violation");
      expect(response.status, 400);
      expect(response.violations, hasLength(5));
      expect(response.violations![0].field, "email");
      expect(response.violations![0].message, "E-mail cannot be empty");
      expect(response.violations![1].field, "password");
      expect(response.violations![1].message, "Invalid Password");
      expect(response.title, "Constraint Violation");
    });
  });
}

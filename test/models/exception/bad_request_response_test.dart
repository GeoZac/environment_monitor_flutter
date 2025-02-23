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

    test('should convert to JSON correctly', () {
      final response = BadRequestResponse(
        type: "https://example.com/probs/out-of-credit",
        status: 400,
        violations: [
          Violations(field: "email", message: "Email is required"),
          Violations(
              field: "password",
              message: "Password must be at least 6 characters long"),
        ],
        title: "Bad Request",
      );

      final jsonResponse = response.toJson();

      expect(jsonResponse['type'], "https://example.com/probs/out-of-credit");
      expect(jsonResponse['status'], 400);
      expect(jsonResponse['violations'], hasLength(2));
      expect(jsonResponse['violations'][0]['field'], "email");
      expect(jsonResponse['violations'][0]['message'], "Email is required");
      expect(jsonResponse['violations'][1]['field'], "password");
      expect(jsonResponse['violations'][1]['message'],
          "Password must be at least 6 characters long");
      expect(jsonResponse['title'], "Bad Request");
    });
  });

  group('Violations', () {
    test('should parse from JSON correctly', () {
      final jsonViolation = {"field": "email", "message": "Email is required"};

      final violation = Violations.fromJson(jsonViolation);

      expect(violation.field, "email");
      expect(violation.message, "Email is required");
    });

    test('should convert to JSON correctly', () {
      final violation =
          Violations(field: "email", message: "Email is required");

      final jsonViolation = violation.toJson();

      expect(jsonViolation['field'], "email");
      expect(jsonViolation['message'], "Email is required");
    });
  });
}

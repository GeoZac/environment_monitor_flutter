import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/navigation/sensor_system_form_arguments.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SensorSystemFormArguments', () {
    test('should store and return the provided UnconvUser', () {
      final user = UnconvUser(
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
      );

      final args = SensorSystemFormArguments(user);

      expect(args.unconvUser, equals(user));
    });
  });
}

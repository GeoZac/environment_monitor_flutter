import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnconvAuthority.fromString', () {
    test('returns correct enum for valid strings', () {
      expect(UnconvAuthority.fromString('UNCONV_USER'),
          UnconvAuthority.unconvUser);
      expect(UnconvAuthority.fromString('UNCONV_ADMIN'),
          UnconvAuthority.unconvAdmin);
      expect(UnconvAuthority.fromString('UNCONV_TENANT'),
          UnconvAuthority.unconvTenant);
      expect(UnconvAuthority.fromString('UNCONV_MANAGER'),
          UnconvAuthority.unconvManager);
    });

    test('throws FormatException for invalid string', () {
      expect(
        () => UnconvAuthority.fromString('INVALID'),
        throwsFormatException,
      );
    });
  });

  group('UnconvAuthority.toJsonString', () {
    test('returns correct string for each enum value', () {
      expect(
        UnconvAuthority.unconvUser.toJsonString(),
        'UNCONV_USER',
      );
      expect(
        UnconvAuthority.unconvAdmin.toJsonString(),
        'UNCONV_ADMIN',
      );
      expect(
        UnconvAuthority.unconvTenant.toJsonString(),
        'UNCONV_TENANT',
      );
      expect(
        UnconvAuthority.unconvManager.toJsonString(),
        'UNCONV_MANAGER',
      );
    });
  });
}

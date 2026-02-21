import '../../consts/unconv_authority.dart';

/// Represents a user in the Unconv system.
///
/// Stores user identity, account status flags, and assigned authorities.
/// Includes JSON serialization and deserialization for API or local storage.
class UnconvUser {
  /// Unique identifier of the user.
  String id;

  /// Username of the user.
  String username;

  /// Email address of the user.
  String email;

  /// Indicates whether the account is non-expired.
  bool accountNonExpired;

  /// Indicates whether the account is non-locked.
  bool accountNonLocked;

  /// Indicates whether the credentials are non-expired.
  bool credentialsNonExpired;

  /// Indicates whether the user account is enabled.
  bool enabled;

  /// List of authorities/roles assigned to the user.
  List<UnconvAuthority> authorities;

  UnconvUser({
    required this.id,
    required this.username,
    required this.email,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
    required this.enabled,
    required this.authorities,
  });

  /// Creates a [UnconvUser] instance from a JSON map.
  ///
  /// Expects all required fields to be present. Throws [FormatException] if missing.
  factory UnconvUser.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'username',
      'email',
      'accountNonExpired',
      'accountNonLocked',
      'credentialsNonExpired',
      'enabled',
      'authorities',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return UnconvUser(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      accountNonExpired: json['accountNonExpired'],
      accountNonLocked: json['accountNonLocked'],
      credentialsNonExpired: json['credentialsNonExpired'],
      enabled: json['enabled'],
      authorities: (json['authorities'] as List)
          .map((auth) => UnconvAuthority.fromString(auth['authority']))
          .toList(),
    );
  }

  /// Converts this [UnconvUser] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['accountNonExpired'] = accountNonExpired;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    data['enabled'] = enabled;
    data['authorities'] =
        authorities.map((a) => {'authority': a.toJsonString()}).toList();
    return data;
  }
}

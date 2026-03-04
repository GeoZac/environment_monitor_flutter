import '../../consts/unconv_authority.dart';
import 'unconv_user.dart';

class UnconvUserSignup {
  String? id;
  String username;
  String email;
  String password;
  String? currentPassword;
  List<UnconvAuthority> authorities;
  bool enabled;
  bool accountNonLocked;
  bool accountNonExpired;
  bool credentialsNonExpired;

  UnconvUserSignup({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.currentPassword,
    this.authorities = const [],
    this.enabled = false,
    this.accountNonLocked = false,
    this.accountNonExpired = false,
    this.credentialsNonExpired = false,
  });

  factory UnconvUserSignup.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'username',
      'email',
      'password',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required signup fields in JSON");
    }

    return UnconvUserSignup(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      currentPassword: json['currentPassword'],
      authorities: (json['authorities'] as List?)
              ?.map((auth) => UnconvAuthority.fromString(auth['authority']))
              .toList() ??
          [],
      enabled: json['enabled'] ?? false,
      accountNonLocked: json['accountNonLocked'] ?? false,
      accountNonExpired: json['accountNonExpired'] ?? false,
      credentialsNonExpired: json['credentialsNonExpired'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'currentPassword': currentPassword,
      'authorities':
          authorities.map((a) => {'authority': a.toJsonString()}).toList(),
      'enabled': enabled,
      'accountNonLocked': accountNonLocked,
      'accountNonExpired': accountNonExpired,
      'credentialsNonExpired': credentialsNonExpired,
    };
  }

  UnconvUser toUnconvUser() {
    return UnconvUser(
      id: id ?? '',
      username: username,
      email: email,
      accountNonExpired: accountNonExpired,
      accountNonLocked: accountNonLocked,
      credentialsNonExpired: credentialsNonExpired,
      enabled: enabled,
      authorities: authorities,
    );
  }
}

import 'unconv_user.dart';

/// Represents the authentication response returned by the API.
///
/// Contains the authentication token, its expiration, and the associated user details.
class AuthResponse {
  /// Expiration time of the token (typically in seconds or milliseconds).
  int expires;

  /// The authenticated user information.
  UnconvUser unconvUser;

  /// JWT or bearer token for API authentication.
  String token;

  AuthResponse({
    required this.expires,
    required this.unconvUser,
    required this.token,
  });

  /// Creates an [AuthResponse] instance from a JSON map.
  ///
  /// Throws [FormatException] if any required fields are missing.
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'expires',
      'unconvUser',
      'token',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return AuthResponse(
      expires: json['expires'],
      unconvUser: UnconvUser.fromJson(json['unconvUser']),
      token: json['token'],
    );
  }

  /// Converts this [AuthResponse] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expires'] = expires;
    data['unconvUser'] = unconvUser.toJson();
    data['token'] = token;
    return data;
  }
}

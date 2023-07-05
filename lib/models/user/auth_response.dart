import 'unconv_user.dart';

class AuthResponse {
  int expires;
  UnconvUser unconvUser;
  String token;

  AuthResponse({
    required this.expires,
    required this.unconvUser,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      expires: json['expires'],
      unconvUser: UnconvUser.fromJson(json['unconvUser']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expires'] = expires;
    data['unconvUser'] = unconvUser.toJson();
    data['token'] = token;
    return data;
  }
}

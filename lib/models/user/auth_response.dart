import 'unconv_user.dart';

class AuthResponse {
  int? expires;
  UnconvUser? unconvUser;
  String? token;

  AuthResponse({
    this.expires,
    this.unconvUser,
    this.token,
  });

  AuthResponse.fromJson(Map<String, dynamic> json) {
    expires = json['expires'];
    unconvUser = json['unconvUser'] != null
        ? UnconvUser.fromJson(json['unconvUser'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expires'] = expires;
    if (unconvUser != null) {
      data['unconvUser'] = unconvUser!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

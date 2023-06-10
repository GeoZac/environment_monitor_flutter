class AuthRequest {
  String username;
  String password;

  AuthRequest(
    this.username,
    this.password,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

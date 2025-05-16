class UnconvUser {
  String id;
  String username;
  String email;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;
  bool enabled;
  List<String> authorities;

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
          .map((auth) => auth['authority'].toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['accountNonExpired'] = accountNonExpired;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    data['enabled'] = enabled;
    data['authorities'] = authorities.map((a) => {'authority': a}).toList();
    return data;
  }
}

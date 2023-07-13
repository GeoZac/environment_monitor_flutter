class UnconvUser {
  String id;
  String username;
  String email;

  UnconvUser({
    required this.id,
    required this.username,
    required this.email,
  });

  factory UnconvUser.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'username',
      'email',
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
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}

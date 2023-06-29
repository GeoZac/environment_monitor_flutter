class UnconvUser {
  String? id;
  String? username;
  String? email;

  UnconvUser({
    this.id,
    this.username,
    this.email,
  });

  UnconvUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}

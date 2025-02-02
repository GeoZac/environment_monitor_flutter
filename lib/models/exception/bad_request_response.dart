class BadRequestResponse {
  String? type;
  int? status;
  List<Violations>? violations;
  String? title;

  BadRequestResponse({
    this.type,
    this.status,
    this.violations,
    this.title,
  });

  BadRequestResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    if (json['violations'] != null) {
      violations = <Violations>[];
      json['violations'].forEach((v) {
        violations!.add(Violations.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['status'] = status;
    if (violations != null) {
      data['violations'] = violations!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    return data;
  }
}

class Violations {
  String? field;
  String? message;

  Violations({
    this.field,
    this.message,
  });

  Violations.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field'] = field;
    data['message'] = message;
    return data;
  }
}

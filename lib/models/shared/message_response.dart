class MessageResponse<T> {
  String message;
  T entity;

  MessageResponse(
    this.message,
    this.entity,
  );

  factory MessageResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return MessageResponse(
      json['message'] as String,
      fromJson(json['entity']),
    );
  }
}

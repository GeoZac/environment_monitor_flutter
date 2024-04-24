/// A generic class representing a response message with an associated entity.
///
/// This class is used to encapsulate a response message along with an entity
/// of generic type [T]. It provides methods to construct instances from JSON
/// data and to serialize instances back to JSON.
class MessageResponse<T> {
  /// The message associated with the response.
  String message;

  /// The entity associated with the response.
  T entity;

  /// Constructs a [MessageResponse] instance with the provided message and entity.
  ///
  /// Both [message] and [entity] are required parameters.
  MessageResponse(
    this.message,
    this.entity,
  );

  /// Constructs a [MessageResponse] instance from a JSON map.
  ///
  /// The [json] parameter should be a map representing the JSON structure
  /// of the message response, and [fromJson] should be a function that
  /// constructs an instance of type [T] from the JSON representation.
  ///
  /// Throws a [FormatException] if the required fields are missing or if
  /// there are any issues with deserialization.
  factory MessageResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return MessageResponse(
      json['message'] as String,
      fromJson(json['entity']),
    );
  }
}

enum UnconvAuthority {
  /// Represents a regular Unconv user with limited permissions.
  unconvUser,

  /// Represents an administrator with elevated access privileges.
  unconvAdmin,

  /// Represents a tenant user associated with specific organizational data.
  unconvTenant,

  /// Represents a manager role with intermediate or supervisory access.
  unconvManager;

  /// Internal mapping between string keys and enum values.
  static const _map = {
    'UNCONV_USER': unconvUser,
    'UNCONV_ADMIN': unconvAdmin,
    'UNCONV_TENANT': unconvTenant,
    'UNCONV_MANAGER': unconvManager,
  };

  /// Returns the [UnconvAuthority] corresponding to a string value.
  ///
  /// Example:
  /// ```dart
  /// final authority = UnconvAuthority.fromString('UNCONV_ADMIN');
  /// print(authority); // Output: UnconvAuthority.unconvAdmin
  /// ```
  ///
  /// Throws a [FormatException] if the given [value] does not match any known authority.
  static UnconvAuthority fromString(String value) {
    return _map[value] ?? (throw FormatException("Unknown authority: $value"));
  }

  /// Returns the string representation (e.g., `'UNCONV_ADMIN'`) of this enum value.
  ///
  /// Example:
  /// ```dart
  /// final str = UnconvAuthority.unconvTenant.toJsonString();
  /// print(str); // Output: UNCONV_TENANT
  /// ```
  String toJsonString() {
    return _map.entries.firstWhere((e) => e.value == this).key;
  }
}

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

  static UnconvAuthority fromString(String value) {
    return _map[value] ?? (throw FormatException("Unknown authority: $value"));
  }

  String toJsonString() {
    return _map.entries.firstWhere((e) => e.value == this).key;
  }
}

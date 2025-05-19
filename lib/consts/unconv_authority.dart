enum UnconvAuthority {
  unconvUser,
  unconvAdmin,
  unconvTenant,
  unconvManager;

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

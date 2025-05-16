enum UnconvAuthority {
  UNCONV_USER,
  UNCONV_MANAGER;

  static UnconvAuthority fromString(String value) {
    return UnconvAuthority.values.firstWhere(
      (e) => e.name == value,
      orElse: () => throw FormatException("Unknown authority: $value"),
    );
  }
}

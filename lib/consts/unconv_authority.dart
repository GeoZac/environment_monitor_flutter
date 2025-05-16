enum UnconvAuthority {
  unconvUser,
  unconvManager;

  static UnconvAuthority fromString(String value) {
    switch (value) {
      case 'UNCONV_USER':
        return UnconvAuthority.unconvUser;
      case 'UNCONV_MANAGER':
        return UnconvAuthority.unconvManager;
      default:
        throw FormatException("Unknown authority: $value");
    }
  }

  String toJsonString() {
    switch (this) {
      case UnconvAuthority.unconvUser:
        return 'UNCONV_USER';
      case UnconvAuthority.unconvManager:
        return 'UNCONV_MANAGER';
    }
  }
}

enum UnconvAuthority {
  unconvUser,
  unconvAdmin,
  unconvTenant,
  unconvManager;

  static UnconvAuthority fromString(String value) {
    switch (value) {
      case 'UNCONV_USER':
        return UnconvAuthority.unconvUser;
      case 'UNCONV_ADMIN':
        return UnconvAuthority.unconvAdmin;
      case 'UNCONV_TENANT':
        return UnconvAuthority.unconvTenant;
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
      case UnconvAuthority.unconvAdmin:
        return 'UNCONV_ADMIN';
      case UnconvAuthority.unconvTenant:
        return 'UNCONV_TENANT';
      case UnconvAuthority.unconvManager:
        return 'UNCONV_MANAGER';
    }
  }
}

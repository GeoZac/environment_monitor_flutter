/// Validates a password based on the following rules:
///
/// - Must not be null
/// - Must be between 6 and 25 characters long
/// - Must contain at least one uppercase letter
/// - Must contain at least one lowercase letter
/// - Must contain at least one digit
/// - Must contain at least one special character
/// - Must not contain any whitespace characters
///
/// Returns `true` if the password satisfies all conditions,
/// otherwise returns `false`.
bool isValidPassword(String value) {
  // Length between 6 and 25
  if (value.length < 6 || value.length > 25) {
    return false;
  }

  // At least one uppercase letter
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return false;
  }

  // At least one lowercase letter
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return false;
  }

  // At least one digit
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return false;
  }

  // At least one special character
  if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-\\[\]/+=~`]').hasMatch(value)) {
    return false;
  }

  // No whitespace
  if (RegExp(r'\s').hasMatch(value)) {
    return false;
  }

  return true;
}

/// Validates a username based on the following rules:
///
/// - Must not be null
/// - Must be between 6 and 25 characters long
/// - Must contain at least one uppercase letter
/// - Must not contain any whitespace characters
///
/// Returns `true` if the username satisfies all conditions,
/// otherwise returns `false`.
bool isValidUsername(String? value) {
  if (value == null) return false;

  // Length between 6 and 25
  if (value.length < 6 || value.length > 25) {
    return false;
  }

  // At least one uppercase letter
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return false;
  }

  // No whitespace
  if (RegExp(r'\s').hasMatch(value)) {
    return false;
  }

  return true;
}

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

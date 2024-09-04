class Validator {
  // Private constructor to prevent instantiation
  Validator._();

  // Email validator
  static String? Function(String?) emailValidator() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }
      return null;
    };
  }

  // Password validator
  static String? Function(String?) passwordValidator() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }
      return null;
    };
  }

  // Username validator
  static String? Function(String?) userNameValidator() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your username';
      }
      return null;
    };
  }
}

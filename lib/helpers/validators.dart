class Validators {
  static bool emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool hasMinLength(String value) => value.length >= 8 && !value.contains(' ');

  static bool hasUpperLowerCase(String value) =>
      value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[a-z]'));

  static bool hasDigit(String value) => value.contains(RegExp(r'\d'));
}

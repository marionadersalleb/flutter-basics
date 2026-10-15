// Validation rules pulled out of the login screen so the screen only
// describes the UI and these can be reused or tested on their own.
class AppValidators {
  // the brief asks for the format example@mail.domain
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    final RegExp regex = RegExp(r'^[\w.\-]+@[\w\-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Invalid Email';
    }
    return null;
  }

  // the brief asks for uppercase + lowercase + numbers + special characters
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password Should Be At Least 8 Characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password Should Contain Uppercase Letters';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password Should Contain Lowercase Letters';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password Should Contain Numbers';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]').hasMatch(value)) {
      return 'Password Should Contain Special Characters';
    }
    return null;
  }
}

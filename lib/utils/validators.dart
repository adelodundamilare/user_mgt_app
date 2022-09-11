class Validators {
  var zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";

    final _emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (!_emailRegExp.hasMatch(value.trim())) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return "Phone number is required";

    var _phoneNumberRegExp = RegExp(
        r'^(?:(?:(?:\+?234(?:\h1)?|01)\h*)?(?:\(\d{3}\)|\d{3})|\d{4})(?:\W*\d{3})?\W*\d{4}$');
    if (!_phoneNumberRegExp.hasMatch(value.replaceAll(' ', ''))) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateText(String? value) {
    if (value == null || value.isEmpty) return "Input is required";
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) return "Please enter valid OTP code";
    var _nameRegExp = RegExp(r'^([0-9]){4}');

    if (!_nameRegExp.hasMatch(value.trim())) {
      return 'Invalid PIN, please try again.';
    }
    return null;
  }

  static String? validateConfirmPassword({String? password, String? value}) {
    if (value == null || password == null) {
      return 'Please enter password and confirm password';
    }
    if (value.trim().isEmpty) {
      return 'Input is required';
    }
    if (password.trim() != value.trim()) {
      // print('password ' + password);
      // print('value ' + value);
      return 'Passwords must match';
    }
    return null;
  }
}

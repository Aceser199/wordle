import '../utils/email_validator.dart';
import '../utils/phone_number_validator.dart';

class ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null) {
      return 'please enter an email address';
    }
    if (value.isEmpty) {
      return 'Please enter an email address';
    }

    if (!value.isValidEmail()) {
      return "Invalid email address";
    }

    return null;
  }

  String? validateRequiredField<T>(T? value, String fieldName) {
    if (value == null) {
      return 'Please enter a $fieldName';
    }
    if (value.toString().isEmpty) {
      return 'Please enter a $fieldName';
    }
    if (value == 'Please Select') {
      return 'Please select a value';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null) {
      return 'please enter a phone number';
    }
    if (value.isEmpty) {
      return 'Please enter a phone number';
    }

    if (!value.isValidPhoneNumber()) {
      return "Invalid phone number";
    }

    return null;
  }

  bool validateFutureDate(DateTime? value) {
    if (value == null) {
      return false;
    }
    if (value.isBefore(DateTime.now())) {
      return false;
    }
    return true;
  }
}

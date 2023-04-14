extension PhoneNumberValidator on String {
  bool isValidPhoneNumber() {
    return RegExp(
            r'(^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$)')
        .hasMatch(this);
  }
}

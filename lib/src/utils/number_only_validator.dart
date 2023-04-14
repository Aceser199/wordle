extension NumberOnlyValidator on String {
  bool isValidNumberOnly() {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}

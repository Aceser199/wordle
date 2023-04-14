extension CurrencyValidator on String {
  bool isValidCurrency() {
    return RegExp(r'^[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$').hasMatch(this);
    // return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}

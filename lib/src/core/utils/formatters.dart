import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyDetectorFormatter extends TextInputFormatter {
  final bool isUsd;

  CurrencyDetectorFormatter({required this.isUsd});

  final _formatter = NumberFormat("#,###");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final currency = isUsd ? "USD" : "UZS";

    String raw = newValue.text
        .replaceAll(RegExp(r'(USD|UZS)', caseSensitive: false), "")
        .replaceAll(",", "")
        .trim();

    if (raw.isEmpty) {
      return const TextEditingValue(
        text: "",
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final digits = raw.replaceAll(RegExp(r'[^0-9]'), "");

    final formatted = _formatter.format(int.parse(digits));

    final newText = "$formatted $currency";

    final cursorPos = formatted.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPos),
    );
  }
}

String formatToKMLN(int value) {
  var newValue = "";
  final originalValue = value;
  if (value < 0) {
    value = value * -1;
  }
  if (value >= 1000000000) {
    newValue = "${(value / 1000000000).toStringAsFixed(1)} mlrd";
  } else if (value >= 1000000) {
    newValue = "${(value / 1000000).toStringAsFixed(1)} mln";
  } else if (value >= 1000) {
    newValue = "${(value / 1000).toStringAsFixed(1)} k";
  } else {
    newValue = value.toStringAsFixed(0);
  }
  if (originalValue < 0) {
    newValue = "-$newValue";
  }
  return newValue;
}

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

    // remove suffix if user typed
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

    // only allow digits
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), "");

    // format with thousand separator
    final formatted = _formatter.format(int.parse(digits));

    // add suffix
    final newText = "$formatted $currency";

    // put cursor before suffix
    final cursorPos = formatted.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPos),
    );
  }
}


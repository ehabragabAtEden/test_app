import 'dart:math';

import 'package:iem_app/helpers/validations/price_validator.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

///
/// An implementation of [NumberInputFormatter] automatically inserts thousands
/// separators to numeric input. For example, a input of `1234` should be
/// formatted to `1,234`.
///
class ThousandsFormatter1 extends NumberInputFormatter {
  static final NumberFormat _formatter = NumberFormat.decimalPattern();

  final FilteringTextInputFormatter _decimalFormatter;
  final String _decimalSeparator;
  final RegExp _decimalRegex;

  final NumberFormat? formatter;
  final bool allowFraction;

  ThousandsFormatter1({this.formatter, this.allowFraction = false})
      : _decimalSeparator = (formatter ?? _formatter).symbols.DECIMAL_SEP,
        _decimalRegex = RegExp('[٠-٩0-9]'),
        _decimalFormatter =
            FilteringTextInputFormatter.allow(RegExp('[٠-٩0-9]'));

  @override
  String _formatPattern(String? digits) {
    if (digits == null || digits.isEmpty) {
      return '';
    }
    num number;
    if (allowFraction) {
      String decimalDigits = digits;
      if (_decimalSeparator != '.') {
        decimalDigits = digits.replaceFirst(RegExp(_decimalSeparator), '.');
      }
      number = double.tryParse(decimalDigits) ?? 0.0;
    } else {
      number = int.tryParse(replaceEnglishNumber(digits)) ?? 0;
    }
    final result = _formatter.format(number);
    if (allowFraction && digits.endsWith(_decimalSeparator)) {
      return '$result$_decimalSeparator';
    }

    return result;
  }

  @override
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return _decimalFormatter.formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return s == _decimalSeparator || _decimalRegex.firstMatch(s) != null;
  }
}

///
/// An abstract class extends from [TextInputFormatter] and does numeric filter.
/// It has an abstract method `_format()` that lets its children override it to
/// format input displayed on [/TextField]
///
abstract class NumberInputFormatter extends TextInputFormatter {
  TextEditingValue? _lastNewValue;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    /// nothing changes, nothing to do
    if (newValue.text == _lastNewValue?.text) {
      return newValue;
    }
    _lastNewValue = newValue;

    /// remove all invalid characters
    newValue = _formatValue(oldValue, newValue);

    /// current selection
    int selectionIndex = newValue.selection.end;

    /// format original string, this step would add some separator
    /// characters to original string
    final newText = _formatPattern(newValue.text);

    /// count number of inserted character in new string
    int insertCount = 0;

    /// count number of original input character in new string
    int inputCount = 0;
    for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    /// adjust selection according to number of inserted characters staying before
    /// selection
    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    /// if selection is right after an inserted character, it should be moved
    /// backward, this adjustment prevents an issue that user cannot delete
    /// characters when cursor stands right after inserted characters
    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: selectionIndex),
        composing: TextRange.empty);
  }

  /// check character from user input or being inserted by pattern formatter
  bool _isUserInput(String s);

  /// format user input with pattern formatter
  String _formatPattern(String digits);

  /// validate user input
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue);
}

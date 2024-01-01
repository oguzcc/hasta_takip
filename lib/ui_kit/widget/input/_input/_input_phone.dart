part of '../input.dart';

class _InputPhone extends StatefulWidget {
  const _InputPhone({required TextEditingController controller})
      : _controller = controller;

  final TextEditingController _controller;

  @override
  State<_InputPhone> createState() => _InputPhoneState();
}

class _InputPhoneState extends State<_InputPhone> {
  String dialCode = '+1';
  String countryFlag = '🇺🇸';
  String countryMask = '(000) 000-00-00';
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '(000) 000-00-00',
    filter: {'0': RegExp('[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.input(),
          ),
          child: Container(
            width: 96.w,
            decoration: BoxDecoration(
              borderRadius: AppRadius.input(),
              color: context.color.fillColorLightTeartly,
            ),
            child: InkWell(
              onTap: () {
                Show.searchModal<List<dynamic>>(
                  context,
                  const CountryPicker(),
                ).then(
                  (value) => setState(() {
                    if (value != null) {
                      widget._controller.clear();
                      dialCode = value.first as String;
                      countryMask = value[1] as String;
                      maskFormatter = value[2] as MaskTextInputFormatter;
                      countryFlag = value.last as String;

                      PhoneController.instance().dialCode = dialCode;
                      PhoneController.instance().phoneMask = countryMask;
                    }
                  }),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox.square(
                      dimension: 20.r,
                      child: ClipOval(
                        child: Text(
                          countryFlag,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 34.sp,
                            height: .6,
                            letterSpacing: -12,
                          ),
                        ),
                      ),
                    ),
                    Gap.horXS,
                    Text(
                      dialCode,
                      style: context.textTheme.bodyRegular,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Gap.horXS,
        Expanded(
          child: _InputPhoneNumber(
            controller: widget._controller,
            inputFormatters: [
              maskFormatter,
            ],
            hintText: countryMask,
          ),
        ),
      ],
    );
  }
}

class _InputPhoneNumber extends StatelessWidget {
  const _InputPhoneNumber({
    required TextEditingController controller,
    required this.inputFormatters,
    required this.hintText,
  }) : _controller = controller;

  final TextEditingController _controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    // final error = _controller.text.length > 15;

    return Column(
      children: [
        _Input(
          controller: _controller,
          decoration: InputDecoration(
            // fillColor: error ? context.colorScheme.errorContainer : null,
            hintText: hintText,
            suffixIcon: _controller.text.isNotEmpty
                ? _ClearIconButton(controller: _controller)
                : null,
          ),
          inputFormatters: inputFormatters,
          autofillHints: const [AutofillHints.telephoneNumber],
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
        ),
        // if (error)
        //   TextInputValidationError(
        //     message: LocaleAuth.phonePageError,
        //   ),
      ],
    );
  }
}

class PhoneController extends ChangeNotifier {
  factory PhoneController.instance() {
    _instance ??= PhoneController._init();
    return _instance!;
  }
  PhoneController._init();
  static PhoneController? _instance;

  String dialCode = '+1';
  String phoneMask = '(000) 000-00-00';

  void reset() {
    dialCode = '+1';
    notifyListeners();
  }
}

enum MaskAutoCompletionType {
  lazy,
  eager,
}

class MaskTextInputFormatter implements TextInputFormatter {
  /// Create the [mask] formatter for TextField
  ///
  /// The keys of the [filter] assign which character in the mask should be
  /// replaced and the values validate the entered character
  /// By default `#` match to the number and `A` to the letter
  ///
  /// Set [type] for autocompletion behavior:
  ///  - [MaskAutoCompletionType.lazy] (default): autocomplete unfiltered
  /// characters once the following filtered character is input.
  ///  For example, with the mask "#/#" and the sequence of characters "1"
  /// then "2", the formatter will output "1", then "1/2"
  ///  - [MaskAutoCompletionType.eager]: autocomplete unfiltered characters
  /// when the previous filtered character is input.
  ///  For example, with the mask "#/#" and the sequence of characters "1"
  /// then "2", the formatter will output "1/", then "1/2"
  ///
  MaskTextInputFormatter({
    String? mask,
    Map<String, RegExp>? filter,
    String? initialText,
    this.type = MaskAutoCompletionType.lazy,
  }) {
    updateMask(
      mask: mask,
      filter: filter ?? {'#': RegExp('[0-9]'), 'A': RegExp('[^0-9]')},
      newValue: initialText == null
          ? null
          : TextEditingValue(
              text: initialText,
              selection: TextSelection.collapsed(offset: initialText.length),
            ),
    );
  }
  final MaskAutoCompletionType type;

  String? _mask;
  List<String> _maskChars = [];
  Map<String, RegExp>? _maskFilter;

  int _maskLength = 0;
  final _TextMatcher _resultTextArray = _TextMatcher();
  String _resultTextMasked = '';

  /// Change the mask
  TextEditingValue updateMask({
    String? mask,
    Map<String, RegExp>? filter,
    TextEditingValue? newValue,
  }) {
    _mask = mask;
    if (filter != null) {
      _updateFilter(filter);
    }
    _calcMaskLength();
    var targetValue = newValue;
    if (targetValue == null) {
      final unmaskedText = getUnmaskedText();
      targetValue = TextEditingValue(
        text: unmaskedText,
        selection: TextSelection.collapsed(offset: unmaskedText.length),
      );
    }
    clear();
    return formatEditUpdate(TextEditingValue.empty, targetValue);
  }

  /// Get current mask
  String? getMask() {
    return _mask;
  }

  /// Get masked text, e.g. "+0 (123) 456-78-90"
  String getMaskedText() {
    return _resultTextMasked;
  }

  /// Get unmasked text, e.g. "01234567890"
  String getUnmaskedText() {
    return _resultTextArray.toString();
  }

  /// Check if target mask is filled
  bool isFill() {
    return _resultTextArray.length == _maskLength;
  }

  /// Clear masked text of the formatter
  /// Note: you need to call this method if you clear the text of the TextField
  /// because it doesn't call the formatter when it has empty text
  void clear() {
    _resultTextMasked = '';
    _resultTextArray.clear();
  }

  /// Mask some text
  String maskText(String text) {
    return MaskTextInputFormatter(
      mask: _mask,
      filter: _maskFilter,
      initialText: text,
    ).getMaskedText();
  }

  /// Unmask some text
  String unmaskText(String text) {
    return MaskTextInputFormatter(
      mask: _mask,
      filter: _maskFilter,
      initialText: text,
    ).getUnmaskedText();
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final mask = _mask;

    if (mask == null || mask.isEmpty == true) {
      _resultTextMasked = newValue.text;
      _resultTextArray.set(newValue.text);
      return newValue;
    }

    if (oldValue.text.isEmpty) {
      _resultTextArray.clear();
    }

    final beforeText = oldValue.text;
    final afterText = newValue.text;

    final beforeSelection = oldValue.selection;
    final afterSelection = newValue.selection;

    var beforeSelectionStart = afterSelection.isValid
        ? beforeSelection.isValid
            ? beforeSelection.start
            : 0
        : 0;

    for (var i = 0;
        i < beforeSelectionStart &&
            i < beforeText.length &&
            i < afterText.length;
        i++) {
      if (beforeText[i] != afterText[i]) {
        beforeSelectionStart = i;
        break;
      }
    }

    final beforeSelectionLength = afterSelection.isValid
        ? beforeSelection.isValid
            ? beforeSelection.end - beforeSelectionStart
            : 0
        : oldValue.text.length;

    final lengthDifference =
        afterText.length - (beforeText.length - beforeSelectionLength);
    final lengthRemoved = lengthDifference < 0 ? lengthDifference.abs() : 0;
    final lengthAdded = lengthDifference > 0 ? lengthDifference : 0;

    final afterChangeStart = max(0, beforeSelectionStart - lengthRemoved);
    final afterChangeEnd = max(0, afterChangeStart + lengthAdded);

    final beforeReplaceStart = max(0, beforeSelectionStart - lengthRemoved);
    final beforeReplaceLength = beforeSelectionLength + lengthRemoved;

    final beforeResultTextLength = _resultTextArray.length;

    var currentResultTextLength = _resultTextArray.length;
    var currentResultSelectionStart = 0;
    var currentResultSelectionLength = 0;

    for (var i = 0;
        i < min(beforeReplaceStart + beforeReplaceLength, mask.length);
        i++) {
      if (_maskChars.contains(mask[i]) && currentResultTextLength > 0) {
        currentResultTextLength -= 1;
        if (i < beforeReplaceStart) {
          currentResultSelectionStart += 1;
        }
        if (i >= beforeReplaceStart) {
          currentResultSelectionLength += 1;
        }
      }
    }

    final replacementText =
        afterText.substring(afterChangeStart, afterChangeEnd);
    var targetCursorPosition = currentResultSelectionStart;
    if (replacementText.isEmpty) {
      _resultTextArray.removeRange(
        currentResultSelectionStart,
        currentResultSelectionStart + currentResultSelectionLength,
      );
    } else {
      if (currentResultSelectionLength > 0) {
        _resultTextArray.removeRange(
          currentResultSelectionStart,
          currentResultSelectionStart + currentResultSelectionLength,
        );
        currentResultSelectionLength = 0;
      }
      _resultTextArray.insert(currentResultSelectionStart, replacementText);
      targetCursorPosition += replacementText.length;
    }

    if (beforeResultTextLength == 0 && _resultTextArray.length > 1) {
      for (var i = 0; i < mask.length; i++) {
        if (_maskChars.contains(mask[i])) {
          final resultPrefix = _resultTextArray._symbolArray.take(i).toList();
          for (var j = 0; j < resultPrefix.length; j++) {
            if (_resultTextArray.length <= j ||
                (mask[j] != resultPrefix[j] ||
                    (mask[j] == resultPrefix[j] &&
                        j == resultPrefix.length - 1))) {
              _resultTextArray.removeRange(0, j);
              break;
            }
          }
          break;
        }
      }
    }

    var curTextPos = 0;
    var maskPos = 0;
    _resultTextMasked = '';
    var cursorPos = -1;
    var nonMaskedCount = 0;

    while (maskPos < mask.length) {
      final curMaskChar = mask[maskPos];
      final isMaskChar = _maskChars.contains(curMaskChar);

      var curTextInRange = curTextPos < _resultTextArray.length;

      String? curTextChar;
      if (isMaskChar && curTextInRange) {
        while (curTextChar == null && curTextInRange) {
          final potentialTextChar = _resultTextArray[curTextPos];
          if (_maskFilter?[curMaskChar]?.hasMatch(potentialTextChar) ?? false) {
            curTextChar = potentialTextChar;
          } else {
            _resultTextArray.removeAt(curTextPos);
            curTextInRange = curTextPos < _resultTextArray.length;
            if (curTextPos <= targetCursorPosition) {
              targetCursorPosition -= 1;
            }
          }
        }
      } else if (!isMaskChar &&
          !curTextInRange &&
          type == MaskAutoCompletionType.eager) {
        curTextInRange = true;
      }

      if (isMaskChar && curTextInRange && curTextChar != null) {
        _resultTextMasked += curTextChar;
        if (curTextPos == targetCursorPosition && cursorPos == -1) {
          cursorPos = maskPos - nonMaskedCount;
        }
        nonMaskedCount = 0;
        curTextPos += 1;
      } else {
        if (curTextPos == targetCursorPosition &&
            cursorPos == -1 &&
            !curTextInRange) {
          cursorPos = maskPos;
        }

        if (!curTextInRange) {
          break;
        } else {
          _resultTextMasked += mask[maskPos];
        }

        if (type == MaskAutoCompletionType.lazy ||
            lengthRemoved > 0 ||
            currentResultSelectionLength > 0 ||
            beforeReplaceLength > 0) {
          nonMaskedCount++;
        }
      }

      maskPos++;
    }

    if (nonMaskedCount > 0) {
      _resultTextMasked = _resultTextMasked.substring(
        0,
        _resultTextMasked.length - nonMaskedCount,
      );
      cursorPos -= nonMaskedCount;
    }

    if (_resultTextArray.length > _maskLength) {
      _resultTextArray.removeRange(_maskLength, _resultTextArray.length);
    }

    final finalCursorPosition =
        cursorPos < 0 ? _resultTextMasked.length : cursorPos;

    return TextEditingValue(
      text: _resultTextMasked,
      selection: TextSelection(
        baseOffset: finalCursorPosition,
        extentOffset: finalCursorPosition,
        affinity: newValue.selection.affinity,
        isDirectional: newValue.selection.isDirectional,
      ),
    );
  }

  void _calcMaskLength() {
    _maskLength = 0;
    final mask = _mask;
    if (mask != null) {
      for (var i = 0; i < mask.length; i++) {
        if (_maskChars.contains(mask[i])) {
          _maskLength++;
        }
      }
    }
  }

  void _updateFilter(Map<String, RegExp> filter) {
    _maskFilter = filter;
    _maskChars = _maskFilter?.keys.toList(growable: false) ?? [];
  }
}

class _TextMatcher {
  final List<String> _symbolArray = <String>[];

  int get length => _symbolArray.fold(0, (prev, match) => prev + match.length);

  void removeRange(int start, int end) => _symbolArray.removeRange(start, end);

  void insert(int start, String substring) {
    for (var i = 0; i < substring.length; i++) {
      _symbolArray.insert(start + i, substring[i]);
    }
  }

  bool get isEmpty => _symbolArray.isEmpty;

  void removeAt(int index) => _symbolArray.removeAt(index);

  String operator [](int index) => _symbolArray[index];

  void clear() => _symbolArray.clear();

  @override
  String toString() => _symbolArray.join();

  void set(String text) {
    _symbolArray.clear();
    for (var i = 0; i < text.length; i++) {
      _symbolArray.add(text[i]);
    }
  }
}

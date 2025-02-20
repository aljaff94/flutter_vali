import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add match validation rule.
extension MatchExtensions on Validator {
  /// Adds a [MatchRule] to the validator.
  ///
  /// The [pattern] is the regular expression pattern to match.
  /// The [errorMessage] is the optional error message to display if validation fails.
  Validator match(Pattern pattern, {String? errorMessage}) {
    addRule(MatchRule(pattern, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value matches a given pattern.
class MatchRule extends ValidatorRule {
  /// The pattern to match against the value.
  final Pattern pattern;

  /// Creates a [MatchRule] with the given [pattern] and optional [errorMessage].
  const MatchRule(this.pattern, {super.errorMessage});

  /// Validates the [value] against the [pattern].
  ///
  /// Returns `null` if the value matches the pattern, otherwise returns the [errorMessage].
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    return pattern.allMatches(value).isNotEmpty
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value is invalid',
    'ar': 'القيمة غير صالحة',
    'ckb': 'بەها نادروستە',
    'af': 'Waarde is ongeldig',
    'sq': 'Vlera është e pavlefshme',
    'be': 'Значэнне недапушчальнае',
    'bg': 'Стойността е невалидна',
    'ca': 'El valor no és vàlid',
    'zh': '值无效',
    'hr': 'Vrijednost je nevažeća',
    'cs': 'Hodnota je neplatná',
    'da': 'Værdien er ugyldig',
    'nl': 'Waarde is ongeldig',
    'et': 'Väärtus on kehtetu',
    'fi': 'Arvo on virheellinen',
    'fr': 'La valeur est invalide',
    'de': 'Wert ist ungültig',
    'el': 'Η τιμή είναι άκυρη',
    'hi': 'मान अमान्य है',
    'hu': 'Az érték érvénytelen',
    'is': 'Gildið er ógilt',
    'id': 'Nilai tidak valid',
    'it': 'Il valore non è valido',
    'ja': '値が無効です',
    'ko': '값이 유효하지 않습니다',
    'lv': 'Vērtība nav derīga',
    'lt': 'Reikšmė negalioja',
    'mk': 'Вредноста е неважечка',
    'ms': 'Nilai tidak sah',
    'no': 'Verdien er ugyldig',
    'pl': 'Wartość jest nieprawidłowa',
    'pt': 'Valor inválido',
    'ro': 'Valoarea este invalidă',
    'ru': 'Значение недействительно',
    'sr': 'Вредност је неважећа',
    'sk': 'Hodnota je neplatná',
    'sl': 'Vrednost je neveljavna',
    'es': 'El valor no es válido',
    'sv': 'Värdet är ogiltigt',
    'th': 'ค่าที่ไม่ถูกต้อง',
    'tr': 'Değer geçersiz',
    'uk': 'Значення недійсне',
    'vi': 'Giá trị không hợp lệ',
  };
}

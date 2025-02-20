import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add contains rule.
extension ContainsExtensions on Validator {
  /// Adds a [ContainsRule] to the validator.
  ///
  /// The [substring] parameter specifies the substring that must be contained
  /// in the value. The [errorMessage] parameter is optional and can be used to
  /// provide a custom error message.
  Validator contains(String substring, {String? errorMessage}) {
    addRule(ContainsRule(substring, errorMessage: errorMessage));
    return this;
  }
}

/// A rule that checks if a value contains a specific substring.
class ContainsRule extends ValidatorRule {
  /// The substring that must be contained in the value.
  final String substring;

  /// Creates a new [ContainsRule] with the given [substring] and optional
  /// [errorMessage].
  const ContainsRule(this.substring, {super.errorMessage});

  /// Checks if the [value] contains the [substring].
  ///
  /// Returns `null` if the value contains the substring, otherwise returns
  /// the error message.
  @override
  String? isValid(BuildContext context, String? value) {
    return value != null && value.contains(substring)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Provides default error messages in various languages.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'field must contain "$substring"',
    'ar': 'يجب أن يحتوي الحقل على "$substring"',
    'ckb': 'خانەکە دەبێت "$substring" لەخۆ بگرێت',
    'af': 'veld moet "$substring" bevat',
    'sq': 'fusha duhet të përmbajë "$substring"',
    'be': 'поле павінна ўтрымліваць "$substring"',
    'bg': 'полето трябва да съдържа "$substring"',
    'ca': 'el camp ha de contenir "$substring"',
    'zh': '字段必须包含 "$substring"',
    'hr': 'polje mora sadržavati "$substring"',
    'cs': 'pole musí obsahovat "$substring"',
    'da': 'feltet skal indeholde "$substring"',
    'nl': 'veld moet "$substring" bevatten',
    'et': 'väli peab sisaldama "$substring"',
    'fi': 'kentän on sisällettävä "$substring"',
    'fr': 'le champ doit contenir "$substring"',
    'de': 'Feld muss "$substring" enthalten',
    'el': 'το πεδίο πρέπει να περιέχει "$substring"',
    'hi': 'फ़ील्ड में "$substring" होना चाहिए',
    'hu': 'a mezőnek tartalmaznia kell "$substring"',
    'is': 'reitur verður að innihalda "$substring"',
    'id': 'bidang harus berisi "$substring"',
    'it': 'il campo deve contenere "$substring"',
    'ja': 'フィールドには "$substring" を含める必要があります',
    'ko': '필드에는 "$substring"이 포함되어야 합니다',
    'lv': 'laukā jābūt "$substring"',
    'lt': 'laukas turi turėti "$substring"',
    'mk': 'полето мора да содржи "$substring"',
    'ms': 'medan mesti mengandungi "$substring"',
    'no': 'feltet må inneholde "$substring"',
    'pl': 'pole musi zawierać "$substring"',
    'pt': 'o campo deve conter "$substring"',
    'ro': 'câmpul trebuie să conțină "$substring"',
    'ru': 'поле должно содержать "$substring"',
    'sr': 'polje mora sadržati "$substring"',
    'sk': 'pole musí obsahovať "$substring"',
    'sl': 'polje mora vsebovati "$substring"',
    'es': 'el campo debe contener "$substring"',
    'sv': 'fältet måste innehålla "$substring"',
    'th': 'ฟิลด์ต้องมี "$substring"',
    'tr': 'alan "$substring" içermelidir',
    'uk': 'поле повинно містити "$substring"',
    'vi': 'trường phải chứa "$substring"',
  };
}

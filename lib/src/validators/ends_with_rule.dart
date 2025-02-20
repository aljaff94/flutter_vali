import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add `endsWith` validation rule.
extension EndsWithExtensions on Validator {
  /// Adds an [EndsWithRule] to the validator.
  ///
  /// The [suffix] parameter specifies the suffix that the field value must end with.
  /// The [errorMessage] parameter is optional and allows you to specify a custom error message.
  Validator endsWith(String suffix, {String? errorMessage}) {
    addRule(EndsWithRule(suffix, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a field value ends with a specific suffix.
class EndsWithRule extends ValidatorRule {
  /// The suffix that the field value must end with.
  final String suffix;

  /// Creates an [EndsWithRule] with the given [suffix] and optional [errorMessage].
  const EndsWithRule(this.suffix, {super.errorMessage});

  /// Validates if the [value] ends with the specified [suffix].
  ///
  /// Returns `null` if the validation passes, otherwise returns the [errorMessage].
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null) return null;
    return value.endsWith(suffix)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Field must end with "$suffix"',
    'ar': 'يجب أن ينتهي الحقل بـ "$suffix"',
    'ckb': 'خانەکە دەبێت بە "$suffix" کۆتایی بگەیەنێت',
    'af': 'Veld moet eindig met "$suffix"',
    'sq': 'Fusha duhet të përfundojë me "$suffix"',
    'be': 'Поле павінна заканчвацца на "$suffix"',
    'bg': 'Полето трябва да завършва с "$suffix"',
    'ca': 'El camp ha d\'acabar amb "$suffix"',
    'zh': '字段必须以 "$suffix" 结尾',
    'hr': 'Polje mora završavati s "$suffix"',
    'cs': 'Pole musí končit "$suffix"',
    'da': 'Feltet skal slutte med "$suffix"',
    'nl': 'Veld moet eindigen met "$suffix"',
    'et': 'Väli peab lõppema "$suffix"',
    'fi': 'Kentän on päätyttävä "$suffix"',
    'fr': 'Le champ doit se terminer par "$suffix"',
    'de': 'Feld muss mit "$suffix" enden',
    'el': 'Το πεδίο πρέπει να τελειώνει με "$suffix"',
    'hi': 'फ़ील्ड "$suffix" से समाप्त होना चाहिए',
    'hu': 'A mezőnek "$suffix" -vel kell végződnie',
    'is': 'Reitur verður að enda á "$suffix"',
    'id': 'Kolom harus diakhiri dengan "$suffix"',
    'it': 'Il campo deve terminare con "$suffix"',
    'ja': 'フィールドは "$suffix" で終わる必要があります',
    'ko': '필드는 "$suffix"로 끝나야 합니다',
    'lv': 'Laukam jābeidzas ar "$suffix"',
    'lt': 'Laukas turi baigtis "$suffix"',
    'mk': 'Полето мора да завршува со "$suffix"',
    'ms': 'Medan mesti berakhir dengan "$suffix"',
    'no': 'Feltet må slutte med "$suffix"',
    'pl': 'Pole musi kończyć się na "$suffix"',
    'pt': 'O campo deve terminar com "$suffix"',
    'ro': 'Câmpul trebuie să se termine cu "$suffix"',
    'ru': 'Поле должно заканчиваться на "$suffix"',
    'sr': 'Polje mora da se završava sa "$suffix"',
    'sk': 'Pole musí končiť "$suffix"',
    'sl': 'Polje se mora končati z "$suffix"',
    'es': 'El campo debe terminar con "$suffix"',
    'sv': 'Fältet måste sluta med "$suffix"',
    'th': 'ฟิลด์ต้องลงท้ายด้วย "$suffix"',
    'tr': 'Alan "$suffix" ile bitmelidir',
    'uk': 'Поле повинно закінчуватися на "$suffix"',
    'vi': 'Trường phải kết thúc bằng "$suffix"',
  };
}

import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add a not empty rule.
extension NotEmptyExtensions on Validator {
  /// Adds a [NotEmptyRule] to the validator.
  ///
  /// [errorMessage] is an optional custom error message.
  Validator notEmpty({String? errorMessage}) {
    addRule(NotEmptyRule(errorMessage: errorMessage));
    return this;
  }
}

/// A rule that checks if a value is not empty.
class NotEmptyRule extends ValidatorRule {
  /// Creates a [NotEmptyRule] with an optional [errorMessage].
  const NotEmptyRule({super.errorMessage});

  /// Validates if the [value] is not empty.
  ///
  /// Returns `null` if the value is valid, otherwise returns an error message.
  @override
  String? isValid(BuildContext context, String? value) {
    return value == null || value.trim().isNotEmpty
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages in different languages.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'field is required',
    'ar': 'هذا الحقل مطلوب',
    'ckb': 'ئەم خانەیە داواکراوە',
    'af': 'veld is vereis',
    'sq': 'fusha është e nevojshme',
    'be': 'поле абавязкова',
    'bg': 'полето е задължително',
    'ca': 'el camp és obligatori',
    'zh': '字段是必需的',
    'hr': 'polje je obavezno',
    'cs': 'pole je povinné',
    'da': 'feltet er påkrævet',
    'nl': 'veld is verplicht',
    'et': 'väli on kohustuslik',
    'fi': 'kenttä on pakollinen',
    'fr': 'le champ est requis',
    'de': 'Feld ist erforderlich',
    'el': 'το πεδίο είναι υποχρεωτικό',
    'hi': 'फ़ील्ड आवश्यक है',
    'hu': 'a mező kitöltése kötelező',
    'is': 'reitur er nauðsynlegur',
    'id': 'bidang diperlukan',
    'it': 'il campo è obbligatorio',
    'ja': 'フィールドは必須です',
    'ko': '필드는 필수입니다',
    'lv': 'lauku ir obligāti',
    'lt': 'laukas yra privalomas',
    'mk': 'полето е задолжително',
    'ms': 'medan diperlukan',
    'no': 'feltet er påkrevd',
    'pl': 'pole jest wymagane',
    'pt': 'campo é obrigatório',
    'ro': 'câmpul este obligatoriu',
    'ru': 'поле обязательно для заполнения',
    'sr': 'polje je obavezno',
    'sk': 'pole je povinné',
    'sl': 'polje je obvezno',
    'es': 'el campo es obligatorio',
    'sv': 'fältet är obligatoriskt',
    'th': 'ต้องระบุฟิลด์',
    'tr': 'alan gereklidir',
    'uk': 'поле є обов\'язковим',
    'vi': 'trường là bắt buộc',
  };
}

import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add length validation.
extension LengthExtensions on Validator {
  /// Adds a [LengthRule] to the validator.
  ///
  /// [exactLength] specifies the exact length the value must be.
  /// [errorMessage] is an optional custom error message.
  Validator length(num exactLength, {String? errorMessage}) {
    addRule(LengthRule(exactLength, errorMessage: errorMessage));
    return this;
  }
}

/// A rule that validates the length of a value.
class LengthRule extends ValidatorRule {
  /// The exact length the value must be.
  final num exactLength;

  /// Creates a [LengthRule] with the specified [exactLength].
  ///
  /// [errorMessage] is an optional custom error message.
  const LengthRule(this.exactLength, {super.errorMessage});

  /// Validates the length of the [value].
  ///
  /// Returns `null` if the length is valid, otherwise returns an error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null) return null;

    final length = value.length;
    return length == exactLength
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'field must be exactly $exactLength characters long',
    'ar': 'يجب أن يكون الحقل $exactLength أحرف بالضبط',
    'ckb': 'خانەکە دەبێت تەواوی $exactLength پیت بێت',
    'af': 'veld moet presies $exactLength karakters lank wees',
    'sq': 'fusha duhet të jetë saktësisht $exactLength karaktere e gjatë',
    'be': 'поле павінна быць роўна $exactLength сімвалаў',
    'bg': 'полето трябва да бъде точно $exactLength символа дълго',
    'ca': 'el camp ha de tenir exactament $exactLength caràcters',
    'zh': '字段必须正好是 $exactLength 个字符长',
    'hr': 'polje mora biti točno $exactLength znakova dugo',
    'cs': 'pole musí mít přesně $exactLength znaků',
    'da': 'feltet skal være præcis $exactLength tegn langt',
    'nl': 'veld moet precies $exactLength tekens lang zijn',
    'et': 'väli peab olema täpselt $exactLength tähemärki pikk',
    'fi': 'kentän on oltava täsmälleen $exactLength merkkiä pitkä',
    'fr': 'le champ doit comporter exactement $exactLength caractères',
    'de': 'das Feld muss genau $exactLength Zeichen lang sein',
    'el': 'το πεδίο πρέπει να είναι ακριβώς $exactLength χαρακτήρες',
    'hi': 'फ़ील्ड को ठीक $exactLength वर्ण लंबा होना चाहिए',
    'hu': 'a mezőnek pontosan $exactLength karakter hosszúnak kell lennie',
    'is': 'reiturinn verður að vera nákvæmlega $exactLength stafir langur',
    'id': 'bidang harus tepat $exactLength karakter',
    'it': 'il campo deve essere esattamente $exactLength caratteri lungo',
    'ja': 'フィールドは正確に $exactLength 文字でなければなりません',
    'ko': '필드는 정확히 $exactLength 자 길어야 합니다',
    'lv': 'laukum jābūt tieši $exactLength rakstzīmes garam',
    'lt': 'laukas turi būti tiksliai $exactLength simbolių ilgio',
    'mk': 'полето мора да биде точно $exactLength карактери долго',
    'ms': 'medan mesti tepat $exactLength aksara panjang',
    'no': 'feltet må være nøyaktig $exactLength tegn langt',
    'pl': 'pole musi mieć dokładnie $exactLength znaków',
    'pt': 'o campo deve ter exatamente $exactLength caracteres',
    'ro': 'câmpul trebuie să aibă exact $exactLength caractere',
    'ru': 'поле должно быть ровно $exactLength символов',
    'sr': 'polje mora biti tačno $exactLength karaktera dugo',
    'sk': 'pole musí mať presne $exactLength znakov',
    'sl': 'polje mora biti natančno $exactLength znakov dolgo',
    'es': 'el campo debe tener exactamente $exactLength caracteres',
    'sv': 'fältet måste vara exakt $exactLength tecken långt',
    'th': 'ฟิลด์ต้องยาว $exactLength อักขระ',
    'tr': 'alan tam olarak $exactLength karakter uzunluğunda olmalıdır',
    'uk': 'поле повинно бути рівно $exactLength символів',
    'vi': 'trường phải dài chính xác $exactLength ký tự',
  };
}

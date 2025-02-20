import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add a minimum length validation rule.
extension MinLengthExtensions on Validator {
  /// Adds a [MinLengthRule] to the validator.
  ///
  /// [minLength] is the minimum number of characters required.
  /// [errorMessage] is an optional custom error message.
  Validator minLength(int minLength, {String? errorMessage}) {
    addRule(MinLengthRule(minLength, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if the value has a minimum length.
class MinLengthRule extends ValidatorRule {
  /// The minimum number of characters required.
  final int minLength;

  /// Creates a [MinLengthRule] with the given [minLength] and optional [errorMessage].
  const MinLengthRule(this.minLength, {super.errorMessage});

  /// Validates if the [value] has at least [minLength] characters.
  ///
  /// Returns `null` if the validation passes, otherwise returns an error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null) return null;
    return value.length >= minLength
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Field must be at least $minLength characters long',
    'ar': 'يجب أن يكون الحقل $minLength أحرف على الأقل',
    'ckb': 'خانەکە دەبێت لانی کەم $minLength پیت بێت',
    'af': 'Veld moet ten minste $minLength karakters lank wees',
    'sq': 'Fusha duhet të jetë të paktën $minLength karaktere e gjatë',
    'be': 'Поле павінна быць не менш за $minLength сімвалаў',
    'bg': 'Полето трябва да бъде поне $minLength символа дълго',
    'ca': 'El camp ha de tenir almenys $minLength caràcters',
    'zh': '字段长度必须至少为 $minLength 个字符',
    'hr': 'Polje mora biti dugo najmanje $minLength znakova',
    'cs': 'Pole musí mít alespoň $minLength znaků',
    'da': 'Feltet skal være mindst $minLength tegn langt',
    'nl': 'Veld moet minstens $minLength tekens lang zijn',
    'et': 'Väli peab olema vähemalt $minLength tähemärki pikk',
    'fi': 'Kentän on oltava vähintään $minLength merkkiä pitkä',
    'fr': 'Le champ doit contenir au moins $minLength caractères',
    'de': 'Feld muss mindestens $minLength Zeichen lang sein',
    'el': 'Το πεδίο πρέπει να είναι τουλάχιστον $minLength χαρακτήρες',
    'hi': 'फ़ील्ड कम से कम $minLength वर्ण लंबा होना चाहिए',
    'hu': 'A mezőnek legalább $minLength karakter hosszúnak kell lennie',
    'is':
        'Reiturinn verður að vera að minnsta kosti $minLength stafir að lengd',
    'id': 'Kolom harus setidaknya $minLength karakter',
    'it': 'Il campo deve essere lungo almeno $minLength caratteri',
    'ja': 'フィールドは少なくとも $minLength 文字でなければなりません',
    'ko': '필드는 최소 $minLength 자 이상이어야 합니다',
    'lv': 'Laukam jābūt vismaz $minLength rakstzīmju garam',
    'lt': 'Laukas turi būti bent $minLength simbolių ilgio',
    'mk': 'Полето мора да биде најмалку $minLength карактери долго',
    'ms': 'Medan mesti sekurang-kurangnya $minLength aksara panjang',
    'no': 'Feltet må være minst $minLength tegn langt',
    'pl': 'Pole musi mieć co najmniej $minLength znaków',
    'pt': 'O campo deve ter pelo menos $minLength caracteres',
    'ro': 'Câmpul trebuie să aibă cel puțin $minLength caractere',
    'ru': 'Поле должно быть не менее $minLength символов',
    'sr': 'Polje mora biti najmanje $minLength karaktera dugo',
    'sk': 'Pole musí mať aspoň $minLength znakov',
    'sl': 'Polje mora biti dolgo vsaj $minLength znakov',
    'es': 'El campo debe tener al menos $minLength caracteres',
    'sv': 'Fältet måste vara minst $minLength tecken långt',
    'th': 'ฟิลด์ต้องมีความยาวอย่างน้อย $minLength อักขระ',
    'tr': 'Alan en az $minLength karakter uzunluğunda olmalıdır',
    'uk': 'Поле повинно бути не менше $minLength символів',
    'vi': 'Trường phải dài ít nhất $minLength ký tự',
  };
}

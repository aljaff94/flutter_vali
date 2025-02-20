import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension MaxLengthExtensions on Validator {
  Validator maxLength(int maxLength, {String? errorMessage}) {
    addRule(MaxLengthRule(maxLength, errorMessage: errorMessage));
    return this;
  }
}

class MaxLengthRule extends ValidatorRule {
  final int maxLength;

  const MaxLengthRule(this.maxLength, {super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null) return null;
    return value.length <= maxLength
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Field must be at most $maxLength characters long',
    'ar': 'يجب أن يكون الحقل $maxLength أحرف على الأكثر',
    'ckb': 'خانەکە نابێت زیاتر لە $maxLength پیت بێت',
    'af': 'Veld moet hoogstens $maxLength karakters lank wees',
    'sq': 'Fusha duhet të jetë më së shumti $maxLength karaktere e gjatë',
    'be': 'Поле павінна быць не больш за $maxLength сімвалаў',
    'bg': 'Полето трябва да бъде най-много $maxLength символа дълго',
    'ca': 'El camp ha de tenir com a màxim $maxLength caràcters',
    'zh': '字段长度不能超过 $maxLength 个字符',
    'hr': 'Polje mora biti najviše $maxLength znakova dugo',
    'cs': 'Pole musí být nejvýše $maxLength znaků dlouhé',
    'da': 'Feltet må højst være $maxLength tegn langt',
    'nl': 'Veld mag maximaal $maxLength tekens lang zijn',
    'et': 'Väli peab olema kõige rohkem $maxLength tähemärki pikk',
    'fi': 'Kentän pituus saa olla enintään $maxLength merkkiä',
    'fr': 'Le champ doit comporter au maximum $maxLength caractères',
    'de': 'Feld darf höchstens $maxLength Zeichen lang sein',
    'el': 'Το πεδίο πρέπει να είναι το πολύ $maxLength χαρακτήρες',
    'hi': 'फ़ील्ड अधिकतम $maxLength वर्ण लंबा होना चाहिए',
    'hu': 'A mező legfeljebb $maxLength karakter hosszú lehet',
    'is': 'Reiturinn má að hámarki vera $maxLength stafir að lengd',
    'id': 'Bidang harus paling banyak $maxLength karakter',
    'it': 'Il campo deve essere lungo al massimo $maxLength caratteri',
    'ja': 'フィールドは最大 $maxLength 文字でなければなりません',
    'ko': '필드는 최대 $maxLength 자여야 합니다',
    'lv': 'Lauks nedrīkst būt garāks par $maxLength rakstzīmēm',
    'lt': 'Laukas turi būti ne ilgesnis kaip $maxLength simbolių',
    'mk': 'Полето мора да биде најмногу $maxLength карактери долго',
    'ms': 'Medan mesti paling banyak $maxLength aksara panjang',
    'no': 'Feltet må være maksimalt $maxLength tegn langt',
    'pl': 'Pole musi mieć co najwyżej $maxLength znaków',
    'pt': 'O campo deve ter no máximo $maxLength caracteres',
    'ro': 'Câmpul trebuie să aibă cel mult $maxLength caractere',
    'ru': 'Поле должно быть не длиннее $maxLength символов',
    'sr': 'Polje mora biti najviše $maxLength karaktera dugo',
    'sk': 'Pole musí mať najviac $maxLength znakov',
    'sl': 'Polje mora biti dolgo največ $maxLength znakov',
    'es': 'El campo debe tener como máximo $maxLength caracteres',
    'sv': 'Fältet får vara högst $maxLength tecken långt',
    'th': 'ฟิลด์ต้องมีความยาวไม่เกิน $maxLength อักขระ',
    'tr': 'Alan en fazla $maxLength karakter uzunluğunda olmalıdır',
    'uk': 'Поле повинно бути не більше $maxLength символів',
    'vi': 'Trường phải dài tối đa $maxLength ký tự',
  };
}

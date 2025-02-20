import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension DigitsOnlyExtensions on Validator {
  Validator digitsOnly({String? errorMessage}) {
    addRule(DigitsOnlyRule(errorMessage: errorMessage));
    return this;
  }
}

class DigitsOnlyRule extends ValidatorRule {
  const DigitsOnlyRule({super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;
    return RegExp(r'^[0-9]+$').hasMatch(value)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Only digits are allowed',
    'ar': 'مسموح بالأرقام فقط',
    'ckb': 'تەنها ژمارە ڕەوا بێت',
    'af': 'Slegs syfers word toegelaat',
    'sq': 'Lejohen vetëm shifrat',
    'be': 'Дазволены толькі лічбы',
    'bg': 'Разрешени са само цифри',
    'ca': 'Només es permeten dígits',
    'zh': '只允许数字',
    'zh_Hant': '只允許數字',
    'hr': 'Dozvoljeni su samo brojevi',
    'cs': 'Jsou povoleny pouze číslice',
    'da': 'Kun cifre er tilladt',
    'nl': 'Alleen cijfers zijn toegestaan',
    'en_GB': 'Only digits are allowed',
    'et': 'Lubatud on ainult numbrid',
    'fi': 'Vain numerot ovat sallittuja',
    'fr': 'Seuls les chiffres sont autorisés',
    'de': 'Nur Ziffern sind erlaubt',
    'el': 'Επιτρέπονται μόνο ψηφία',
    'hi': 'केवल अंक ही अनुमत हैं',
    'hu': 'Csak számjegyek engedélyezettek',
    'is': 'Aðeins tölustafir eru leyfðir',
    'id': 'Hanya angka yang diperbolehkan',
    'it': 'Sono consentite solo cifre',
    'ja': '数字のみが許可されます',
    'ko': '숫자만 허용됩니다',
    'lv': 'Atļauti tikai cipari',
    'lt': 'Leidžiami tik skaičiai',
    'mk': 'Дозволени се само цифри',
    'ms': 'Hanya digit dibenarkan',
    'no': 'Bare sifre er tillatt',
    'pl': 'Dozwolone są tylko cyfry',
    'pt_BR': 'Apenas dígitos são permitidos',
    'pt': 'Apenas dígitos são permitidos',
    'ro': 'Sunt permise doar cifre',
    'ru': 'Разрешены только цифры',
    'sr': 'Dozvoljeni su samo brojevi',
    'sk': 'Sú povolené iba číslice',
    'sl': 'Dovoljene so samo številke',
    'es': 'Solo se permiten dígitos',
    'sv': 'Endast siffror är tillåtna',
    'th': 'อนุญาตเฉพาะตัวเลขเท่านั้น',
    'tr': 'Yalnızca rakamlara izin verilir',
    'uk': 'Дозволені лише цифри',
    'vi': 'Chỉ cho phép chữ số',
  };
}

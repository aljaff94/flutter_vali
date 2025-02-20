import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension ContainsExtensions on Validator {
  Validator contains(String substring, {String? errorMessage}) {
    addRule(ContainsRule(substring, errorMessage: errorMessage));
    return this;
  }
}

class ContainsRule extends ValidatorRule {
  final String substring;

  const ContainsRule(this.substring, {super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    return value != null && value.contains(substring)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

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
    'zh_Hant': '字段必須包含 "$substring"',
    'hr': 'polje mora sadržavati "$substring"',
    'cs': 'pole musí obsahovat "$substring"',
    'da': 'feltet skal indeholde "$substring"',
    'nl': 'veld moet "$substring" bevatten',
    'en_GB': 'field must contain "$substring"',
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
    'pt_BR': 'o campo deve conter "$substring"',
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

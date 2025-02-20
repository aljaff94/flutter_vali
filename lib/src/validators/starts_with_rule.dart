import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension StartsWithExtensions on Validator {
  Validator startsWith(String prefix, {String? errorMessage}) {
    addRule(StartsWithRule(prefix, errorMessage: errorMessage));
    return this;
  }
}

class StartsWithRule extends ValidatorRule {
  final String prefix;

  const StartsWithRule(this.prefix, {super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null) return null;
    return value.startsWith(prefix)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Field must start with "$prefix"',
    'ar': 'يجب أن يبدأ الحقل بـ "$prefix"',
    'ckb': 'خانەکە دەبێت بە "$prefix" دەست پێ بکات',
    'af': 'Veld moet begin met "$prefix"',
    'sq': 'Fusha duhet të fillojë me "$prefix"',
    'be': 'Поле павінна пачынацца з "$prefix"',
    'bg': 'Полето трябва да започва с "$prefix"',
    'ca': 'El camp ha de començar amb "$prefix"',
    'zh': '字段必须以 "$prefix" 开头',
    'hr': 'Polje mora početi s "$prefix"',
    'cs': 'Pole musí začínat "$prefix"',
    'da': 'Feltet skal starte med "$prefix"',
    'nl': 'Veld moet beginnen met "$prefix"',
    'et': 'Väli peab algama "$prefix"',
    'fi': 'Kentän on alettava "$prefix"',
    'fr': 'Le champ doit commencer par "$prefix"',
    'de': 'Feld muss mit "$prefix" beginnen',
    'el': 'Το πεδίο πρέπει να ξεκινά με "$prefix"',
    'hi': 'फ़ील्ड को "$prefix" से शुरू होना चाहिए',
    'hu': 'A mezőnek "$prefix" -el kell kezdődnie',
    'is': 'Reiturinn verður að byrja á "$prefix"',
    'id': 'Kolom harus dimulai dengan "$prefix"',
    'it': 'Il campo deve iniziare con "$prefix"',
    'ja': 'フィールドは "$prefix" で始まる必要があります',
    'ko': '필드는 "$prefix"로 시작해야 합니다',
    'lv': 'Lauks jāsākas ar "$prefix"',
    'lt': 'Laukas turi prasidėti "$prefix"',
    'mk': 'Полето мора да започне со "$prefix"',
    'ms': 'Medan mesti bermula dengan "$prefix"',
    'no': 'Feltet må starte med "$prefix"',
    'pl': 'Pole musi zaczynać się od "$prefix"',
    'pt': 'O campo deve começar com "$prefix"',
    'ro': 'Câmpul trebuie să înceapă cu "$prefix"',
    'ru': 'Поле должно начинаться с "$prefix"',
    'sr': 'Polje mora početi sa "$prefix"',
    'sk': 'Pole musí začínať "$prefix"',
    'sl': 'Polje se mora začeti z "$prefix"',
    'es': 'El campo debe comenzar con "$prefix"',
    'sv': 'Fältet måste börja med "$prefix"',
    'th': 'ฟิลด์ต้องเริ่มต้นด้วย "$prefix"',
    'tr': 'Alan "$prefix" ile başlamalıdır',
    'uk': 'Поле повинно починатися з "$prefix"',
    'vi': 'Trường phải bắt đầu bằng "$prefix"',
  };
}

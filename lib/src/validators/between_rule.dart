import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension BetweenExtensions on Validator {
  Validator between(num min, num max, {String? errorMessage}) {
    addRule(BetweenRule(min, max, errorMessage: errorMessage));
    return this;
  }
}

class BetweenRule extends ValidatorRule {
  final num min;
  final num max;

  const BetweenRule(this.min, this.max, {super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;
    final numValue = num.tryParse(value);
    return numValue != null && numValue >= min && numValue <= max
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must be between $min and $max',
    'ar': 'يجب أن تكون القيمة بين $min و $max',
    'ckb': 'بەهایەکە دەبێت لە نێوان $min و $max بێت',
    'af': 'Waarde moet tussen $min en $max wees',
    'sq': 'Vlera duhet të jetë midis $min dhe $max',
    'be': 'Значэнне павінна быць паміж $min і $max',
    'bg': 'Стойността трябва да бъде между $min и $max',
    'ca': 'El valor ha de ser entre $min i $max',
    'zh': '值必须介于 $min 和 $max 之间',
    'hr': 'Vrijednost mora biti između $min i $max',
    'cs': 'Hodnota musí být mezi $min a $max',
    'da': 'Værdien skal være mellem $min og $max',
    'nl': 'Waarde moet tussen $min en $max zijn',
    'et': 'Väärtus peab olema vahemikus $min kuni $max',
    'fi': 'Arvon on oltava välillä $min ja $max',
    'fr': 'La valeur doit être comprise entre $min et $max',
    'de': 'Der Wert muss zwischen $min und $max liegen',
    'el': 'Η τιμή πρέπει να είναι μεταξύ $min και $max',
    'hi': 'मान $min और $max के बीच होना चाहिए',
    'hu': 'Az értéknek $min és $max között kell lennie',
    'is': 'Gildið verður að vera á milli $min og $max',
    'id': 'Nilai harus antara $min dan $max',
    'it': 'Il valore deve essere compreso tra $min e $max',
    'ja': '値は $min から $max の間でなければなりません',
    'ko': '값은 $min 이상 $max 이하여야 합니다',
    'lv': 'Vērtībai jābūt starp $min un $max',
    'lt': 'Vertė turi būti tarp $min ir $max',
    'mk': 'Вредноста мора да биде помеѓу $min и $max',
    'ms': 'Nilai mesti antara $min dan $max',
    'no': 'Verdien må være mellom $min og $max',
    'pl': 'Wartość musi być pomiędzy $min a $max',
    'pt': 'O valor deve estar entre $min e $max',
    'ro': 'Valoarea trebuie să fie între $min și $max',
    'ru': 'Значение должно быть между $min и $max',
    'sr': 'Vrednost mora biti između $min i $max',
    'sk': 'Hodnota musí byť medzi $min a $max',
    'sl': 'Vrednost mora biti med $min in $max',
    'es': 'El valor debe estar entre $min y $max',
    'sv': 'Värdet måste vara mellan $min och $max',
    'th': 'ค่าต้องอยู่ระหว่าง $min และ $max',
    'tr': 'Değer $min ile $max arasında olmalıdır',
    'uk': 'Значення повинно бути між $min і $max',
    'vi': 'Giá trị phải nằm trong khoảng từ $min đến $max',
  };
}

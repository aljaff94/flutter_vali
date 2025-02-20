import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension GreaterThanExtensions on Validator {
  Validator greaterThan(num minValue, {String? errorMessage}) {
    addRule(GreaterThanRule(minValue, errorMessage: errorMessage));
    return this;
  }
}

class GreaterThanRule extends ValidatorRule {
  final num minValue;

  const GreaterThanRule(this.minValue, {super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final numValue = num.tryParse(value);
    return numValue == null || numValue > minValue
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must be greater than $minValue',
    'ar': 'يجب أن تكون القيمة أكبر من $minValue',
    'ckb': 'بەهایەکە دەبێت لە $minValue زیاتر بێت',
    'af': 'Waarde moet groter wees as $minValue',
    'sq': 'Vlera duhet të jetë më e madhe se $minValue',
    'be': 'Значэнне павінна быць большым за $minValue',
    'bg': 'Стойността трябва да е по-голяма от $minValue',
    'ca': 'El valor ha de ser superior a $minValue',
    'zh': '值必须大于 $minValue',
    'hr': 'Vrijednost mora biti veća od $minValue',
    'cs': 'Hodnota musí být větší než $minValue',
    'da': 'Værdien skal være større end $minValue',
    'nl': 'Waarde moet groter zijn dan $minValue',
    'et': 'Väärtus peab olema suurem kui $minValue',
    'fi': 'Arvon on oltava suurempi kuin $minValue',
    'fr': 'La valeur doit être supérieure à $minValue',
    'de': 'Der Wert muss größer sein als $minValue',
    'el': 'Η τιμή πρέπει να είναι μεγαλύτερη από $minValue',
    'hi': 'मान $minValue से अधिक होना चाहिए',
    'hu': 'Az értéknek nagyobbnak kell lennie, mint $minValue',
    'is': 'Gildið verður að vera meira en $minValue',
    'id': 'Nilai harus lebih besar dari $minValue',
    'it': 'Il valore deve essere maggiore di $minValue',
    'ja': '値は $minValue より大きくなければなりません',
    'ko': '값은 $minValue보다 커야 합니다',
    'lv': 'Vērtībai jābūt lielākai par $minValue',
    'lt': 'Vertė turi būti didesnė nei $minValue',
    'mk': 'Вредноста мора да биде поголема од $minValue',
    'ms': 'Nilai mesti lebih besar daripada $minValue',
    'no': 'Verdien må være større enn $minValue',
    'pl': 'Wartość musi być większa niż $minValue',
    'pt': 'O valor deve ser maior que $minValue',
    'ro': 'Valoarea trebuie să fie mai mare decât $minValue',
    'ru': 'Значение должно быть больше $minValue',
    'sr': 'Vrednost mora biti veća od $minValue',
    'sk': 'Hodnota musí byť väčšia ako $minValue',
    'sl': 'Vrednost mora biti večja od $minValue',
    'es': 'El valor debe ser mayor que $minValue',
    'sv': 'Värdet måste vara större än $minValue',
    'th': 'ค่าต้องมากกว่า $minValue',
    'tr': 'Değer $minValue\'den büyük olmalıdır',
    'uk': 'Значення повинно бути більше $minValue',
    'vi': 'Giá trị phải lớn hơn $minValue',
  };
}

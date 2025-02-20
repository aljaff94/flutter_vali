import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add greater than validation rule.
extension GreaterThanExtensions on Validator {
  /// Adds a [GreaterThanRule] to the validator.
  ///
  /// [minValue] is the minimum value that the input must be greater than.
  /// [errorMessage] is an optional custom error message.
  Validator greaterThan(num minValue, {String? errorMessage}) {
    addRule(GreaterThanRule(minValue, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is greater than a specified minimum value.
class GreaterThanRule extends ValidatorRule {
  /// The minimum value that the input must be greater than.
  final num minValue;

  /// Creates a [GreaterThanRule] with the given [minValue] and optional [errorMessage].
  const GreaterThanRule(this.minValue, {super.errorMessage});

  /// Validates if the [value] is greater than [minValue].
  ///
  /// Returns `null` if the value is valid, otherwise returns an error message.
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

  /// Default error messages for different locales.
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

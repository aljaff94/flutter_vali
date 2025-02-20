import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add a less than rule.
extension LessThanExtensions on Validator {
  /// Adds a [LessThanRule] to the validator.
  ///
  /// [maxValue] is the maximum value allowed.
  /// [errorMessage] is the optional error message to display if validation fails.
  Validator lessThan(num maxValue, {String? errorMessage}) {
    addRule(LessThanRule(maxValue, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is less than a specified maximum value.
class LessThanRule extends ValidatorRule {
  /// The maximum value allowed.
  final num maxValue;

  /// Creates a [LessThanRule] with the given [maxValue] and optional [errorMessage].
  const LessThanRule(this.maxValue, {super.errorMessage});

  /// Validates if the [value] is less than [maxValue].
  ///
  /// Returns `null` if the value is valid, otherwise returns the error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final numValue = num.tryParse(value);
    return numValue == null || numValue < maxValue
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must be less than $maxValue',
    'ar': 'يجب أن تكون القيمة أقل من $maxValue',
    'ckb': 'بەهایەکە دەبێت لە $maxValue کەمتر بێت',
    'af': 'Waarde moet minder as $maxValue wees',
    'sq': 'Vlera duhet të jetë më pak se $maxValue',
    'be': 'Значэнне павінна быць меншым за $maxValue',
    'bg': 'Стойността трябва да бъде по-малка от $maxValue',
    'ca': 'El valor ha de ser inferior a $maxValue',
    'zh': '值必须小于 $maxValue',
    'hr': 'Vrijednost mora biti manja od $maxValue',
    'cs': 'Hodnota musí být menší než $maxValue',
    'da': 'Værdien skal være mindre end $maxValue',
    'nl': 'Waarde moet minder zijn dan $maxValue',
    'et': 'Väärtus peab olema väiksem kui $maxValue',
    'fi': 'Arvon on oltava pienempi kuin $maxValue',
    'fr': 'La valeur doit être inférieure à $maxValue',
    'de': 'Der Wert muss kleiner als $maxValue sein',
    'el': 'Η τιμή πρέπει να είναι μικρότερη από $maxValue',
    'hi': 'मान $maxValue से कम होना चाहिए',
    'hu': 'Az értéknek kisebbnek kell lennie, mint $maxValue',
    'is': 'Gildið verður að vera minna en $maxValue',
    'id': 'Nilai harus kurang dari $maxValue',
    'it': 'Il valore deve essere inferiore a $maxValue',
    'ja': '値は $maxValue 未満でなければなりません',
    'ko': '값은 $maxValue 미만이어야 합니다',
    'lv': 'Vērtībai jābūt mazākai par $maxValue',
    'lt': 'Vertė turi būti mažesnė nei $maxValue',
    'mk': 'Вредноста мора да биде помала од $maxValue',
    'ms': 'Nilai mesti kurang daripada $maxValue',
    'no': 'Verdien må være mindre enn $maxValue',
    'pl': 'Wartość musi być mniejsza niż $maxValue',
    'pt': 'O valor deve ser menor que $maxValue',
    'ro': 'Valoarea trebuie să fie mai mică decât $maxValue',
    'ru': 'Значение должно быть меньше $maxValue',
    'sr': 'Vrednost mora biti manja od $maxValue',
    'sk': 'Hodnota musí byť menšia ako $maxValue',
    'sl': 'Vrednost mora biti manjša od $maxValue',
    'es': 'El valor debe ser menor que $maxValue',
    'sv': 'Värdet måste vara mindre än $maxValue',
    'th': 'ค่าต้องน้อยกว่า $maxValue',
    'tr': 'Değer $maxValue\'dan küçük olmalıdır',
    'uk': 'Значення повинно бути менше $maxValue',
    'vi': 'Giá trị phải nhỏ hơn $maxValue',
  };
}

import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add greater than or equal rule.
extension GreaterThanOrEqualExtensions on Validator {
  /// Adds a [GreaterThanOrEqualRule] to the validator.
  ///
  /// [minValue] is the minimum value that the input should be greater than or equal to.
  /// [errorMessage] is the optional error message to display if validation fails.
  Validator greaterThanOrEqual(num minValue, {String? errorMessage}) {
    addRule(GreaterThanOrEqualRule(minValue, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is greater than or equal to a specified minimum value.
class GreaterThanOrEqualRule extends ValidatorRule {
  /// The minimum value that the input should be greater than or equal to.
  final num minValue;

  /// Creates a [GreaterThanOrEqualRule] with the given [minValue] and optional [errorMessage].
  const GreaterThanOrEqualRule(this.minValue, {super.errorMessage});

  /// Validates if the [value] is greater than or equal to [minValue].
  ///
  /// Returns `null` if the validation passes, otherwise returns the error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final numValue = num.tryParse(value);
    return numValue == null || numValue >= minValue
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must be greater than or equal to $minValue',
    'ar': 'يجب أن تكون القيمة أكبر من أو تساوي $minValue',
    'ckb': 'بەهایەکە دەبێت لە $minValue زیاتر یان یەکسان بێت',
    'af': 'Waarde moet groter as of gelyk aan $minValue wees',
    'sq': 'Vlera duhet të jetë më e madhe ose e barabartë me $minValue',
    'be': 'Значэнне павінна быць большым або роўным $minValue',
    'bg': 'Стойността трябва да бъде по-голяма или равна на $minValue',
    'ca': 'El valor ha de ser més gran o igual a $minValue',
    'zh': '值必须大于或等于 $minValue',
    'hr': 'Vrijednost mora biti veća ili jednaka $minValue',
    'cs': 'Hodnota musí být větší nebo rovna $minValue',
    'da': 'Værdien skal være større end eller lig med $minValue',
    'nl': 'Waarde moet groter dan of gelijk aan $minValue zijn',
    'et': 'Väärtus peab olema suurem või võrdne $minValue',
    'fi': 'Arvon on oltava suurempi tai yhtä suuri kuin $minValue',
    'fr': 'La valeur doit être supérieure ou égale à $minValue',
    'de': 'Der Wert muss größer oder gleich $minValue sein',
    'el': 'Η τιμή πρέπει να είναι μεγαλύτερη ή ίση με $minValue',
    'hi': 'मान $minValue से अधिक या बराबर होना चाहिए',
    'hu': 'Az értéknek nagyobbnak vagy egyenlőnek kell lennie $minValue',
    'is': 'Gildið verður að vera meira en eða jafnt og $minValue',
    'id': 'Nilai harus lebih besar dari atau sama dengan $minValue',
    'it': 'Il valore deve essere maggiore o uguale a $minValue',
    'ja': '値は $minValue 以上でなければなりません',
    'ko': '값은 $minValue 이상이어야 합니다',
    'lv': 'Vērtībai jābūt lielākai vai vienādai ar $minValue',
    'lt': 'Vertė turi būti didesnė arba lygi $minValue',
    'mk': 'Вредноста мора да биде поголема или еднаква на $minValue',
    'ms': 'Nilai mesti lebih besar daripada atau sama dengan $minValue',
    'no': 'Verdien må være større enn eller lik $minValue',
    'pl': 'Wartość musi być większa lub równa $minValue',
    'pt': 'O valor deve ser maior ou igual a $minValue',
    'ro': 'Valoarea trebuie să fie mai mare sau egală cu $minValue',
    'ru': 'Значение должно быть больше или равно $minValue',
    'sr': 'Vrednost mora biti veća ili jednaka $minValue',
    'sk': 'Hodnota musí byť väčšia alebo rovná $minValue',
    'sl': 'Vrednost mora biti večja ali enaka $minValue',
    'es': 'El valor debe ser mayor o igual a $minValue',
    'sv': 'Värdet måste vara större än eller lika med $minValue',
    'th': 'ค่าต้องมากกว่าหรือเท่ากับ $minValue',
    'tr': 'Değer $minValue\'den büyük veya ona eşit olmalıdır',
    'uk': 'Значення повинно бути більше або дорівнювати $minValue',
    'vi': 'Giá trị phải lớn hơn hoặc bằng $minValue',
  };
}

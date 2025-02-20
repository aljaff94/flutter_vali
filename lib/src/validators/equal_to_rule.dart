import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add equal to validation rule.
extension EqualToExtensions on Validator {
  /// Adds an [EqualToRule] to the validator.
  ///
  /// The [target] parameter specifies the value that the input should be equal to.
  /// The [errorMessage] parameter is optional and can be used to provide a custom error message.
  Validator equalTo(num target, {String? errorMessage}) {
    addRule(EqualToRule(target, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is equal to a target value.
class EqualToRule extends ValidatorRule {
  /// The target value that the input should be equal to.
  final num target;

  /// Creates an [EqualToRule] with the given [target] value and an optional [errorMessage].
  const EqualToRule(this.target, {super.errorMessage});

  /// Validates if the [value] is equal to the [target].
  ///
  /// Returns `null` if the value is equal to the target, otherwise returns an error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;
    final numValue = num.tryParse(value);
    return numValue != null && numValue == target
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Provides default error messages in multiple languages.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must be equal to $target',
    'ar': 'يجب أن تكون القيمة مساوية ل $target',
    'ckb': 'بەهایەکە دەبێت یەکسان بێت بە $target',
    'af': 'Waarde moet gelyk wees aan $target',
    'sq': 'Vlera duhet të jetë e barabartë me $target',
    'be': 'Значэнне павінна быць роўным $target',
    'bg': 'Стойността трябва да бъде равна на $target',
    'ca': 'El valor ha de ser igual a $target',
    'zh': '值必须等于 $target',
    'hr': 'Vrijednost mora biti jednaka $target',
    'cs': 'Hodnota musí být rovna $target',
    'da': 'Værdien skal være lig med $target',
    'nl': 'Waarde moet gelijk zijn aan $target',
    'et': 'Väärtus peab olema võrdne $target',
    'fi': 'Arvon on oltava yhtä suuri kuin $target',
    'fr': 'La valeur doit être égale à $target',
    'de': 'Der Wert muss gleich $target sein',
    'el': 'Η τιμή πρέπει να είναι ίση με $target',
    'hi': 'मान $target के बराबर होना चाहिए',
    'hu': 'Az értéknek egyenlőnek kell lennie $target',
    'is': 'Gildið verður að vera jafnt $target',
    'id': 'Nilai harus sama dengan $target',
    'it': 'Il valore deve essere uguale a $target',
    'ja': '値は $target と等しくなければなりません',
    'ko': '값은 $target 와 같아야 합니다',
    'lv': 'Vērtībai jābūt vienādai ar $target',
    'lt': 'Vertė turi būti lygi $target',
    'mk': 'Вредноста мора да биде еднаква на $target',
    'ms': 'Nilai mesti sama dengan $target',
    'no': 'Verdien må være lik $target',
    'pl': 'Wartość musi być równa $target',
    'pt': 'O valor deve ser igual a $target',
    'ro': 'Valoarea trebuie să fie egală cu $target',
    'ru': 'Значение должно быть равно $target',
    'sr': 'Vrednost mora biti jednaka $target',
    'sk': 'Hodnota musí byť rovná $target',
    'sl': 'Vrednost mora biti enaka $target',
    'es': 'El valor debe ser igual a $target',
    'sv': 'Värdet måste vara lika med $target',
    'th': 'ค่าต้องเท่ากับ $target',
    'tr': 'Değer $target ile eşit olmalıdır',
    'uk': 'Значення повинно бути рівним $target',
    'vi': 'Giá trị phải bằng $target',
  };
}

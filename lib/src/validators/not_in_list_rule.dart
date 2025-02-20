import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add a rule that checks if a value is not in a list.
extension NotInListExtensions on Validator {
  /// Adds a [NotInListRule] to the validator.
  ///
  /// [values] is the list of values that the input should not be in.
  /// [errorMessage] is the optional error message to display if validation fails.
  Validator notInList(List<String> values, {String? errorMessage}) {
    addRule(NotInListRule(values, errorMessage: errorMessage));
    return this;
  }
}

/// A rule that checks if a value is not in a specified list of values.
class NotInListRule extends ValidatorRule {
  /// The list of values that the input should not be in.
  final List<String> values;

  /// Creates a [NotInListRule] with the given list of [values] and an optional [errorMessage].
  const NotInListRule(this.values, {super.errorMessage});

  /// Validates if the [value] is not in the list of [values].
  ///
  /// Returns `null` if the value is valid, otherwise returns the error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;
    return !values.contains(value)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// The default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must not be one of: ${values.join(', ')}',
    'ar': 'يجب ألا تكون القيمة واحدة من: ${values.join(', ')}',
    'ckb': 'بەهاکە نابێت یەکێک بێت لە: ${values.join(', ')}',
    'af': 'Waarde moet nie een van wees nie: ${values.join(', ')}',
    'sq': 'Vlera nuk duhet të jetë një nga: ${values.join(', ')}',
    'be': 'Значэнне не павінна быць адным з: ${values.join(', ')}',
    'bg': 'Стойността не трябва да бъде една от: ${values.join(', ')}',
    'ca': 'El valor no ha de ser un dels: ${values.join(', ')}',
    'zh': '值不能是以下之一：${values.join(', ')}',
    'hr': 'Vrijednost ne smije biti jedna od: ${values.join(', ')}',
    'cs': 'Hodnota nesmí být jednou z: ${values.join(', ')}',
    'da': 'Værdien må ikke være en af: ${values.join(', ')}',
    'nl': 'Waarde mag niet een van zijn: ${values.join(', ')}',
    'et': 'Väärtus ei tohi olla üks järgmistest: ${values.join(', ')}',
    'fi': 'Arvo ei saa olla yksi seuraavista: ${values.join(', ')}',
    'fr': 'La valeur ne doit pas être l\'une de: ${values.join(', ')}',
    'de': 'Der Wert darf nicht einer der folgenden sein: ${values.join(', ')}',
    'el': 'Η τιμή δεν πρέπει να είναι μία από: ${values.join(', ')}',
    'hi': 'मान निम्न में से एक नहीं होना चाहिए: ${values.join(', ')}',
    'hu': 'Az érték nem lehet egy a következők közül: ${values.join(', ')}',
    'is': 'Gildið má ekki vera eitt af: ${values.join(', ')}',
    'id': 'Nilai tidak boleh salah satu dari: ${values.join(', ')}',
    'it': 'Il valore non deve essere uno di: ${values.join(', ')}',
    'ja': '値は次のいずれかであってはなりません: ${values.join(', ')}',
    'ko': '값은 다음 중 하나가 아니어야 합니다: ${values.join(', ')}',
    'lv': 'Vērtība nedrīkst būt viena no: ${values.join(', ')}',
    'lt': 'Vertė neturi būti viena iš: ${values.join(', ')}',
    'mk': 'Вредноста не смее да биде една од: ${values.join(', ')}',
    'ms': 'Nilai tidak boleh menjadi salah satu daripada: ${values.join(', ')}',
    'no': 'Verdien må ikke være en av: ${values.join(', ')}',
    'pl': 'Wartość nie może być jedną z: ${values.join(', ')}',
    'pt': 'O valor não deve ser um dos: ${values.join(', ')}',
    'ro': 'Valoarea nu trebuie să fie una dintre: ${values.join(', ')}',
    'ru': 'Значение не должно быть одним из: ${values.join(', ')}',
    'sr': 'Vrednost ne sme biti jedna od: ${values.join(', ')}',
    'sk': 'Hodnota nesmie byť jednou z: ${values.join(', ')}',
    'sl': 'Vrednost ne sme biti ena od: ${values.join(', ')}',
    'es': 'El valor no debe ser uno de: ${values.join(', ')}',
    'sv': 'Värdet får inte vara ett av: ${values.join(', ')}',
    'th': 'ค่าต้องไม่เป็นหนึ่งใน: ${values.join(', ')}',
    'tr': 'Değer şunlardan biri olmamalıdır: ${values.join(', ')}',
    'uk': 'Значення не повинно бути одним із: ${values.join(', ')}',
    'vi': 'Giá trị không được là một trong những: ${values.join(', ')}',
  };
}

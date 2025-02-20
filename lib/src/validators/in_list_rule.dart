import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add in-list validation rule.
extension InListExtensions on Validator {
  /// Adds an [InListRule] to the validator.
  ///
  /// [values] is the list of valid values.
  /// [errorMessage] is the optional error message to display if validation fails.
  Validator inList(List<String> values, {String? errorMessage}) {
    addRule(InListRule(values, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is in a list of valid values.
class InListRule extends ValidatorRule {
  /// The list of valid values.
  final List<String> values;

  /// Creates an [InListRule] with the given list of valid [values] and an optional [errorMessage].
  const InListRule(this.values, {super.errorMessage});

  /// Validates if the [value] is in the list of valid values.
  ///
  /// Returns `null` if the value is valid, otherwise returns the error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;
    return values.contains(value)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// The default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must be one of: ${values.join(', ')}',
    'ar': 'يجب أن تكون القيمة واحدة من: ${values.join(', ')}',
    'ckb': 'بەهاکە دەبێت یەکێک بێت لە: ${values.join(', ')}',
    'af': 'Waarde moet een van die volgende wees: ${values.join(', ')}',
    'sq': 'Vlera duhet të jetë një nga: ${values.join(', ')}',
    'be': 'Значэнне павінна быць адным з: ${values.join(', ')}',
    'bg': 'Стойността трябва да бъде една от: ${values.join(', ')}',
    'ca': 'El valor ha de ser un dels següents: ${values.join(', ')}',
    'zh': '值必须是以下之一：${values.join(', ')}',
    'hr': 'Vrijednost mora biti jedna od: ${values.join(', ')}',
    'cs': 'Hodnota musí být jednou z: ${values.join(', ')}',
    'da': 'Værdien skal være en af: ${values.join(', ')}',
    'nl': 'Waarde moet een van de volgende zijn: ${values.join(', ')}',
    'et': 'Väärtus peab olema üks järgmistest: ${values.join(', ')}',
    'fi': 'Arvon on oltava yksi seuraavista: ${values.join(', ')}',
    'fr': 'La valeur doit être l\'une des suivantes : ${values.join(', ')}',
    'de': 'Der Wert muss einer der folgenden sein: ${values.join(', ')}',
    'el': 'Η τιμή πρέπει να είναι μία από τις εξής: ${values.join(', ')}',
    'hi': 'मान निम्नलिखित में से एक होना चाहिए: ${values.join(', ')}',
    'hu': 'Az értéknek az alábbiak egyikének kell lennie: ${values.join(', ')}',
    'is': 'Gildið verður að vera eitt af eftirfarandi: ${values.join(', ')}',
    'id': 'Nilai harus salah satu dari: ${values.join(', ')}',
    'it': 'Il valore deve essere uno di: ${values.join(', ')}',
    'ja': '値は次のいずれかでなければなりません: ${values.join(', ')}',
    'ko': '값은 다음 중 하나여야 합니다: ${values.join(', ')}',
    'lv': 'Vērtībai jābūt vienai no: ${values.join(', ')}',
    'lt': 'Vertė turi būti viena iš: ${values.join(', ')}',
    'mk': 'Вредноста мора да биде една од: ${values.join(', ')}',
    'ms': 'Nilai mesti salah satu daripada: ${values.join(', ')}',
    'no': 'Verdien må være en av: ${values.join(', ')}',
    'pl': 'Wartość musi być jedną z: ${values.join(', ')}',
    'pt': 'O valor deve ser um dos seguintes: ${values.join(', ')}',
    'ro': 'Valoarea trebuie să fie una dintre: ${values.join(', ')}',
    'ru': 'Значение должно быть одним из: ${values.join(', ')}',
    'sr': 'Vrednost mora biti jedna od: ${values.join(', ')}',
    'sk': 'Hodnota musí byť jednou з: ${values.join(', ')}',
    'sl': 'Vrednost mora biti ena od: ${values.join(', ')}',
    'es': 'El valor debe ser uno de: ${values.join(', ')}',
    'sv': 'Värdet måste vara ett av: ${values.join(', ')}',
    'th': 'ค่าต้องเป็นหนึ่งใน: ${values.join(', ')}',
    'tr': 'Değer şu seçeneklerden biri olmalıdır: ${values.join(', ')}',
    'uk': 'Значення повинно бути одним з: ${values.join(', ')}',
    'vi': 'Giá trị phải là một trong số: ${values.join(', ')}',
  };
}

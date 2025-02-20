import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add phone number validation.
extension PhoneNumberExtensions on Validator {
  /// Adds a phone number validation rule to the validator.
  ///
  /// [pattern] is an optional regex pattern to validate the phone number.
  /// [errorMessage] is an optional error message to display if validation fails.
  Validator phoneNumber({String? pattern, String? errorMessage}) {
    addRule(PhoneNumberRule(pattern, errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is a valid phone number.
class PhoneNumberRule extends ValidatorRule {
  /// The regex pattern to validate the phone number.
  final String? pattern;

  /// Creates a new [PhoneNumberRule].
  ///
  /// [pattern] is an optional regex pattern to validate the phone number.
  /// [errorMessage] is an optional error message to display if validation fails.
  const PhoneNumberRule(this.pattern, {super.errorMessage});

  /// Validates the given [value] as a phone number.
  ///
  /// Returns `null` if the value is valid, otherwise returns an error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final effectivePattern = pattern ?? r'^\+?[0-9]{7,15}$';
    final regex = RegExp(effectivePattern);

    return regex.hasMatch(value)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Invalid phone number',
    'ar': 'رقم الهاتف غير صالح',
    'ckb': 'ژمارەی تەلەفۆن نادروستە',
    'af': 'Ongeldige telefoonnommer',
    'sq': 'Numri i telefonit i pavlefshëm',
    'be': 'Няправільны нумар тэлефона',
    'bg': 'Невалиден телефонен номер',
    'ca': 'Número de telèfon invàlid',
    'zh': '无效的电话号码',
    'hr': 'Nevažeći telefonski broj',
    'cs': 'Neplatné telefonní číslo',
    'da': 'Ugyldigt telefonnummer',
    'nl': 'Ongeldig telefoonnummer',
    'et': 'Kehtetu telefoninumber',
    'fi': 'Virheellinen puhelinnumero',
    'fr': 'Numéro de téléphone invalide',
    'de': 'Ungültige Telefonnummer',
    'el': 'Μη έγκυρος αριθμός τηλεφώνου',
    'hi': 'अमान्य फोन नंबर',
    'hu': 'Érvénytelen telefonszám',
    'is': 'Ógilt símanúmer',
    'id': 'Nomor telepon tidak valid',
    'it': 'Numero di telefono non valido',
    'ja': '無効な電話番号',
    'ko': '유효하지 않은 전화번호',
    'lv': 'Nederīgs tālruņa numurs',
    'lt': 'Neteisingas telefono numeris',
    'mk': 'Невалиден телефонски број',
    'ms': 'Nombor telefon tidak sah',
    'no': 'Ugyldig telefonnummer',
    'pl': 'Nieprawidłowy numer telefonu',
    'pt': 'Número de telefone inválido',
    'ro': 'Număr de telefon invalid',
    'ru': 'Неверный номер телефона',
    'sr': 'Неважећи број телефона',
    'sk': 'Neplatné telefónne číslo',
    'sl': 'Neveljavna telefonska številka',
    'es': 'Número de teléfono no válido',
    'sv': 'Ogiltigt telefonnummer',
    'th': 'หมายเลขโทรศัพท์ไม่ถูกต้อง',
    'tr': 'Geçersiz telefon numarası',
    'uk': 'Недійсний номер телефону',
    'vi': 'Số điện thoại không hợp lệ',
  };
}

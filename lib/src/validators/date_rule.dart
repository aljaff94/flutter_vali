import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add date validation.
extension DateExtensions on Validator {
  /// Adds a [DateRule] to the validator.
  ///
  /// [errorMessage] is an optional custom error message.
  Validator date({String? errorMessage}) {
    addRule(DateRule(errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is a valid date.
class DateRule extends ValidatorRule {
  /// Creates a [DateRule] with an optional [errorMessage].
  const DateRule({super.errorMessage});

  /// Validates if the [value] is a valid date.
  ///
  /// Returns `null` if the value is valid, otherwise returns an error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      DateTime.parse(value);
      return null;
    } catch (_) {
      return errorMessage ??
          defaultMessage[Localizations.localeOf(context).languageCode] ??
          defaultMessage['en'];
    }
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Invalid date format',
    'ar': 'تنسيق التاريخ غير صالح',
    'ckb': 'فۆرماتی بەروار نادروستە',
    'af': 'Ongeldige datumformaat',
    'sq': 'Formati i datës është i pavlefshëm',
    'be': 'Няправільны фармат даты',
    'bg': 'Невалиден формат на дата',
    'ca': 'Format de data no vàlid',
    'zh': '日期格式无效',
    'hr': 'Nevažeći format datuma',
    'cs': 'Neplatný formát data',
    'da': 'Ugyldigt datoformat',
    'nl': 'Ongeldig datumformaat',
    'et': 'Vigane kuupäeva formaat',
    'fi': 'Virheellinen päivämäärän muoto',
    'fr': 'Format de date invalide',
    'de': 'Ungültiges Datumsformat',
    'el': 'Μη έγκυρη μορφή ημερομηνίας',
    'hi': 'अमान्य तिथि प्रारूप',
    'hu': 'Érvénytelen dátumformátum',
    'is': 'Ógilt dagsetningarform',
    'id': 'Format tanggal tidak valid',
    'it': 'Formato data non valido',
    'ja': '無効な日付形式',
    'ko': '잘못된 날짜 형식',
    'lv': 'Nederīgs datuma formāts',
    'lt': 'Neteisingas datos formatas',
    'mk': 'Невалиден формат на датум',
    'ms': 'Format tarikh tidak sah',
    'no': 'Ugyldig datoformat',
    'pl': 'Nieprawidłowy format daty',
    'pt': 'Formato de data inválido',
    'ro': 'Format de dată invalid',
    'ru': 'Неверный формат даты',
    'sr': 'Неважећи формат датума',
    'sk': 'Neplatný formát dátumu',
    'sl': 'Neveljaven format datuma',
    'es': 'Formato de fecha no válido',
    'sv': 'Ogiltigt datumformat',
    'th': 'รูปแบบวันที่ไม่ถูกต้อง',
    'tr': 'Geçersiz tarih formatı',
    'uk': 'Неправильний формат дати',
    'vi': 'Định dạng ngày không hợp lệ',
  };
}

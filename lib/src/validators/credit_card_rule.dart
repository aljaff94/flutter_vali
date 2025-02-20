import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [Validator] to add credit card validation.
extension CreditCardExtensions on Validator {
  /// Adds a credit card validation rule.
  ///
  /// [errorMessage] is the custom error message to be used if validation fails.
  Validator creditCard({String? errorMessage}) {
    addRule(CreditCardRule(errorMessage: errorMessage));
    return this;
  }
}

/// A validation rule that checks if a value is a valid credit card number.
class CreditCardRule extends ValidatorRule {
  /// Creates a [CreditCardRule] with an optional [errorMessage].
  const CreditCardRule({super.errorMessage});

  /// Validates if the [value] is a valid credit card number.
  ///
  /// Returns `null` if the value is valid, otherwise returns an error message.
  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final sanitized = value.replaceAll(RegExp(r'\s'), '');
    if (!RegExp(r'^\d{13,19}$').hasMatch(sanitized)) {
      return errorMessage ?? defaultMessage['en'];
    }

    int sum = 0;
    bool alternate = false;

    for (int i = sanitized.length - 1; i >= 0; i--) {
      int digit = int.parse(sanitized[i]);
      if (alternate) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  /// Default error messages for different locales.
  @override
  Map<String, String> get defaultMessage => {
    'en': 'Invalid credit card number',
    'ar': 'رقم البطاقة الائتمانية غير صالح',
    'ckb': 'ژمارەی کارتە کرێدییەکە نادروستە',
    'af': 'Ongeldige kredietkaartnommer',
    'sq': 'Numri i kartës së kreditit është i pavlefshëm',
    'be': 'Няправільны нумар крэдытнай карты',
    'bg': 'Невалиден номер на кредитна карта',
    'ca': 'Número de targeta de crèdit no vàlid',
    'zh': '信用卡号无效',
    'hr': 'Nevažeći broj kreditne kartice',
    'cs': 'Neplatné číslo kreditní karty',
    'da': 'Ugyldigt kreditkortnummer',
    'nl': 'Ongeldig creditcardnummer',
    'et': 'Kehtetu krediitkaardi number',
    'fi': 'Virheellinen luottokortin numero',
    'fr': 'Numéro de carte de crédit invalide',
    'de': 'Ungültige Kreditkartennummer',
    'el': 'Μη έγκυρος αριθμός πιστωτικής κάρτας',
    'hi': 'अमान्य क्रेडिट कार्ड नंबर',
    'hu': 'Érvénytelen hitelkártyaszám',
    'is': 'Ógilt kreditkortanúmer',
    'id': 'Nomor kartu kredit tidak valid',
    'it': 'Numero di carta di credito non valido',
    'ja': '無効なクレジットカード番号',
    'ko': '유효하지 않은 신용 카드 번호',
    'lv': 'Nederīgs kredītkartes numurs',
    'lt': 'Neteisingas kredito kortelės numeris',
    'mk': 'Невалиден број на кредитна картичка',
    'ms': 'Nombor kad kredit tidak sah',
    'no': 'Ugyldig kredittkortnummer',
    'pl': 'Nieprawidłowy numer karty kredytowej',
    'pt': 'Número de cartão de crédito inválido',
    'ro': 'Număr de card de credit invalid',
    'ru': 'Недействительный номер кредитной карты',
    'sr': 'Неважећи број кредитне картице',
    'sk': 'Neplatné číslo kreditnej karty',
    'sl': 'Neveljavna številka kreditne kartice',
    'es': 'Número de tarjeta de crédito no válido',
    'sv': 'Ogiltigt kreditkortsnummer',
    'th': 'หมายเลขบัตรเครดิตไม่ถูกต้อง',
    'tr': 'Geçersiz kredi kartı numarası',
    'uk': 'Недійсний номер кредитної картки',
    'vi': 'Số thẻ tín dụng không hợp lệ',
  };
}

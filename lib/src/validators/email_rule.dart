import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension EmailExtensions on Validator {
  Validator email({String? errorMessage}) {
    addRule(EmailRule(errorMessage: errorMessage));
    return this;
  }
}

class EmailRule extends ValidatorRule {
  const EmailRule({super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;
    return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Invalid email address',
    'ar': 'بريد إلكتروني غير صالح',
    'ckb': 'ئیمەیڵ نادروستە',
    'af': 'Ongeldige e-posadres',
    'sq': 'Adresa e emailit është e pavlefshme',
    'be': 'Няправільны адрас электроннай пошты',
    'bg': 'Невалиден имейл адрес',
    'ca': 'Adreça de correu electrònic no vàlida',
    'zh': '无效的电子邮件地址',
    'zh_Hant': '無效的電子郵件地址',
    'hr': 'Nevažeća adresa e-pošte',
    'cs': 'Neplatná e-mailová adresa',
    'da': 'Ugyldig e-mailadresse',
    'nl': 'Ongeldig e-mailadres',
    'en_GB': 'Invalid email address',
    'et': 'Vigane e-posti aadress',
    'fi': 'Virheellinen sähköpostiosoite',
    'fr': 'Adresse e-mail invalide',
    'de': 'Ungültige E-Mail-Adresse',
    'el': 'Μη έγκυρη διεύθυνση email',
    'hi': 'अमान्य ईमेल पता',
    'hu': 'Érvénytelen e-mail cím',
    'is': 'Ógilt netfang',
    'id': 'Alamat email tidak valid',
    'it': 'Indirizzo email non valido',
    'ja': '無効なメールアドレス',
    'ko': '유효하지 않은 이메일 주소',
    'lv': 'Nederīga e-pasta adrese',
    'lt': 'Neteisingas el. pašto adresas',
    'mk': 'Невалидна адреса за е-пошта',
    'ms': 'Alamat e-mel tidak sah',
    'no': 'Ugyldig e-postadresse',
    'pl': 'Nieprawidłowy adres e-mail',
    'pt_BR': 'Endereço de e-mail inválido',
    'pt': 'Endereço de e-mail inválido',
    'ro': 'Adresă de email invalidă',
    'ru': 'Неверный адрес электронной почты',
    'sr': 'Неисправна адреса е-поште',
    'sk': 'Neplatná e-mailová adresa',
    'sl': 'Neveljaven e-poštni naslov',
    'es': 'Dirección de correo electrónico no válida',
    'sv': 'Ogiltig e-postadress',
    'th': 'ที่อยู่อีเมลไม่ถูกต้อง',
    'tr': 'Geçersiz e-posta adresi',
    'uk': 'Недійсна електронна адреса',
    'vi': 'Địa chỉ email không hợp lệ',
  };
}

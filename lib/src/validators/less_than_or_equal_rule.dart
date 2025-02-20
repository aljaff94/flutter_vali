import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension LessThanOrEqualExtensions on Validator {
  Validator lessThanOrEqual(num maxValue, {String? errorMessage}) {
    addRule(LessThanOrEqualRule(maxValue, errorMessage: errorMessage));
    return this;
  }
}

class LessThanOrEqualRule extends ValidatorRule {
  final num maxValue;

  const LessThanOrEqualRule(this.maxValue, {super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final numValue = num.tryParse(value);
    return numValue == null || numValue <= maxValue
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Value must be less than or equal to $maxValue',
    'ar': 'يجب أن تكون القيمة أقل من أو تساوي $maxValue',
    'ckb': 'بەهایەکە دەبێت لە $maxValue کەمتر یان یەکسان بێت',
    'af': 'Waarde moet minder as of gelyk aan $maxValue wees',
    'sq': 'Vlera duhet të jetë më e vogël ose e barabartë me $maxValue',
    'be': 'Значэнне павінна быць меншым або роўным $maxValue',
    'bg': 'Стойността трябва да бъде по-малка или равна на $maxValue',
    'ca': 'El valor ha de ser menor o igual a $maxValue',
    'zh': '值必须小于或等于 $maxValue',
    'zh_Hant': '值必須小於或等於 $maxValue',
    'hr': 'Vrijednost mora biti manja ili jednaka $maxValue',
    'cs': 'Hodnota musí být menší nebo rovna $maxValue',
    'da': 'Værdien skal være mindre end eller lig med $maxValue',
    'nl': 'Waarde moet kleiner dan of gelijk aan $maxValue zijn',
    'en_GB': 'Value must be less than or equal to $maxValue',
    'et': 'Väärtus peab olema väiksem või võrdne $maxValue',
    'fi': 'Arvon on oltava pienempi tai yhtä suuri kuin $maxValue',
    'fr': 'La valeur doit être inférieure ou égale à $maxValue',
    'de': 'Der Wert muss kleiner oder gleich $maxValue sein',
    'el': 'Η τιμή πρέπει να είναι μικρότερη ή ίση με $maxValue',
    'hi': 'मान $maxValue से कम या बराबर होना चाहिए',
    'hu': 'Az értéknek kisebbnek vagy egyenlőnek kell lennie $maxValue',
    'is': 'Gildið verður að vera minna en eða jafnt og $maxValue',
    'id': 'Nilai harus kurang dari atau sama dengan $maxValue',
    'it': 'Il valore deve essere minore o uguale a $maxValue',
    'ja': '値は $maxValue 以下でなければなりません',
    'ko': '값은 $maxValue 이하이어야 합니다',
    'lv': 'Vērtībai jābūt mazākai vai vienādai ar $maxValue',
    'lt': 'Vertė turi būti mažesnė arba lygi $maxValue',
    'mk': 'Вредноста мора да биде помала или еднаква на $maxValue',
    'ms': 'Nilai mesti kurang daripada atau sama dengan $maxValue',
    'no': 'Verdien må være mindre enn eller lik $maxValue',
    'pl': 'Wartość musi być mniejsza lub równa $maxValue',
    'pt_BR': 'O valor deve ser menor ou igual a $maxValue',
    'pt': 'O valor deve ser menor ou igual a $maxValue',
    'ro': 'Valoarea trebuie să fie mai mică sau egală cu $maxValue',
    'ru': 'Значение должно быть меньше или равно $maxValue',
    'sr': 'Vrednost mora biti manja ili jednaka $maxValue',
    'sk': 'Hodnota musí byť menšia alebo rovná $maxValue',
    'sl': 'Vrednost mora biti manjša ali enaka $maxValue',
    'es': 'El valor debe ser menor o igual a $maxValue',
    'sv': 'Värdet måste vara mindre än eller lika med $maxValue',
    'th': 'ค่าต้องน้อยกว่าหรือเท่ากับ $maxValue',
    'tr': 'Değer $maxValue\'dan küçük veya ona eşit olmalıdır',
    'uk': 'Значення повинно бути меншим або рівним $maxValue',
    'vi': 'Giá trị phải nhỏ hơn hoặc bằng $maxValue',
  };
}

# Flutter Vali

Flutter Vali is a Dart package for Flutter that provides a set of validation rules to validate form fields easily.

## Installation

Add `flutter_vali` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_vali: ^0.1.3
```

Then run `flutter pub get` to install the package.

## Usage

### Basic Usage

To use Flutter Vali, you need to create a `Validator` instance and add validation rules to it. Then, you can use the `build` method to get a validation function that can be used with Flutter form fields.


#### Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_vali/flutter_vali.dart';

class ExampleFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Form'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
              validator: context.validators([
                notEmptyRule(),
                minLengthRule(3, errorMessage: 'Name must be at least 3 characters long'),
                maxLengthRule(32),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
```


#### Example with fluent validation style

```dart
import 'package:flutter/material.dart';
import 'package:flutter_vali/flutter_vali.dart';

class ExampleFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Form'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
              validator: context.validator
                .notEmpty()
                .minLength(3, errorMessage: 'Name must be at least 3 characters long')
                .maxLength(32)
                .build()
            ),
          ],
        ),
      ),
    );
  }
}
```

### Available Validation Rules

| Rule | Description |
|------|-------------|
| `notEmpty({String? errorMessage})` | Validates that the input is not empty. |
| `length({int length, String? errorMessage})` | Validates that the input length is exactly the specified value. |
| `minLength({int min, String? errorMessage})` | Validates that the input length is at least the given minimum. |
| `maxLength({int max, String? errorMessage})` | Validates that the input length is at most the given maximum. |
| `greaterThan({num value, String? errorMessage})` | Validates that the input is greater than the specified value. |
| `greaterThanOrEqual({num value, String? errorMessage})` | Validates that the input is greater than or equal to the specified value. |
| `lessThan({num value, String? errorMessage})` | Validates that the input is less than the specified value. |
| `lessThanOrEqual({num value, String? errorMessage})` | Validates that the input is less than or equal to the specified value. |
| `equalTo({dynamic value, String? errorMessage})` | Validates that the input is equal to the specified value. |
| `between({num min, num max, String? errorMessage})` | Validates that the input is between the two specified values (inclusive). |
| `contains({String substring, String? errorMessage})` | Validates that the input contains the specified substring. |
| `match({RegExp pattern, String? errorMessage})` | Validates that the input matches the given regular expression pattern. |
| `startsWith({String prefix, String? errorMessage})` | Validates that the input starts with the specified substring. |
| `endsWith({String suffix, String? errorMessage})` | Validates that the input ends with the specified substring. |
| `digitsOnly({String? errorMessage})` | Validates that the input consists of digits only. |
| `email({String? errorMessage})` | Validates that the input is a valid email address. |
| `phoneNumber({String? errorMessage})` | Validates that the input is a valid phone number. |
| `creditCard({String? errorMessage})` | Validates that the input is a valid credit card number. |
| `inList({List allowed, String? errorMessage})` | Validates that the input is included in the specified list. |
| `notInList({List disallowed, String? errorMessage})` | Validates that the input is not included in the specified list. |
| `date({String? errorMessage})` | Validates that the input is a valid date. |


### Custom Validation Rules

You can create custom validation rules by extending the `ValidatorRule` class.

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_vali/flutter_vali';

class CustomRule extends ValidatorRule {
  const CustomRule({super.errorMessage});

  @override
  String? isValid(BuildContext context, String? value) {
    // Custom validation logic
    return value == 'custom'
        ? null
        : errorMessage ??
            defaultMessage[Localizations.localeOf(context).languageCode] ??
            defaultMessage['en'];
  }

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Invalid custom value',
  };
}

extension CustomExtensions on Validator {
  Validator custom({String? errorMessage}) {
    addRule(CustomRule(errorMessage: errorMessage));
    return this;
  }
}
```

### Supported Localization Languages

Flutter Vali supports localization for default error messages in the following languages:

- English (en)
- Arabic (ar)
- Central Kurdish Sorani (ckb)
- Afrikaans (af)
- Albanian (sq)
- Belarusian (be)
- Bulgarian (bg)
- Catalan (ca)
- Chinese Simplified (zh)
- Chinese Traditional (zh_Hant)
- Croatian (hr)
- Czech (cs)
- Danish (da)
- Dutch (nl)
- British English (en_GB)
- Estonian (et)
- Finnish (fi)
- French (fr)
- German (de)
- Greek (el)
- Hindi (hi)
- Hungarian (hu)
- Icelandic (is)
- Indonesian (id)
- Italian (it)
- Japanese (ja)
- Korean (ko)
- Latvian (lv)
- Lithuanian (lt)
- Macedonian (mk)
- Malay (ms)
- Norwegian (no)
- Polish (pl)
- Brazilian Portuguese (pt_BR)
- Portuguese (pt)
- Romanian (ro)
- Russian (ru)
- Serbian (sr)
- Slovak (sk)
- Slovenian (sl)
- Spanish (es)
- Swedish (sv)
- Thai (th)
- Turkish (tr)
- Ukrainian (uk)
- Vietnamese (vi)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

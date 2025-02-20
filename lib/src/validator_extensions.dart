import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// Extension on [BuildContext] to provide validation utilities.
extension ValidatorExtensions on BuildContext {
  /// Returns a [Validator] instance associated with the current [BuildContext].
  Validator get validator => Validator(this);

  /// Builds a validation function that applies a list of [ValidatorRule]s.
  ///
  /// Takes a list of [rules] and returns a function that validates a [String?] input.
  /// The returned function will return an error message if any rule is violated,
  /// or `null` if all rules pass.
  String? Function(String?) validators(List<ValidatorRule> rules) {
    var validator = Validator(this);
    for (var rule in rules) {
      validator.addRule(rule);
    }
    return validator.build();
  }
}

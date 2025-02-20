import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator_rule.dart';

/// A class that validates input based on a set of rules.
class Validator {
  /// The build context in which the validation is performed.
  final BuildContext context;

  /// The list of validation rules.
  final List<ValidatorRule> _rules = [];

  /// Creates a new Validator with the given [context].
  Validator(this.context);

  /// Adds a validation rule to the validator.
  ///
  /// Returns the current instance of [Validator] to allow for method chaining.
  Validator addRule(ValidatorRule rule) {
    _rules.add(rule);
    return this;
  }

  /// Builds the validation function.
  ///
  /// Returns a function that takes a [String?] value and returns a [String?]
  /// error message if the value is invalid, or `null` if the value is valid.
  String? Function(String?) build() {
    return (value) {
      for (var rule in _rules) {
        final result = rule.isValid(context, value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}

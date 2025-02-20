import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator_rule.dart';

class Validator {
  final BuildContext context;
  final List<ValidatorRule> _rules = [];
  Validator(this.context);

  Validator addRule(ValidatorRule rule) {
    _rules.add(rule);
    return this;
  }

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

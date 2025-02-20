import 'package:flutter/widgets.dart';
import 'package:flutter_vali/src/validator.dart';
import 'package:flutter_vali/src/validator_rule.dart';

extension ValidatorExtensions on BuildContext {
  Validator get validator => Validator(this);
  String? Function(String?) validators(List<ValidatorRule> rules) {
    var validator = Validator(this);
    for (var rule in rules) {
      validator.addRule(rule);
    }
    return validator.build();
  }
}

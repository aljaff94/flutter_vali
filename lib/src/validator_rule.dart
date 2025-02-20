import 'package:flutter/widgets.dart';

abstract class ValidatorRule {
  final String? errorMessage;
  const ValidatorRule({this.errorMessage});
  String? isValid(BuildContext context, String? value);
  abstract final Map<String, String> defaultMessage;
}

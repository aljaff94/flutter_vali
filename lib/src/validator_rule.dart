import 'package:flutter/widgets.dart';

/// An abstract class representing a validation rule.
abstract class ValidatorRule {
  /// The error message to be displayed if validation fails.
  final String? errorMessage;

  /// Constructs a [ValidatorRule] with an optional error message.
  const ValidatorRule({this.errorMessage});

  /// Validates the given [value] in the provided [context].
  ///
  /// Returns an error message if validation fails, otherwise returns null.
  String? isValid(BuildContext context, String? value);

  /// A map of default error messages for the validation rule.
  abstract final Map<String, String> defaultMessage;
}

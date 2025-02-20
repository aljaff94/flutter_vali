import 'package:flutter/material.dart';
import 'package:flutter_vali/flutter_vali.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const ExamplePage());
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter your username'),
                validator: context.validators([
                  NotEmptyRule(),
                  MinLengthRule(
                    3,
                    errorMessage:
                        'Username must be at least 3 characters long.',
                  ),
                  MaxLengthRule(10),
                ]),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter your password'),
                validator:
                    context.validator
                        .notEmpty()
                        .minLength(
                          6,
                          errorMessage:
                              'Password must be at least 6 characters long.',
                        )
                        .maxLength(20)
                        .build(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

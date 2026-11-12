import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppError(
        button: AppButton(
          title: Text(t.action.go_home),
          onPressed: () => context.go('/home'),
          buttonColor: ButtonColor.inv,
          fullWidth: false,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:picby/LoginForm.dart';
import 'package:picby/utils/routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginForm(
      topText: 'Nie masz jeszcze konta? ',
      inkWellText: 'Zarejestruj się',
      onPressed: () {
        Navigator.pushNamed(context, registerRoute);
      },
    );
  }
}

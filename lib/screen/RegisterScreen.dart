import 'package:flutter/material.dart';
import 'package:picby/LoginForm.dart';
import 'package:picby/utils/routes.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginForm(
      topText: 'Masz już konto? Doskonale!',
      inkWellText: 'Zaloguj się',
      onPressed: () {
        Navigator.pushNamed(context, loginRoute);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:picby/Button.dart';
import 'package:picby/utils/assets.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFBB114),
      body: SingleChildScrollView(
        child: Container(
          height: size.longestSide,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Spacer(flex: 3),
              Assets.logo,
              Spacer(),
              Text(
                'ZAPOMNIAŁEŚ HASŁO?',
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Container(
                width: size.shortestSide * 0.75,
                height: size.longestSide * 0.15,
                child: Text(
                  'Wprowadź swój adres e-mail żeby zresetować hasło.',
                  style: Theme.of(context).textTheme.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: size.width * 0.75,
                height: size.shortestSide * 0.15,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    validator: (value) => value.isEmpty
                        ? 'To pole jest wymagane'
                        : !value.contains('@')
                            ? 'Podany adres e-mail nie istnieje w bazie.'
                            : null,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 10, height: 0.3),
                      hintText: 'Wpisz swój e-mail',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(7, 71, 130, 0.68),
                          height: 2.0),
                      prefixIcon: Padding(
                          padding:
                              EdgeInsets.only(top: 16, right: 16, bottom: 16),
                          child: Assets.emailIcon),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(242, 143, 174, 0.68),
                              style: BorderStyle.solid,
                              width: 2)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(242, 143, 174, 0.68),
                              style: BorderStyle.solid,
                              width: 2)),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Button(
                  id: 0,
                  title: 'WYŚLIJ',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                            'Przypomnienie zostało wysłane. Sprawdź swoją skrzynkę odbiorczą.', textAlign: TextAlign.center),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 3),
                        backgroundColor: Color(0xFF074782),
                      ));
                    }
                  },
                ),
                Button(
                    id: 2,
                    title: 'WRÓĆ',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

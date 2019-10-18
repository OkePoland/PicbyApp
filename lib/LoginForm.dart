import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:picby/Button.dart';
import 'package:picby/utils/assets.dart';
import 'package:picby/utils/routes.dart';

class LoginForm extends StatefulWidget {
  final String topText;
  final String inkWellText;
  final onPressed;

  const LoginForm({Key key, this.topText, this.inkWellText, this.onPressed})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool get isVisible => widget.inkWellText == 'Zaloguj się';

  Widget form(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        width: size.width * 0.75,
        height: size.longestSide * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFormField(
              key: Key('emailField'),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              validator: (value) => value.isEmpty
                  ? 'To pole jest wymagane'
                  : !value.contains('@')
                      ? 'Wprowadź poprawny adres e-mail'
                      : null,
              decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 10, height: 0.3),
                hintText: 'Wpisz swój e-mail',
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(7, 71, 130, 0.68),
                    height: 2.0),
                prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
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
            TextFormField(
              key: Key('passwordField'),
              controller: _password,
              validator: (value) => value.isEmpty
                  ? 'To pole jest wymagane'
                  : value.length < 6
                      ? 'Hasło musi zawierać przynajmniej 6 znaków'
                      : null,
              obscureText: true,
              decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 10, height: 0.3),
                  hintText: 'Hasło',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(7, 71, 130, 0.68),
                      height: 2.0),
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
                      child: Assets.passwordIcon),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(242, 143, 174, 0.68),
                          style: BorderStyle.solid,
                          width: 2)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(242, 143, 174, 0.68),
                          style: BorderStyle.solid,
                          width: 2))),
            ),
            isVisible
                ? TextFormField(
                    key: Key('repeatPasswordField'),
                    validator: (value) => value.isEmpty
                        ? 'To pole jest wymagane'
                        : value != _password.text
                            ? 'Wprowadzone hasła nie są identyczne.'
                            : null,
                    obscureText: true,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 10, height: 0.3),
                        hintText: 'Powtórz hasło',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(7, 71, 130, 0.68),
                            height: 2.0),
                        prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(top: 16, right: 16, bottom: 16),
                            child: Assets.passwordIcon),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(242, 143, 174, 0.68),
                                style: BorderStyle.solid,
                                width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(242, 143, 174, 0.68),
                                style: BorderStyle.solid,
                                width: 2))),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
          child: Container(
        height: size.longestSide,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: orientation == Orientation.landscape ? 32 : 16),
                  ),
                  Text(widget.topText,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.left),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                  ),
                  InkWell(
                    onTap: widget.onPressed,
                    child: Text(
                      widget.inkWellText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(7, 71, 130, 0.9),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  height: size.longestSide * 0.32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Assets.picby,
                      Visibility(
                          visible: !isVisible,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Assets.logo,
                          )),
                    ],
                  )),
              form(context),
              isVisible
                  ? Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Button(
                        id: 1,
                        title: 'ZAREJESTRUJ SIĘ Z GOOGLE',
                        onPressed: () {
                          Navigator.pushNamed(context, googleRoute);
                        },
                      ),
                      Button(
                          id: 0,
                          title: 'ZAREJESTRUJ SIĘ',
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pushNamed(context, homeRoute);
                            }
                          }),
                    ])
                  : Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Button(
                        id: 1,
                        title: 'ZALOGUJ SIĘ Z GOOGLE',
                        onPressed: () {
                          Navigator.pushNamed(context, googleRoute);
                        },
                      ),
                      Button(
                        id: 0,
                        title: 'ZALOGUJ SIĘ',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, homeRoute);
                          }
                        },
                      ),
                    ]),
              Visibility(
                visible: !isVisible,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, resetPasswordRoute);
                  },
                  child: Text(
                    'Zapomniałeś hasło?',
                    style: TextStyle(
                        fontSize: 12, decoration: TextDecoration.underline),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ]),
      ));
    }));
  }
}

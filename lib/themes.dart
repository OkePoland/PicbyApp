import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;

    notifyListeners();
  }

  ThemeData buildLightTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
          color: Color(0xFF3180AE),
          iconTheme: IconThemeData(color: Color(0xFFEEEEEE)),
          elevation: 10.0,
          textTheme: TextTheme(
              title: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal))),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFE5E5E5),
      bottomAppBarColor: Color(0xFFE5E5E5),
      primaryColor: Colors.lightBlue,
      accentColor: Color(0xFFEB5F34),
      fontFamily: 'Open Sans',
      textTheme: TextTheme(
          title: TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Color(0xFF074782)),
          body1: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: Color(0xFF000000)),
          body2: TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: Color(0xFF074782)),
          display1: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: Color(0xFF074782)),
          button: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
          subhead: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(7, 71, 130, 0.9))),
    );
  }

  ThemeData buildDarkTheme() {
    return ThemeData();
  }
}

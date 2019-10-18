import 'package:flutter/material.dart';
import 'package:picby/Button.dart';
import 'package:picby/screen/RegisterScreen.dart';
import 'package:picby/utils/assets.dart';
import 'package:picby/utils/routes.dart';

class WelcomeScreen extends StatelessWidget {
  final String title;
  final String body;

  const WelcomeScreen({Key key, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Spacer(),
              body.length == 0
                  ? Container(
                      height: size.longestSide * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Spacer(),
                          Assets.picby,
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Spacer(),
                          Container(
                              child: body.length == 0
                                  ? Assets.logo
                                  : Text(
                                      body,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.body1,
                                    )),
                        ],
                      ),
                    )
                  : Container(
                      height: size.longestSide * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Spacer(),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Spacer(),
                          Assets.picby,
                          Spacer(),
                          Container(
                              width: size.shortestSide * 0.75,
                              height: size.longestSide * 0.18,
                              child: body.length == 0
                                  ? Assets.logo
                                  : Text(
                                      body,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.body1,
                                    )),
                        ],
                      ),
                    ),
              Spacer(),
              Column(
                 mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Button(title: 'ZAREJESTRUJ SIĘ', onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RegisterScreen()));
                    },),
                   Button(title: 'ZALOGUJ SIĘ', onPressed: () {
                      Navigator.pushNamed(context, loginRoute);
                    },),
                ],
              ),
              Spacer(),
            ]),
      ),
    );
  }
}

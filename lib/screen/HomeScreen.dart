import 'package:flutter/material.dart';
import 'package:picby/Button.dart';
import 'package:picby/HomeDrawer.dart';
import 'package:picby/utils/assets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("PICBY"),
        ),
        drawer: SizedBox(width: size.width, child: HomeDrawer()),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              height: size.longestSide * 0.85,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'WITAJ W APLIKACJI',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Assets.picby,
                    Container(
                        width: size.shortestSide * 0.8,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: Theme.of(context).textTheme.body1,
                                children: [
                                  TextSpan(text: 'Znajdujesz się w '),
                                  TextSpan(
                                      text: 'TRYBIE RODZICA. ',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          'Aby rozpocząć korzystanie z aplikacji, przejdź do ustawień konta.'),
                                  WidgetSpan(
                                    child: Container(
                                        padding: EdgeInsets.only(top: 32),
                                        child: Text(
                                            'Wszystkie zmiany możesz edytować w dowolnym momencie. Ustawienia zawsze znajdziesz w menu głównym.',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .display1)),
                                  ),
                                ]))),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Button(
                          id: 0,
                          title: 'USTAWIENIA KONTA',
                          onPressed: () {
                            print('ustawienia konta');
                          },
                        ),
                      ],
                    ),
                  ])),
        ));
  }
}

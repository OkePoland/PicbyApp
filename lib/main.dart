import 'package:flutter/material.dart';
import 'package:picby/BottomNavigationBarProvider.dart';
import 'package:picby/IconsIndicator.dart';
import 'package:picby/screen/WelcomeScreen.dart';
import 'package:picby/themes.dart';
import 'package:picby/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() => runApp(Picby());

class Picby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFFEB5F34),
        statusBarIconBrightness: Brightness.dark));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          builder: (BuildContext context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          builder: (BuildContext context) => ThemeChanger(ThemeData.dark()),
        )
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: initialRoute,
      theme: theme.buildLightTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class App extends StatelessWidget {
  final _controller = PageController();

  final List<Widget> _pages = [
    WelcomeScreen(
      title: 'WITAJ W',
      body:
          'aplikacji budującej język w umyśle dziecka, a także uczącącej komunikacji.',
    ),
    WelcomeScreen(
      title: 'POZNAJ',
      body:
          'Dodawaj zdjęcia i nagrania głosowe, twórz opisy, przesyłaj pliki, komponuj albumy pełne wyjątkowych wspomnień!',
    ),
    WelcomeScreen(
      title: 'ŚWIAT OCZAMI DZIECKA',
      body: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.longestSide,
        child: Stack(children: <Widget>[
          PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
            onPageChanged: (int p) {
                provider.currentIndex = p;
            },
          ),
          Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        provider.currentIndex = page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}

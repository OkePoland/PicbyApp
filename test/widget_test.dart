import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:picby/BottomNavigationBarProvider.dart';
import 'package:picby/Button.dart';
import 'package:picby/LoginForm.dart';
import 'package:picby/screen/LoginScreen.dart';
import 'package:picby/screen/RegisterScreen.dart';
import 'package:picby/screen/WelcomeScreen.dart';
import 'package:picby/utils/assets.dart';
import 'package:picby/main.dart';
import 'package:provider/provider.dart';

NavigatorObserver mockObserver;

void main() {
  group('Welcome Screen', () {
    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('has a title, body and picby icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(WelcomeScreenWrapper());

      final titleFinder = find.text('T');
      final bodyFinder = find.text('B');
      final picbyFinder = find.byWidget(Assets.picby);

      expect(titleFinder, findsOneWidget);
      expect(bodyFinder, findsOneWidget);
      expect(picbyFinder, findsOneWidget);
    });

    testWidgets('has a logo instead of a body', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: WelcomeScreen(
          title: 'T',
          body: '',
        ),
      ));

      final titleFinder = find.text('T');
      final bodyFinder = find.text('B');
      final logoFinder = find.byWidget(Assets.logo);

      expect(titleFinder, findsOneWidget);
      expect(bodyFinder, findsNothing);
      expect(logoFinder, findsOneWidget);
    });

    testWidgets(
        'should navigate to LoginScreen after click "ZALOGUJ SIĘ" button',
        (WidgetTester tester) async {
      await tester.pumpWidget(WelcomeScreenWrapper());

      final loginButtonFinder = find.widgetWithText(Button, 'ZALOGUJ SIĘ');
      expect(loginButtonFinder, findsOneWidget);
      // await tester.tap(loginButtonFinder);
      // await tester.pumpAndSettle();

      // verify(mockObserver.didPush(any, any));
      // expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets(
        'should navigate to RegisterScreen after click "ZAREJESTRUJ SIĘ" button',
        (WidgetTester tester) async {
      await tester.pumpWidget(WelcomeScreenWrapper());

      final registerButtonFinder =
          find.widgetWithText(Button, 'ZAREJESTRUJ SIĘ');
      expect(registerButtonFinder, findsOneWidget);
      await tester.tap(registerButtonFinder);
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(RegisterScreen), findsOneWidget);
    });
  });

  group('App', () {
    ChangeNotifierProvider app =
        new ChangeNotifierProvider<BottomNavigationBarProvider>.value(
            value: MockBottomNavigationBarProvider(),
            child: MaterialApp(
              home: App(),
            ));

    testWidgets('', (WidgetTester tester) async {
      await tester.pumpWidget(app);
    });
  });

  group('LoginForm', () {
    final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      '/register': (BuildContext context) => RegisterScreen(),
    };

    MaterialApp registerForm = new MaterialApp(
      routes: routes,
      home: LoginForm(
        topText: 'T',
        onPressed: () {},
        inkWellText: 'I',
      ),
    );

    MaterialApp loginForm = new MaterialApp(
      routes: routes,
      home: LoginForm(
        topText: 'T',
        onPressed: () {},
        inkWellText: 'Zaloguj się',
      ),
    );

    testWidgets('has a topText with InkWell widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(registerForm);

      final topTextFinder = find.text('T');
      final inkWellTextFinder = find.text('I');

      expect(topTextFinder, findsOneWidget);
      expect(inkWellTextFinder, findsOneWidget);
    });

    testWidgets('has a bottomText and logo widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(registerForm);

      final bottomTextFinder = find.text('Zapomniałeś hasło?');
      final logoFinder = find.byWidget(Assets.logo);

      expect(bottomTextFinder, findsOneWidget);
      expect(logoFinder, findsOneWidget);
    });

    testWidgets('should hide a bottomText and logo widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(loginForm);

      final bottomTextFinder = find.text('Zapomniałeś hasło?');
      final logoFinder = find.byWidget(Assets.logo);

      expect(bottomTextFinder, findsNothing);
      expect(logoFinder, findsNothing);
    });

    testWidgets('has a form widget', (WidgetTester tester) async {
      await tester.pumpWidget(loginForm);
      final formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget);

      final emailField = find.byKey(Key('emailField'));
      final passwordField = find.byKey(Key('passwordField'));
      final repeatPasswordField = find.byKey(Key('repeatPasswordField'));

      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(repeatPasswordField, findsOneWidget);
    });

    testWidgets('should hide repeatPasswordField', (WidgetTester tester) async {
      await tester.pumpWidget(registerForm);

      final repeatPasswordField = find.byKey(Key('repeatPasswordField'));
      expect(repeatPasswordField, findsNothing);
    });
  });

}

class WelcomeScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(
        title: 'T',
        body: 'B',
      ),
      navigatorObservers: [mockObserver],
    );
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBottomNavigationBarProvider extends Mock
    implements BottomNavigationBarProvider {}

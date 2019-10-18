import 'package:flutter/material.dart';
import 'package:picby/utils/assets.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.body1;
    return Drawer(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text('MENU'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFFFFFFFF),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ListTile(
                  title: Text(
                    'TRYB DZIECKA',
                    style: style,
                  ),
                  leading: Assets.childPanelIcon,
                ),
                ListTile(
                  title: Text(
                    'KATALOGI',
                    style: style,
                  ),
                  leading: Assets.catalogsIcon,
                ),
                ListTile(
                  title: Text(
                    'NAGRANIA GŁOSOWE',
                    style: style,
                  ),
                  leading: Assets.recordIcon,
                ),
                ListTile(
                  title: Text(
                    'USTAWIENIA',
                    style: style,
                  ),
                  leading: Assets.settingsIcon,
                ),
                ListTile(
                  title: Text(
                    'O APLIKACJI',
                    style: style,
                  ),
                  leading: Assets.aboutIcon,
                ),
                ListTile(
                  title: Text(
                    'POLITYKA PRYWATNOŚCI',
                    style: style,
                  ),
                  leading: Assets.privacyPolicyIcon,
                ),
                ListTile(
                  title: Text(
                    'WYLOGUJ SIĘ',
                    style: style,
                  ),
                  leading: Assets.logOutIcon,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import '../widgets/appbar_radioapp.dart';
import '../widgets/custom_search_bar.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: RadioDrawer(),
      appBar:
          AppBarRadioApp(searchBarWidget: Text('Setari'), isSearchBar: true),
      body: Center(child: Text('setari')),
    );
  }
}

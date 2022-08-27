import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/providers/radio_stations_data.dart';
import './screens/radio_stations_screen.dart';
import './providers/radio_player.dart';
import './screens/radio_stations_favorites_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => RStations()),
      ChangeNotifierProvider(
        create: (ctx) => RPlayer(),
      ),
    ],
    child: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
        title: 'Radio App',
        home: RadioStationsScreen(),
        routes: {
          RadioStationsScreen.routeName: (ctx) => RadioStationsScreen(),
          RadioStationsFavoritesScreen.routeName: (ctx) =>
              RadioStationsFavoritesScreen()
        },
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Color.fromRGBO(118, 137, 222, 1),
            secondary: Color.fromRGBO(169, 220, 227, 1),
          ),
          //textTheme: theme.textTheme.copyWith(
          //    titleMedium: theme.textTheme.titleMedium
          //        .copyWith(fontWeight: FontWeight.bold)),
        ));
  }
}

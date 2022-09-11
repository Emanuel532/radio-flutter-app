import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/providers/radio_stations_data.dart';
import './screens/radio_stations_screen.dart';
import './providers/radio_player.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import './screens/radio_stations_favorites_screen.dart';
import './providers/ui_data.dart';
import './screens/search_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => RStations()),
      ChangeNotifierProvider(
        create: (ctx) => UIData(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => RPlayer(),
      ),
    ],
    child: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      // ce facem cand n avem net;
      //print(' nu i net');

      Provider.of<RPlayer>(context, listen: false).schimbariNet(false);
    } else {
      Provider.of<RPlayer>(context, listen: false).schimbariNet(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
        title: 'Radio App',
        home: RadioStationsScreen(),
        routes: {
          RadioStationsScreen.routeName: (ctx) => RadioStationsScreen(),
          RadioStationsFavoritesScreen.routeName: (ctx) =>
              RadioStationsFavoritesScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
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

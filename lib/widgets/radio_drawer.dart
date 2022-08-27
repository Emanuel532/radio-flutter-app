import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/providers/radio_stations_data.dart';
import '../screens/radio_stations_favorites_screen.dart';
import '../screens/radio_stations_screen.dart';

class RadioDrawer extends StatelessWidget {
  const RadioDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool statusFavorit = Provider.of<RStations>(context).favorit;
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            AppBar(
              title: Text('Radio Romania'),
              automaticallyImplyLeading: false,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(RadioStationsScreen.routeName);
              },
              child: ListTile(
                leading: const Icon(Icons.radio),
                title: Text(
                  'Posturi',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                // Provider.of<RStations>(context, listen: false)
                //     .toggleFavorites();
                Navigator.of(context).pushReplacementNamed(
                    RadioStationsFavoritesScreen.routeName);
              },
              child: ListTile(
                leading: const Icon(Icons.favorite_border),
                title: Text(
                  'Favorite',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Prieteni',
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
            Divider(
              thickness: 2,
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                    leading: Icon(Icons.timer),
                    title: Text(
                      'Temporizator',
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
            Divider(
              thickness: 2,
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Setari',
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/settings_screen.dart';
import '../widgets/timer_dialog_menu.dart';
import 'package:radio_app/providers/radio_player.dart';
import 'package:radio_app/providers/radio_stations_data.dart';
import '../screens/radio_stations_favorites_screen.dart';
import '../screens/radio_stations_screen.dart';

class RadioDrawer extends StatelessWidget {
  const RadioDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int ecranActiv = Provider.of<RStations>(context).ecranDeschis;
    bool statusFavorit = Provider.of<RStations>(context).favorit;
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            AppBar(
              title: Text('Radio Romania'),
              automaticallyImplyLeading: false,
            ),
            Ink(
              color: ecranActiv == 0
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RadioStationsScreen.routeName);
                  Provider.of<RStations>(context, listen: false)
                      .changeEcranDeschis(0);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.radio,
                    color: (ecranActiv == 0) ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Posturi',
                    style: (ecranActiv == 0)
                        ? TextStyle(color: Colors.white)
                        : Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            Ink(
              color: ecranActiv == 1
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      RadioStationsFavoritesScreen.routeName);
                  Provider.of<RStations>(context, listen: false)
                      .changeEcranDeschis(1);
                },
                child: ListTile(
                  leading: Icon(
                    (ecranActiv == 1) ? Icons.favorite : Icons.favorite_border,
                    color: (ecranActiv == 1) ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Favorite',
                    style: (ecranActiv == 1)
                        ? TextStyle(color: Colors.white)
                        : Theme.of(context).textTheme.titleMedium,
                  ),
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => TimerDialogMenu(context),
                  );
                },
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
                onTap: () {
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                },
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

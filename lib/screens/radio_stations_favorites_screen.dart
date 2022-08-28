import 'package:flutter/material.dart';
import '../widgets/radio_drawer.dart';
import 'package:provider/provider.dart';
import '../models/radio_station.dart';
import '../providers/radio_player.dart';
import '../providers/radio_stations_data.dart';
import '../widgets/radio_station_box.dart';
import '../widgets/info_bar.dart';
import '../widgets/no_network_conection_widget.dart';

class RadioStationsFavoritesScreen extends StatelessWidget {
  static const String routeName = '/radiostationsfavoritescreen';
  @override
  Widget build(BuildContext context) {
    var radioPlayer = Provider.of<RPlayer>(context);
    List<RadioStation> listaRadio =
        Provider.of<RStations>(context).getFavoriteList;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: RadioDrawer(),
      appBar: AppBar(title: Text('Favorite')),
      body: Provider.of<RPlayer>(context).avemNet
          ? Column(
              children: [
                Container(
                  height: (screenSize.height -
                          AppBar().preferredSize.height -
                          MediaQuery.of(context).viewPadding.top) *
                      0.87,
                  child: ListView.builder(
                      itemCount: listaRadio.length,
                      itemBuilder: ((context, index) {
                        return RadioStationBox(
                          title: listaRadio[index].title,
                          imageUrl: listaRadio[index].imageUrl,
                          url: listaRadio[index].url,
                          id: index,
                          isPlaying: (listaRadio[index].title ==
                              radioPlayer.nowPlayingRadioTitle),
                          isFavorite: listaRadio[index].isFavorite,
                        );
                      })),
                ),
                InfoBar((screenSize.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).viewPadding.top) *
                    0.13),
              ],
            )
          : NoNetworkConnectionWidget(),
    );
  }
}

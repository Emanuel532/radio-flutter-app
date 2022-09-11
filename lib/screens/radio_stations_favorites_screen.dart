import 'package:flutter/material.dart';
import '../widgets/radio_drawer.dart';
import 'package:provider/provider.dart';
import '../models/radio_station.dart';
import '../providers/radio_player.dart';
import '../providers/ui_data.dart';
import '../widgets/appbar_radioapp.dart';
import '../providers/radio_stations_data.dart';
import '../widgets/radio_station_box.dart';
import '../widgets/info_bar.dart';
import '../widgets/no_network_conection_widget.dart';

class RadioStationsFavoritesScreen extends StatelessWidget {
  static const String routeName = '/radiostationsfavoritescreen';
  @override
  Widget build(BuildContext context) {
    Provider.of<UIData>(context, listen: false)
        .setKeyboardHeight(MediaQuery.of(context).viewInsets.bottom);
    var radioPlayer = Provider.of<RPlayer>(context);
    List<RadioStation> listaRadio =
        Provider.of<RStations>(context).getFavoriteList;
    Size screenSize = MediaQuery.of(context).size;
    double keyboardheight = Provider.of<UIData>(context).getKeyboardHeight;
    return Scaffold(
      drawer: RadioDrawer(),
      appBar: AppBarRadioApp(searchBarWidget: Text('Favorite')),
      body: Provider.of<RPlayer>(context).avemNet
          ? Column(
              children: [
                Container(
                  height: (screenSize.height -
                          keyboardheight -
                          AppBar().preferredSize.height -
                          MediaQuery.of(context).viewPadding.top) *
                      0.87,
                  child: (listaRadio.length != 0)
                      ? ListView.builder(
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
                          }))
                      : Center(
                          child: Text(
                              'Adaugati posturi radio la favorite pentru a le afisa aici!.'),
                        ),
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

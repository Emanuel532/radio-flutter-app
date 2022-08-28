import 'package:flutter/material.dart';
import 'package:radio_app/models/radio_station.dart';
import 'package:radio_app/widgets/no_network_conection_widget.dart';
import '../providers/radio_player.dart';
import '../widgets/radio_station_box.dart';
import '../widgets/radio_drawer.dart';
import 'package:radio_player/radio_player.dart';
import 'package:provider/provider.dart';
import '../providers/radio_stations_data.dart';
import '../widgets/info_bar.dart';

class RadioStationsScreen extends StatefulWidget {
  RadioStationsScreen();
//s
  static const routeName = '/radioStationsScreen';

  @override
  State<RadioStationsScreen> createState() => _RadioStationsScreenState();
}

class _RadioStationsScreenState extends State<RadioStationsScreen> {
  // RadioPlayer radioPlayer = RadioPlayer()
  @override
  void initState() {
    Provider.of<RStations>(context, listen: false).readUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var radioPlayer = Provider.of<RPlayer>(context);
    List<RadioStation> listaRadio = Provider.of<RStations>(context).getList;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: RadioDrawer(),
      appBar: AppBar(title: Text('Posturi')),
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

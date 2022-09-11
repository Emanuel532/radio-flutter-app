import 'package:flutter/material.dart';
import 'package:radio_app/screens/radio_stations_favorites_screen.dart';
import '../widgets/radio_drawer.dart';
import '../widgets/appbar_radioapp.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/radio_station_box.dart';
import '../providers/radio_stations_data.dart';
import 'package:provider/provider.dart';
import '../providers/radio_player.dart';
import '../models/radio_station.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/searchscreen';

  late BuildContext ctx;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.ctx = context;
    List<RadioStation> listaRadio = Provider.of<RStations>(context).getList;
    String valoareCautata = Provider.of<RStations>(context).valoareCautare;
    List<RadioStation> listaRadioFiltrata = [
      ...listaRadio.where((element) => element.title
          .toString()
          .toUpperCase()
          .contains(valoareCautata.toUpperCase()))
    ];
    var radioPlayer = Provider.of<RPlayer>(context);
    return WillPopScope(
      onWillPop: () async {
        var obiectDateRadio = Provider.of<RStations>(context, listen: false);
        obiectDateRadio.setareValoareCautare('');
        return true;
      },
      child: Scaffold(
        //drawer: RadioDrawer(),
        appBar: AppBarRadioApp(
            searchBarWidget: CustomSearchBar(), isSearchBar: true),
        body: ListView.builder(
            itemCount: listaRadioFiltrata.length,
            itemBuilder: ((context, index) {
              return RadioStationBox(
                isSearchScreen: true,
                title: listaRadioFiltrata[index].title,
                imageUrl: listaRadioFiltrata[index].imageUrl,
                url: listaRadioFiltrata[index].url,
                id: index,
                isPlaying: (listaRadioFiltrata[index].title ==
                    radioPlayer.nowPlayingRadioTitle),
                isFavorite: listaRadioFiltrata[index].isFavorite,
              );
            })),
      ),
    );
  }
}

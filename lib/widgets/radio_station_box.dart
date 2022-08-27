import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/providers/radio_stations_data.dart';
import '../providers/radio_player.dart';
import 'package:radio_player/radio_player.dart';
import '../models/radio_station.dart';

class RadioStationBox extends StatelessWidget {
  final String title;
  final String url;
  final String imageUrl;
  final bool isFavorite;
  final bool isPlaying;
  final int id;

  RadioStationBox({
    required this.title,
    required this.url,
    required this.isPlaying,
    required this.isFavorite,
    required this.imageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    RStations radioStationsDataList = Provider.of<RStations>(context);

    List<RadioStation> lista = radioStationsDataList.getList;
    RPlayer rplayer = Provider.of<RPlayer>(context);
    return Ink(
      color: isPlaying ? Theme.of(context).primaryColor : Colors.white,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onDoubleTap: () {
          // const snackBar = SnackBar(
          //     content: Text(
          //   '...',
          //   textAlign: TextAlign.center,
          // ));
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        onTap: (() {
          HapticFeedback.vibrate();

          //radioStationsDataList.writeCounter(51);
          //radioStationsDataList.readCounter().then((value) => print(value));
          rplayer.changeStation(
              title: title, url: url, imageUrl: imageUrl, stationId: id);
        }),
        child: Card(
          elevation: 6,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
              ),
            ]),
            IconButton(
                onPressed: () {
                  radioStationsDataList.changeFavoriteStatus(title);
                  radioStationsDataList.savesDataLocally();
                },
                icon: isFavorite
                    ? Icon(Icons.favorite,
                        color: Theme.of(context).colorScheme.error)
                    : Icon(
                        Icons.favorite_border,
                      )),
          ]),
        ),
      ),
    );
  }
}

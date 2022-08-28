import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/models/radio_station.dart';
import 'package:radio_app/providers/radio_player.dart';
import 'package:radio_app/providers/radio_stations_data.dart';
import 'package:radio_player/radio_player.dart';

class InfoBar extends StatelessWidget {
  final double calculatedHeight;

  InfoBar(this.calculatedHeight);

  @override
  Widget build(BuildContext context) {
    //List<RadioStation> listaRadio = Provider.of<RStations>(context).getList;
    RPlayer radioPlayer = Provider.of<RPlayer>(context);
    return Container(
      width: 1 / 0,
      color: Theme.of(context).colorScheme.primary,
      height: calculatedHeight,
      child: radioPlayer.nowPlayingRadioImage != ''
          ? radioPlayer.isNewStationLoading
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 45,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.white,
                    ),
                  ),
                ])
              : Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      radioPlayer.nowPlayingRadioImage,
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    radioPlayer.nowPlayingRadioTitle,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
                  radioPlayer.isRadioPlaying
                      ? IconButton(
                          onPressed: () {
                            radioPlayer.stopRadio();
                          },
                          icon: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                          iconSize: 60,
                        )
                      : IconButton(
                          onPressed: () {
                            radioPlayer.startRadio();
                          },
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          iconSize: 60,
                        )
                ])
          : Container(
              width: 1 / 0,
              child: Center(
                  child: Text(
                'Selectati un post radio!',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
            ),
    );
  }
}

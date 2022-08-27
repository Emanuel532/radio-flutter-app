import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';
import '../providers/radio_stations_data.dart';

class RPlayer with ChangeNotifier {
  RadioPlayer _radioPlayer = RadioPlayer();
  String nowPlayingRadioTitle = '';
  String nowPlayingRadioImage = '';

  get nowPlayingTitle {
    return nowPlayingRadioTitle;
  }

  get getRadioPlayer {
    return _radioPlayer;
  }

  void startRadio() {
    _radioPlayer.stop();
    _radioPlayer.play();
  }

  void stopRadio() {
    _radioPlayer.stop();
  }

  void changeStation(
      {required String title,
      required String url,
      required String imageUrl,
      required int stationId}) {
    _radioPlayer.setChannel(title: title, imagePath: imageUrl, url: url).then(
        (value) => _radioPlayer.stop().then((value) => _radioPlayer.play()));
    nowPlayingRadioImage = imageUrl;
    nowPlayingRadioTitle = title;
    notifyListeners();
  }
}

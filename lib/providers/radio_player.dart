import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';
import '../providers/radio_stations_data.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class RPlayer with ChangeNotifier {
  RadioPlayer _radioPlayer = RadioPlayer();
  String nowPlayingRadioTitle = '';
  String nowPlayingRadioImage = '';
  bool avemNet = true;

  void schimbariNet(bool val) {
    avemNet = val;
    if (avemNet == false) _radioPlayer.stop();
    notifyListeners();
  }

  get nowPlayingTitle {
    return nowPlayingRadioTitle;
  }

  get getRadioPlayer {
    return _radioPlayer;
  }

  Future<bool> amIConnected() async {
    final Connectivity _connectivity = Connectivity();
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile) {
      schimbariNet(true);
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      schimbariNet(true);
      return true;
    } else {
      schimbariNet(false);
      return false;
    }
  }

  void startRadio() {
    _radioPlayer.stop();
    amIConnected().then((value) {
      if (value) {
        _radioPlayer.play();
      } else {
        schimbariNet(false);
      }
    });
  }

  void stopRadio() {
    _radioPlayer.stop();
  }

  void changeStation(
      {required String title,
      required String url,
      required String imageUrl,
      required int stationId}) {
    _radioPlayer
        .setChannel(title: title, imagePath: imageUrl, url: url)
        .then((value) => _radioPlayer.stop().then((value) => startRadio()));
    nowPlayingRadioImage = imageUrl;
    nowPlayingRadioTitle = title;
    notifyListeners();
  }
}

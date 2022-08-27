import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:radio_app/screens/radio_stations_favorites_screen.dart';
import '../models/radio_station.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class RStations with ChangeNotifier {
  bool favorite = false;

  void toggleFavorites() {
    favorite = !favorite;
    notifyListeners();
  }

  List<RadioStation> _radio_stations_list = [
    RadioStation(
        imageUrl:
            'https://play-lh.googleusercontent.com/N0nBwW9h9u6mP0QITuR_o8SZ8HzyuqPE8VJ1vav8iYtzTCpXFr9YvxVQP4DPKSgD9g=w240-h480-rw',
        title: 'Rock FM',
        url: 'https://live.rockfm.ro/rockfm.aacp',
        isFavorite: true),
    RadioStation(
        imageUrl:
            'https://static.wikia.nocookie.net/logopedia/images/f/fe/Digi_FM_2015.svg/revision/latest/scale-to-width-down/1000?cb=20210727093136',
        title: 'Digi FM',
        url: 'http://edge76.rdsnet.ro:84/digifm/digifm.mp3'),
    RadioStation(
        imageUrl:
            'https://guerrillaradio.b-cdn.net/wp-content/themes/guerrilla/library/images/new_logo_header.png',
        title: 'Guerilla Radio',
        url: 'http://live.guerrillaradio.ro:8010/guerrilla.aac'),
    RadioStation(
        imageUrl:
            'https://scontent.ftsr1-2.fna.fbcdn.net/v/t1.6435-9/83454443_10158087245651202_6740009976233721856_n.png?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=TaCuxxYNRyQAX8VzzSL&tn=FCuDTMOhWJ8PfJH5&_nc_ht=scontent.ftsr1-2.fna&oh=00_AT-TXavy14IZJ1qyB3CdQFZMcn0m5Ie5MnwsXaAOT8ea2w&oe=632DDFBA',
        title: 'Romania Actualitati',
        url: 'http://89.238.227.6:8002/%7CRadio'),
    RadioStation(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Radio_Rom%C3%A2nia_Cultural_%282008%29.svg/220px-Radio_Rom%C3%A2nia_Cultural_%282008%29.svg.png',
        title: 'Romania Cultural',
        url: 'http://89.238.227.6:8012/%7CRadio'),
    RadioStation(
        imageUrl:
            'https://static.wikia.nocookie.net/logopedia/images/b/b3/Radio_Rom%C3%A2nia_Antena_Satelor.svg/revision/latest?cb=20210727121605',
        title: 'Antena Satelor',
        url: 'http://89.238.227.6:8042/%7CRadio'),
    RadioStation(
        imageUrl:
            'https://static.wikia.nocookie.net/logopedia/images/b/b3/Radio_Rom%C3%A2nia_Antena_Satelor.svg/revision/latest?cb=20210727121605',
        title: 'Romania Constanta',
        url: 'http://89.238.227.6:8336/%7CRadio'),
  ];

  get favorit {
    return favorite;
  }

  get getList {
    return [..._radio_stations_list];
  }

  get getFavoriteList {
    return _radio_stations_list.where((element) => element.isFavorite).toList();
  }

  void changeFavoriteStatus(String titluPostSelectat) {
    _radio_stations_list
            .firstWhere((element) => element.title == titluPostSelectat)
            .isFavorite =
        !_radio_stations_list
            .firstWhere((element) => element.title == titluPostSelectat)
            .isFavorite;
    notifyListeners();
  }

  //file management |||
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeJsonFile(String json) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(json);
  }

  void savesDataLocally() {
    String jsonString =
        jsonEncode(_radio_stations_list.map((e) => e.toJson()).toList())
            .toString();
    writeJsonFile(jsonString);
  }

  Future<int> readUserData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      var data = json.decode(contents);
      var list = data as List;
      List<RadioStation> nouaLista = [];
      list.forEach((element) {
        //creaza noua lista si adauga acolo tot;
        RadioStation elementNou = RadioStation(
            imageUrl: element['imageUrl'],
            title: element['title'],
            url: element['url'],
            isFavorite: element['isFavorite']);

        nouaLista.add(elementNou);
      });
      _radio_stations_list = nouaLista;
      notifyListeners();
      // String parsedContent = jsonDecode(contents).toString();

      return 0;
    } catch (e) {
      print(e.toString());
      // If encountering an error, return 0
      return 0;
    }
  }
}

//file management ||

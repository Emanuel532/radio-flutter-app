import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/providers/ui_data.dart';
import '../providers/radio_stations_data.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var obiectDateRadio = Provider.of<RStations>(context);
    return ListTile(
      title: TextField(
        autofocus: true,
        onChanged: (value) {
          obiectDateRadio.setareValoareCautare(value);
        },
        decoration: InputDecoration(
          hintText: 'cautati postul radio...',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

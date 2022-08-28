import 'package:flutter/material.dart';
import '../providers/radio_player.dart';
import 'package:provider/provider.dart';

class TimerDialogMenu extends StatelessWidget {
  final BuildContext context;

  TimerDialogMenu(this.context);
  @override
  Widget build(BuildContext ctx) {
    return AlertDialog(
      title: Center(child: Text("Alegeti perioada dorita!")),
      content: Container(
        height: 200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Provider.of<RPlayer>(context, listen: false)
                      .stopRadioAfter(Duration(seconds: 60));

                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Aplicatia radio va fi inchisa in 1 minute.'),
                  ));
                  Navigator.of(context).pop();
                },
                child: Text('1 minut'),
              ),
              InkWell(
                onTap: () {
                  Provider.of<RPlayer>(context, listen: false)
                      .stopRadioAfter(Duration(minutes: 5));

                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Aplicatia radio va fi inchisa in 5 minute.'),
                  ));
                  Navigator.of(context).pop();
                },
                child: Text('5 minut'),
              ),
              InkWell(
                onTap: () {
                  Provider.of<RPlayer>(context, listen: false)
                      .stopRadioAfter(Duration(minutes: 15));

                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Aplicatia radio va fi inchisa in 15 minute.'),
                  ));
                  Navigator.of(context).pop();
                },
                child: Text('15 minut'),
              ),
              InkWell(
                onTap: () {
                  Provider.of<RPlayer>(context, listen: false)
                      .stopRadioAfter(Duration(minutes: 30));

                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Aplicatia radio va fi inchisa in 30 de minute.'),
                  ));
                  Navigator.of(context).pop();
                },
                child: Text('30 minut'),
              ),
              InkWell(
                onTap: () {
                  Provider.of<RPlayer>(context, listen: false)
                      .stopRadioAfter(Duration(minutes: 60));

                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Aplicatia radio va fi inchisa in 1 ore.'),
                  ));
                  Navigator.of(context).pop();
                },
                child: Text('1 ora'),
              ),
              InkWell(
                onTap: () {
                  Provider.of<RPlayer>(context, listen: false)
                      .stopRadioAfter(Duration(hours: 2));

                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Aplicatia radio va fi inchisa in 2 ore.'),
                  ));
                  Navigator.of(context).pop();
                },
                child: Text('2 ore'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Provider.of<RPlayer>(context, listen: false)
                      .cancelStopRadioAfter();
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content:
                        Text('Timer anulat. Aplicatia nu se va mai inchide.'),
                  ));
                },
                child: Text('Anulati timerul pentru inchidere.'),
              ),
            ]),
      ),
    );
  }
}

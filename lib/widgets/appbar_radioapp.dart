import 'package:flutter/material.dart';
import '../widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';
import '../providers/ui_data.dart';
import '../screens/search_screen.dart';

class AppBarRadioApp extends StatefulWidget with PreferredSizeWidget {
  final Widget searchBarWidget;
  final bool isSearchBar;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  AppBarRadioApp({required this.searchBarWidget, this.isSearchBar = false});

  @override
  State<AppBarRadioApp> createState() => _AppBarRadioAppState();
}

class _AppBarRadioAppState extends State<AppBarRadioApp> {
  Icon customIcon = const Icon(Icons.search);
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance
  //       .addPostFrameCallback((_) => customSearchBar = Text(widget.titlu));
  // }

  // @override
  // void didUpdateWidget() {
  //   this.didUpdateWidget();
  // }

  @override
  Widget build(BuildContext context) {
    var obiect = Provider.of<UIData>(context);
    return AppBar(
      title: widget.searchBarWidget,
      actions: [
        !widget.isSearchBar
            ? IconButton(
                onPressed: () {
                  // setState(() {
                  //   if (customIcon.icon == Icons.search) {
                  //     customIcon = const Icon(Icons.cancel);
                  //     customSearchBar = CustomSearchBar(context);
                  //   } else {
                  //     Provider.of<UIData>(context, listen: false)
                  //         .setKeyboardHeight(0);
                  //     customIcon = const Icon(Icons.search);
                  Navigator.pushNamed(context, SearchScreen.routeName);
                  //   }
                  // });
                },
                icon: customIcon)
            : IconButton(
                icon: Icon(Icons.abc_outlined),
                iconSize: 0,
                onPressed: null,
              )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerIcon({@required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.menu_rounded,
          size: 35,
        ),
        onPressed: () {
          scaffoldKey.currentState.openDrawer();
        });
  }
}

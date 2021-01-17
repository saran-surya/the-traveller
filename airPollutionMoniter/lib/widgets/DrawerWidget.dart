import 'package:airPollutionMoniter/screens/AboutScreen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Container(
        width: 200,
        child: Drawer(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
            child: Column(
              children: <Widget>[
                Text(
                  "Hello Traveller",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.amber[900]),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(AboutScreen.aboutPageRoute);
                  },
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        "About the App",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

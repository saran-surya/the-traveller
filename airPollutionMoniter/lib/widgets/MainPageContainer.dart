import 'package:flutter/material.dart';

class MainPageContainer extends StatelessWidget {
  const MainPageContainer();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.52,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink,
              Colors.blue[300],
            ],
            // stops: [1, 2],
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[900],
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ]),
    );
  }
}

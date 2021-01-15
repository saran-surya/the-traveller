import 'package:airPollutionMoniter/providers/InfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchIconWidget extends StatelessWidget {
  final TextEditingController controller;
  SearchIconWidget({@required this.controller});
  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;
    final windowWidth = MediaQuery.of(context).size.width;
    final isLoading = Provider.of<InfoProvider>(context).isLoading;
    return Positioned(
      // -----------------> search button
      top: windowHeight * 0.495,
      // left: windowWidth * 0.41,
      right: windowWidth * 0.03,
      child: (isLoading)
          ? Container(
              margin: EdgeInsets.only(top: 15, right: 15),
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                // backgroundColor: Colors.pink[400],
                strokeWidth: 5,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            )
          : IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.restore,
                color: Colors.black54,
                size: 40,
              ),
              onPressed: () {
                controller.clear();
                Provider.of<InfoProvider>(context, listen: false).resetList();
              },
            ),
    );
  }
}

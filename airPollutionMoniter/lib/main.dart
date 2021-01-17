import 'package:airPollutionMoniter/providers/InfoProvider.dart';
import 'package:airPollutionMoniter/screens/AboutScreen.dart';
import 'package:airPollutionMoniter/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InfoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            headline6: TextStyle(fontFamily: "Poppins"),
          ),
        ),
        routes: {
          HomePage.homePageroute: (context) => HomePage(),
          AboutScreen.aboutPageRoute: (context) => AboutScreen(),
        },
      ),
    );
  }
}

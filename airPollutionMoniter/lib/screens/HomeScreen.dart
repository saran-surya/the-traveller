import 'package:airPollutionMoniter/providers/InfoProvider.dart';
import 'package:airPollutionMoniter/widgets/CityNamesList.dart';
import 'package:airPollutionMoniter/widgets/DrawerIcon.dart';
import 'package:airPollutionMoniter/widgets/DrawerWidget.dart';
import 'package:airPollutionMoniter/widgets/MainPageContainer.dart';
import 'package:airPollutionMoniter/widgets/SearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String homePageroute = "/";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;
    final windowWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: Stack(
        children: [
          // -----------------> main top image widget background
          Positioned(
            top: windowHeight * 0.032,
            // height: windowHeight * 0.53,
            width: windowWidth,
            child: Card(
              elevation: 6,
              // shadowColor: Colors.black,
              margin: EdgeInsets.all(6),
              // margin: EdgeInsets.only(top: 25, left: 5, right: 5),
              // margin: const EdgeInsets.only(top: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/main_page_bg.jpg"),
              ),
            ),
          ),
          Positioned(
            // -----------------> main page container with the gradient
            top: windowHeight * 0.48,
            child: const MainPageContainer(),
          ),
          Positioned(
            // -----------------> search menu card
            top: windowHeight * 0.485,
            child: Card(
              elevation: 12,
              color: Colors.purpleAccent,
              margin: EdgeInsets.only(
                left: windowWidth * 0.025,
                top: windowWidth * 0.025,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                // margin: EdgeInsets.only(left: windowWidth * 0.095),
                width: windowWidth * 0.95,
                height: windowHeight * 0.49,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Colors.white54],
                      stops: [0.1, 0.95]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                        width: windowWidth * 0.8,
                        margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: TextFormField(
                          controller: _controller,
                          onFieldSubmitted: (value) {
                            if (value.isEmpty == false)
                              Provider.of<InfoProvider>(context, listen: false)
                                  .cityFilterFrom(value.toUpperCase());
                          },
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 15),
                          autofillHints: [AutofillHints.location],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(width: 2)),
                            labelText: "Type Your District name << <<",
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.black54, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: windowHeight * 0.38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CityNamesList()),
                    )
                  ],
                ),
              ),
            ),
          ),
          SearchIconWidget(controller: _controller),
          Positioned(
              // -----------------> menu button to open drawer
              top: windowHeight * 0.04,
              left: windowWidth * 0.02,
              child: DrawerIcon(scaffoldKey: _scaffoldKey))
        ],
      ),
    );
  }
}

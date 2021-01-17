import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const aboutPageRoute = "/routes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 15, left: 8, right: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 12,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      // height: 200,
                      child: Text(
                        "This App is developed for\nthe PUBLIC to get the timings of\nS.E.T.C Bus Routes\nto various (Cities/States) from\nvarious DISTRICTS of TAMILNADU",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 12,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      // height: 200,
                      child: Text(
                        "We value your Privacy,\nSpecialities of our APP:\n>Ad free\n> No Special Permissions required\n> We do not access your storage",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    // color: Colors.deepOrange[400],
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 12,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      // height: 200,
                      child: Column(
                        children: [
                          Text(
                            "Our Data and Server support",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 15),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    "assets/images/data-logo.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    "assets/images/heroku.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white,
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    "assets/images/Github.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.home,
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

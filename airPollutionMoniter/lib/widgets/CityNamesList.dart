import 'package:airPollutionMoniter/providers/InfoProvider.dart';
import 'package:airPollutionMoniter/widgets/TimingsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityNamesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cities = Provider.of<InfoProvider>(context).cityList;
    final bool _isPresent = Provider.of<InfoProvider>(context).isPresent;
    final isNetworkPresent =
        Provider.of<InfoProvider>(context).networkConnectivity;

    return (cities.length > 0)
        ? GridView.builder(
            // padding: EdgeInsets.only(top: 5),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 18,
              childAspectRatio: 2,
            ),
            itemCount: cities.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  final data =
                      await Provider.of<InfoProvider>(context, listen: false)
                          .timingsList(cities[index]);
                  print(data);
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: const Radius.circular(25.0),
                          //   topRight: const Radius.circular(25.0),
                          // ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              color: Colors.blue,
                              child: Center(
                                child: (data[0]["to"].toString().contains("("))
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${data[0]["from"]} >> TO >> ${data[0]["to"].toString().substring(0, data[0]["to"].toString().indexOf("("))}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                          ),
                                          Text(
                                            "${data[0]["to"].toString().substring(data[0]["to"].toString().indexOf("("))}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        "${data[0]["from"]} >> TO >> ${data[0]["to"]}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 18),
                                      ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8, right: 8),
                              child: TimingsList(timingsList: data),
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 6,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [Colors.purple, Colors.orange[200]]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: (cities[index].contains("("))
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cities[index]
                                      .substring(0, cities[index].indexOf("(")),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontSize: 15),
                                ),
                                Text(
                                  cities[index].substring(
                                    cities[index].indexOf("("),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontSize: 15),
                                )
                              ],
                            )
                          : Text(
                              cities[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: 15,
                                  ),
                            ),
                    ),
                  ),
                ),
              );
            },
          )
        : (_isPresent)
            ? (isNetworkPresent)
                ? Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/gifs/bus_animation.gif",
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/gifs/no-internet-connection.png",
                        fit: BoxFit.cover,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  )
            : (isNetworkPresent)
                ? Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/gifs/404-fallback.gif",
                      ),
                    ),
                  )
                : Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/gifs/no-internet-connection.png",
                        fit: BoxFit.cover,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  );
  }
}

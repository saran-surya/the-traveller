import 'package:airPollutionMoniter/providers/InfoProvider.dart';
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
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.amber,
                        );
                      });
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

import 'package:flutter/material.dart';

class TimingsList extends StatelessWidget {
  final List timingsList;
  TimingsList({@required this.timingsList});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25)),
      child: ListView.builder(
        itemCount: timingsList.length,
        itemBuilder: (BuildContext context, index) {
          List<dynamic> _departureTimings =
              timingsList[index]["departure_timings"].toString().split(",");
          print(timingsList[index]["departure_timings"].toString().split(","));
          print(double.parse(timingsList[index]["no_of_service"]));
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: (double.parse(timingsList[index]["no_of_service"]) > 8)
                ? MediaQuery.of(context).size.height *
                    0.016 *
                    double.parse(timingsList[index]["no_of_service"])
                : 200,
            decoration: BoxDecoration(
              // color: Colors.pink[300],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.pink[400],
                  Colors.blue[700],
                ],
                // stops: [0.4, 1],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   "${timingsList[index]["type"]}",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .headline6
                          //       .copyWith(fontSize: 14),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Card(
                              color: Colors.transparent,
                              elevation: 12,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: CircleAvatar(
                                backgroundColor:
                                    (timingsList[index]["type"] == "ULTRA")
                                        ? Colors.amber[900]
                                        : Colors.purple[900],
                                child: (timingsList[index]["type"] == "ULTRA")
                                    ? Text(
                                        "U",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    : Text(
                                        "A/C",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                              ),
                            ),
                          ),
                          Container(
                            // height: 15,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.amber[600],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "${timingsList[index]["route_length"]} kms.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 8),
                            child: Text(
                              timingsList[index]["route_no_"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4, bottom: 8),
                  child: Text(
                    "Departure Timings",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo[800],
                        borderRadius: BorderRadius.circular(25),
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 5,
                        //     spreadRadius: 3,
                        //     color: Colors.black,
                        //     offset: Offset(-2, 0),
                        //   )
                        // ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: GridView.builder(
                        itemCount: _departureTimings.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3,
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 5),
                        itemBuilder: (BuildContext context, index) {
                          double time = double.parse(_departureTimings[index]);
                          String _time = "";
                          if (time >= 13) {
                            time = time - 12;
                          }
                          // time.toStringAsFixed(2);
                          // print(time);
                          if (time
                                  .toString()
                                  .substring(time.toString().indexOf(".") + 1)
                                  .length <
                              2) {
                            _time = "${time.toString()}0";
                          } else {
                            _time = time.toStringAsFixed(2);
                          }

                          return Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.av_timer,
                                  color: Colors.white,
                                ),
                                Text(
                                  (double.parse(_departureTimings[index]) < 12)
                                      // ignore: unnecessary_brace_in_string_interps
                                      ? "${_time} am"
                                      // ignore: unnecessary_brace_in_string_interps
                                      : "${_time} pm",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

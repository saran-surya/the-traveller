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
            print(
                timingsList[index]["departure_timings"].toString().split(","));
            print(double.parse(timingsList[index]["no_of_service"]));
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: (double.parse(timingsList[index]["no_of_service"]) > 15)
                  ? double.parse(timingsList[index]["no_of_service"]) * 15
                  : double.parse(timingsList[index]["no_of_service"]) * 150,
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
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: _departureTimings.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3,
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                        itemBuilder: (BuildContext context, index) {
                          double time = double.parse(_departureTimings[index]);
                          String _time = "";
                          if (time > 12) {
                            time = time - 12;
                          }

                          if (time
                                  .toString()
                                  .substring(time.toString().indexOf(".") + 1)
                                  .length <
                              2) {
                            _time = "${time.toString()}0";
                          } else {
                            _time = time.toString();
                          }

                          return Container(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.av_timer),
                                Text((double.parse(_departureTimings[index]) <
                                        12)
                                    ? "${_time} am"
                                    : "${_time} pm"),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          }),
    );
  }
}

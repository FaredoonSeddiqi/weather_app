import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wapp/latitudelan.dart';
import 'package:wapp/weatherdata.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var dateform = DateFormat('EEEE,d MMM,yyyy').format(DateTime.now());
  String? valueSelect;

  List<String> items = <String>[
    'USA',
    'AUS',
    'UK',
    'ISB',
    'CHINA',
    'CANADA',
  ];

  var client = weatherdata();
  var data;
  info() async {
    var position = await Getposition();

    data = await client.getdata(position.latitude, position.longitude);
    return data;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          return Container(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: 550,
                    padding: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff955cd1),
                            Color(0xff3fa2fa),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )),
                    child: Column(
                      children: [
                        Text(
                          "${data?.cityName}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '$dateform',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'lib/image/img1.png',
                          ),
                          radius: 150,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        DecoratedBox(
                          decoration: ShapeDecoration(
                            color: Colors.cyan,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Colors.cyan),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5),
                            child: DropdownButton<String>(
                              hint: Text("Where do you live"),
                              value: valueSelect,
                              items: items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {
                                setState(() {
                                  valueSelect = _!;
                                });
                              },
                              dropdownColor: Color.fromARGB(255, 62, 112, 156),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Gust",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                        Text(
                          "${data?.gust}kp/h",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Pressure",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.Pressure}kp/h",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Uv",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.uv}",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Precipitation",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.precip_mm} mm",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Wind",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                        Text(
                          "${data?.wind_mph} kp/h",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "last update",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.last_update}",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                      ],
                    ))
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

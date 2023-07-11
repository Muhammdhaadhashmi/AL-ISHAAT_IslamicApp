import 'package:flutter/material.dart';

// Define a PrayerTime class to represent each prayer time
class PrayerTime {
  final String name;
  String time;
  String? newTime;

  PrayerTime({required this.name, required this.time});
}

class PrayerTimingScreen extends StatefulWidget {
  @override
  _PrayerTimingScreenState createState() => _PrayerTimingScreenState();
}

class _PrayerTimingScreenState extends State<PrayerTimingScreen> {
  final List<PrayerTime> prayerTimes = [
    PrayerTime(name: 'Fajr', time: '5:30 AM'),
    PrayerTime(name: 'Dhuhr', time: '12:30 PM'),
    PrayerTime(name: 'Asr', time: '4:00 PM'),
    PrayerTime(name: 'Maghrib', time: '6:30 PM'),
    PrayerTime(name: 'Isha', time: '8:00 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Prayer Timing',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.builder(
          itemCount: prayerTimes.length,
          itemBuilder: (context, index) {
            final prayerTime = prayerTimes[index];

            return Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    title: Text(
                      prayerTime.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      prayerTime.time,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      initialValue: prayerTime.time,
                      decoration: InputDecoration(
                        labelText: 'Time',
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          prayerTime.newTime = newValue;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        prayerTime.time = prayerTime.newTime ?? prayerTime.time;
                        prayerTime.newTime = null;
                      });
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

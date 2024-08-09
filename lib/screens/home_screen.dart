import 'package:flutter/material.dart';
import 'package:earlylife/utils/const.dart';
import 'package:earlylife/widgets/card_items.dart';
import 'package:earlylife/widgets/card_main.dart';
import 'package:earlylife/widgets/card_section.dart';
import 'package:earlylife/widgets/custom_clipper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    //ValueKey key = ValueKey(context);

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),
          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                // Header - Greetings and Avatar
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Good Morning,\nParents",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                    CircleAvatar(
                        radius: 26.0,
                        backgroundImage: AssetImage('assets/icons/boy (3).png'))
                  ],
                ),

                const SizedBox(height: 50),

                // Main Cards - Heartbeat and Blood Pressure
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardMain(
                        image: const AssetImage('assets/icons/noise (1).png'),
                        title: "ASD Potencial",
                        value: "25",
                        unit: "%",
                        color: Constants.lightGreen,
                        key: const ValueKey("25"),
                      ),
                      CardMain(
                        image: const AssetImage('assets/icons/heartbeat.png'),
                        title: "Heartbeat",
                        value: "66",
                        unit: "bpm",
                        color: Constants.lightBlue,
                        key: const ValueKey("66"),
                      ),
                      CardMain(
                        image: const AssetImage('assets/icons/blooddrop.png'),
                        title: "Blood Pressure",
                        value: "123/63",
                        unit: "mmHg",
                        color: Constants.lightYellow,
                        key: const ValueKey("66/123"),
                      )
                    ],
                  ),
                ),

                // Section Cards - Daily Medication
                const SizedBox(height: 50),

                Text(
                  "YOUR DAILY MEDICATIONS",
                  style: TextStyle(
                    color: Constants.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const <Widget>[
                        CardSection(
                          image: AssetImage('assets/icons/capsule.png'),
                          title: "Risperidone",
                          value: "2",
                          unit: "pills",
                          time: "6-7AM",
                          isDone: false,
                          key: ValueKey("2"),
                        ),
                        CardSection(
                          image: AssetImage('assets/icons/syringe.png'),
                          title: "Aripiprazole",
                          value: "1",
                          unit: "shot",
                          time: "8-9AM",
                          isDone: true,
                          key: ValueKey("1"),
                        )
                      ],
                    )),

                const SizedBox(height: 50),

                // Scheduled Activities
                Text(
                  "SCHEDULED ACTIVITIES",
                  style: TextStyle(
                      color: Constants.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                ListView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    CardItems(
                      image: Image.asset(
                        'assets/icons/sleep.png',
                      ),
                      title: "Sleeping",
                      value: "3",
                      unit: "Hours",
                      color: Constants.lightYellow,
                      progress: 30,
                      key: const ValueKey("750"),
                    ),
                    CardItems(
                      image: Image.asset(
                        'assets/icons/puzzle.png',
                      ),
                      title: "Puzzle",
                      value: "30",
                      unit: "mins",
                      color: Constants.lightBlue,
                      progress: 0,
                      key: const ValueKey("30"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

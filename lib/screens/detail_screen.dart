import 'package:flutter/material.dart';
import 'package:earlylife/utils/const.dart';
import 'package:earlylife/widgets/custom_clipper.dart';
import 'package:earlylife/widgets/grid_item.dart';
import 'package:earlylife/widgets/progress_vertical.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // For Grid Layout
    double crossAxisSpacing = 16, mainAxisSpacing = 16, cellHeight = 150.0;
    int crossAxisCount = 2;

    double width = (MediaQuery.of(context).size.width -
            ((crossAxisCount - 1) * crossAxisSpacing)) /
        crossAxisCount;
    double aspectRatio =
        width / (cellHeight + mainAxisSpacing + (crossAxisCount + 1));

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Constants.darkGreen,
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
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Back Button
                        SizedBox(
                          width: 34,
                          child: RawMaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: const CircleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                            child: const Icon(Icons.arrow_back_ios,
                                size: 15.0, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "ASD Potencial",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.start,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  "25",
                                  style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "%",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image(
                        fit: BoxFit.cover,
                        image: const AssetImage('assets/icons/noise (4).png'),
                        height: 73,
                        width: 80,
                        color: Colors.white.withOpacity(1)),
                  ],
                ),
                const SizedBox(height: 30),
                // Chart
                Material(
                  shadowColor: Colors.grey.withOpacity(0.01), // added
                  type: MaterialType.card,
                  elevation: 10, borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        // Rest Active Legend
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Constants.lightGreen,
                                  shape: BoxShape.circle),
                            ),
                            const Text("Rest"),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Constants.darkGreen,
                                  shape: BoxShape.circle),
                            ),
                            const Text("Active"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Main Cards - Heartbeat and Blood Pressure
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[
                              ProgressVertical(
                                value: 50,
                                date: "5/11",
                                isShowDate: true,
                                key: ValueKey(50),
                              ),
                              ProgressVertical(
                                value: 50,
                                date: "5/12",
                                isShowDate: false,
                                key: ValueKey(50),
                              ),
                              ProgressVertical(
                                value: 45,
                                date: "5/13",
                                isShowDate: false,
                                key: ValueKey(50),
                              ),
                              ProgressVertical(
                                value: 30,
                                date: "5/14",
                                isShowDate: true,
                                key: ValueKey(30),
                              ),
                              ProgressVertical(
                                value: 50,
                                date: "5/15",
                                isShowDate: false,
                                key: ValueKey(50),
                              ),
                              ProgressVertical(
                                value: 20,
                                date: "5/16",
                                isShowDate: false,
                                key: ValueKey(20),
                              ),
                              ProgressVertical(
                                value: 45,
                                date: "5/17",
                                isShowDate: true,
                                key: ValueKey(45),
                              ),
                              ProgressVertical(
                                value: 67,
                                date: "5/18",
                                isShowDate: false,
                                key: ValueKey(67),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Line Graph
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                shape: BoxShape.rectangle,
                                color: Constants.darkGreen,
                              ),
                              child: ClipPath(
                                clipper: MyCustomClipper(
                                    clipType: ClipType.multiple),
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  shape: BoxShape.rectangle,
                                  color: Constants.lightGreen,
                                )),
                              )),
                        ),
                      ],
                    ),
                  ), // added
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: crossAxisSpacing,
                    mainAxisSpacing: mainAxisSpacing,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    switch (index) {
                      case 0:
                        return GridItem(
                          status: "Rest",
                          time: "4h 45m",
                          value: "76",
                          unit: "avg bpm",
                          color: Constants.darkGreen,
                          image: null,
                          remarks: "ok",
                          key: const ValueKey("76"),
                        );
                      case 1:
                        return GridItem(
                          status: "Active",
                          time: "30m",
                          value: "82",
                          unit: "avg bpm",
                          color: Constants.darkOrange,
                          image: null,
                          remarks: "ok",
                          key: const ValueKey("82"),
                        );
                      case 2:
                        return GridItem(
                          status: "Movement",
                          time: "",
                          value: "Moderate",
                          unit: "",
                          color: Constants.darkOrange,
                          image: const AssetImage("assets/icons/crawl.png"),
                          remarks: "Ok",
                          key: const ValueKey("82"),
                        );
                      case 3:
                        return GridItem(
                          status: "Fitness Level",
                          time: "",
                          value: "82",
                          unit: "avg bpm",
                          color: Constants.darkOrange,
                          image: const AssetImage("assets/icons/Heart.png"),
                          remarks: "Fit",
                          key: const ValueKey("82"),
                        );
                      case 4:
                        return GridItem(
                          status: "Endurance",
                          time: "",
                          value: "82",
                          unit: "avg bpm",
                          color: Constants.darkOrange,
                          image: const AssetImage("assets/icons/Battery.png"),
                          remarks: "Ok",
                          key: const ValueKey("82"),
                        );
                      case 5:
                        return GridItem(
                          status: "Voice",
                          time: "",
                          value: "Moderate",
                          unit: "",
                          color: Constants.darkOrange,
                          image: const AssetImage("assets/icons/voice.png"),
                          remarks: " Mod.",
                          key: const ValueKey("82"),
                        );
                      default:
                        return GridItem(
                          status: "Rest",
                          time: "4h 45m",
                          value: "76",
                          unit: "avg bpm",
                          image: const AssetImage("assets/icons/Heart.png"),
                          remarks: "ok",
                          color: Constants.darkOrange,
                          key: const ValueKey("76"),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

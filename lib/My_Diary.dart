import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_dummy_app/bottomSheet_UI.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:flutter/cupertino.dart';

class MyDiary extends StatefulWidget {
  const MyDiary({super.key});

  @override
  State<MyDiary> createState() => _MyDiaryState();
}

class _MyDiaryState extends State<MyDiary> {
  List<IconData> iconList = [
    FontAwesomeIcons.notesMedical,
    Icons.access_time,
    FontAwesomeIcons.appleWhole,
    Icons.person_outline
  ];
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => bottomSheet()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            backgroundColor: Colors.white70,
          ),
        ),
        body: Container(
          height: size.height,
          color: Colors.grey.shade200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35, left: 10, right: 10),
                  height: size.height / 16,
                  // color: Colors.lime,
                  child: ListTile(
                    leading: Text(
                      "My Diary",
                      style: TextStyle(fontSize: 30),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                Container(
                  child: custom2(txt: "Mediterranean", txt1: "Details"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 28, right: 28),
                  height: size.height / 3.5,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80.0),
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0))),
                  child: Column(
                    children: [
                      Container(
                        height: size.height / 5.7,
                        width: size.width,
                        child: Row(
                          children: [
                            Container(
                              height: size.height,
                              width: size.width / 2.4,
                              child: Column(
                                children: [
                                  custom5(
                                      text1: "Eaten",
                                      text2: "1127",
                                      text3: "kcal",
                                      img: "asset/eaten.png"),
                                  custom5(
                                      text1: "Burned",
                                      text2: "102",
                                      text3: "kcal",
                                      img: "asset/burned.png"),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height,
                              width: size.width / 2.38,
                              child: CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 12.0,
                                animation: true,
                                percent: 0.44,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1503",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.0,
                                          color: Colors.blue),
                                    ),
                                    Text("kcal left")
                                  ],
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: custom4(
                                text1: "Carbs",
                                percent: 0.3,
                                text2: "12g left",
                                progressColor: Colors.blue,
                                bgColor: Colors.blue.shade100),
                          ),
                          Container(
                            child: custom4(
                                text1: "Protein",
                                percent: 0.7,
                                text2: "30g left",
                                progressColor: Colors.red.shade300,
                                bgColor: Colors.red.shade100),
                          ),
                          Container(
                            child: custom4(
                                text1: "Fat",
                                percent: 0.4,
                                text2: "10g left",
                                progressColor: Colors.yellow.shade700,
                                bgColor: Colors.yellow.shade100),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: custom2(
                    txt: "Meals Today",
                    txt1: "Customize",
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      height: size.height / 3.4,
                      width: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          custom1(
                              child: custom3(
                                  mainText: "Breakfast",
                                  Text2: "Bread,\nPeanut Butter,\nApple",
                                  Text3: "525",
                                  Text4: "kcal"),
                              firstColor: Color(0xFFFB8385),
                              secondColor: Color(0xFFFFAE94),
                              imag: "asset/icn1.png"),
                          custom1(
                              child: custom3(
                                  mainText: "Lunch",
                                  Text2: "Salmon, \nMixed Veggies, \nAvocado",
                                  Text3: "602",
                                  Text4: "kcal"),
                              firstColor: Color(0xFF7488E7),
                              secondColor: Color(0xFF5D63DF),
                              imag: "asset/lunch.png"),
                          custom1(
                              child: custom3(
                                mainText: "Snack",
                                Text2: "Recommend: \n800 kcal",
                              ),
                              firstColor: Color(0xFFFF93B5),
                              secondColor: Color(0xFFF4557F),
                              imag: "asset/snack.png"),
                          custom1(
                              child: custom3(
                                  mainText: "Dinner",
                                  Text2:
                                  "Brown Rice, \nMixed Veggies, \nDal, Salad",
                                  Text3: "342",
                                  Text4: "kcal"),
                              firstColor: Colors.green,
                              secondColor: Colors.orange,
                              imag: "asset/dinner.png"),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    Positioned(left: 250,bottom: 15,
                      child: FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add, color: Colors.black),
                      shape: CircleBorder(side: BorderSide.none),
                      onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Container(
                  child: custom2(txt: "Body Measurement", txt1: "Today"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 28, right: 28),
                  height: size.height / 3.5,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80.0),
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0))),
                  // child:SizedBox(
                  //   height: 10,
                  //   width: 80,
                  //   child: CupertinoDatePicker(
                  //     mode: CupertinoDatePickerMode.date,
                  //     initialDateTime: DateTime(1969, 1, 1),
                  //     onDateTimeChanged: (DateTime newDateTime) {
                  //       // Do something
                  //     },
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget custom1({
    String? text,
    double? height,
    required String? imag,
    Widget? child,
    double? width,
    required Color? firstColor,
    required Color? secondColor,
  }) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.4,
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Container(
              height: MediaQuery.of(context).size.height / 4.2,
              width: MediaQuery.of(context).size.width / 3.2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      firstColor!,
                      secondColor!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80.0),
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))),
              child: child,
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 3,
          height: 85,
          width: 85,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Image(
              image: AssetImage(imag ?? ''),
              height: 60,
            ),
          ),
        ),
      ],
    );
  }

  Widget custom2({
    String? txt,
    String? txt1,
    VoidCallback? onTap,
    double? height,
    double? width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8, left: 10, right: 10),
        height: 40,
        child: ListTile(
          leading: Text(
            txt ?? "",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  txt1 ?? "",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Icon(Icons.arrow_forward_sharp),
            ],
          ),
        ),
      ),
    );
  }

  Widget custom3({
    String? mainText,
    String? Text4,
    String? Text2,
    String? Text3,
    double? height,
    double? width,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 15, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
          ),
          Text(
            mainText ?? "",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            Text2 ?? "",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Text3 ?? "",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                Text4 ?? "",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget custom4({
    String? text1,
    String? text2,
    double? height,
    double? width,
    Color? progressColor,
    Color? bgColor,
    double? percent,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 5,
      child: Padding(
        padding: EdgeInsets.only(left: 8, top: 5),
        child: Column(
          children: [
            Text(
              text1 ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            LinearPercentIndicator(
              barRadius: Radius.circular(20),
              width: 62,
              animation: true,
              lineHeight: 4.0,
              animationDuration: 2000,
              percent: percent ?? 0,
              progressColor: progressColor,
              backgroundColor: bgColor,
            ),
            Text(
              text2 ?? "",
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }

  Widget custom5(
      {String? text1,
      String? text2,
      String? text3,
      required String? img,
      double? height,
      double? width}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 3,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: RotatedBox(
              quarterTurns: 1,
              child: Divider(
                  height: 20,
                  thickness: 3,
                  indent: 5,
                  endIndent: 5,
                  color: Colors.blue),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                text1 ?? "",
                style: TextStyle(fontSize: 12),
              )),
              Container(
                height: MediaQuery.of(context).size.height / 23,
                width: MediaQuery.of(context).size.width / 3.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(img ?? ''),
                      height: 28,
                    ),
                    Text(
                      text2 ?? "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      text3 ?? "",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
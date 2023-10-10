import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstUI extends StatefulWidget {
  const FirstUI({super.key});

  @override
  State<FirstUI> createState() => _FirstUIState();
}

class _FirstUIState extends State<FirstUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 80),
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Image(
                      image: AssetImage("asset/111.png"),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFF4C60F6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.notification_add,
                        color: Colors.white,
                      )),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFF4C60F6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: 615,
              width: 400,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFD7F6EA),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        height: 50,
                        child: ListTile(
                          leading: Image(
                            image: AssetImage("asset/222.png"),
                            height: 25,
                            width: 25,
                          ),
                          title: Text("Select Year"),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFD7F6EA),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        height: 50,
                        child: ListTile(
                          leading: Image(
                            image: AssetImage("asset/333.png"),
                            height: 25,
                            width: 25,
                          ),
                          title: Text("Select Country"),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFD7F6EA),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        height: 50,
                        child: ListTile(
                          leading: Image(
                            image: AssetImage("asset/444.png"),
                            height: 25,
                            width: 25,
                          ),
                          title: Text("Select Province"),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFD7F6EA),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage("asset/555.png"),
                                      height: 40,
                                      width: 40,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      "Enter number of entitled days",
                                      style: TextStyle(fontSize: 14.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFD7F6EA),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage("asset/222.png"),
                                      height: 40,
                                      width: 40,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: Text(
                                          "Select working\n schedule",
                                          style: TextStyle(fontSize: 14.5),
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFD7F6EA),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage("asset/222.png"),
                                      height: 40,
                                      width: 40,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: 120,
                                                child: Text(
                                                  "Select days\n must be off",
                                                  style:
                                                      TextStyle(fontSize: 14.5),
                                                ),
                                              ),
                                              Icon(Icons.arrow_forward),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFD7F6EA),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage("asset/222.png"),
                                      height: 40,
                                      width: 40,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: 120,
                                                child: Text(
                                                  "Select days that cannot be off",
                                                  style:
                                                      TextStyle(fontSize: 14.5),
                                                ),
                                              ),
                                              Icon(Icons.arrow_forward),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Maximization",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFD7F6EA),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        height: 50,
                        child: ListTile(
                          trailing: Image(
                            image: AssetImage("asset/222.png"),
                            height: 25,
                            width: 25,
                          ),
                          title: Text("Select month range"),
                          //leading: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFD7F6EA),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        height: 50,
                        child: ListTile(
                          trailing: Image(
                            image: AssetImage("asset/222.png"),
                            height: 25,
                            width: 25,
                          ),
                          title: Text("Select best block options"),
                          //leading: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFD7F6EA),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        height: 50,
                        child: ListTile(
                          trailing: Image(
                            image: AssetImage("asset/222.png"),
                            height: 25,
                            width: 25,
                          ),
                          title: Text("Select best days all year"),
                          //leading: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                          //color: ,
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        height: 60,
                        child: ListTile(
                          title: Text(
                            "Join time off with someone",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Maximize",
                                    style: TextStyle(fontSize: 20),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

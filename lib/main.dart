import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dummy_app/CRUD/CRUD_FirstTry.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/OTP%20_Screen.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/SignUp_UI.dart';
import 'package:my_dummy_app/My_Diary.dart';
import 'package:my_dummy_app/Second_UI.dart';
import 'package:my_dummy_app/Settings_UI.dart';

import 'Profile_UI.dart';

//import 'package:my_dummy_app/slider_UI.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       //home: const MyHomePage(title: 'Flutter demo Project'),
      //home: const ProfileUI(),
      home: const ProfileUI(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter Demo App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: FlutterLogo(
          size: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

      //   body: Container(
      //     color: Colors.amber,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
              // Container(
              //   padding: EdgeInsets.all(15),
              //   width: 400,
              //   child: TextField(
              //     style: TextStyle(fontSize: 25),
              //     maxLines: 5,
              //     minLines: 3,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              // Row(
              //   children: [
              //     Container(
              //
              //       alignment: Alignment.topLeft,
              //       margin: const EdgeInsets.symmetric(
              //           horizontal: 17, vertical: 17),
              //
              //       height: 500,
              //       width: 260,
              //       color: Colors.grey,
              //       child: Column(
              //         children: [
              //           Row(children: <Widget>[
              //             customButton(txt: "1", onTap: () {
              //               print("1 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "2", onTap: () {
              //               print("2 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "3", onTap: () {
              //               print("3 pressed");
              //             }, height: 70, width: 70),
              //
              //             // customButton(txt: "AC",onTap: () {
              //             //   print("AC pressed");
              //             // },),
              //
              //
              //           ]),
              //           Row(children: <Widget>[
              //             customButton(txt: "4", onTap: () {
              //               print("4 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "5", onTap: () {
              //               print("5 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "6", onTap: () {
              //               print("6 pressed");
              //             }, height: 70, width: 70),
              //
              //             // customButton(txt: "AC",onTap: () {
              //             //   print("AC pressed");
              //             // },),
              //
              //
              //           ]),
              //           Row(children: <Widget>[
              //             customButton(txt: "7", onTap: () {
              //               print("7 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "8", onTap: () {
              //               print("8 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "9", onTap: () {
              //               print("9 pressed");
              //             }, height: 70, width: 70),
              //
              //             // customButton(txt: "AC",onTap: () {
              //             //   print("AC pressed");
              //             // },),
              //
              //
              //           ]),
              //           Row(children: <Widget>[
              //             customButton(txt: "0", onTap: () {
              //               print("0 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "00", onTap: () {
              //               print("00 pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "*", onTap: () {
              //               print("* pressed");
              //             }, height: 70, width: 70),
              //
              //             // customButton(txt: "AC",onTap: () {
              //             //   print("AC pressed");
              //             // },),
              //
              //
              //           ]),
              //           Row(children: <Widget>[
              //             customButton(txt: "AC", onTap: () {
              //               print("AC pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "%", onTap: () {
              //               print("% pressed");
              //             }, height: 70, width: 70),
              //             customButton(txt: "()", onTap: () {
              //               print("() pressed");
              //             }, height: 70, width: 70),
              //
              //             // customButton(txt: "AC",onTap: () {
              //             //   print("AC pressed");
              //             // },),
              //
              //
              //           ]),
              //         ],
              //       ),
              //
              //
              //     ),
                  // Container(
                  //   color: Colors.red,
                  //   width: 80,
                  //   height: 500,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       customButton(onTap: () {
                  //         print("= pressed");
                  //       },txt: "=",height: 106,width: 60),
                  //       customButton(onTap: () {
                  //         print("+ pressed");
                  //       },txt: "+",height: 84,width: 60),
                  //       customButton(onTap: () {
                  //         print("- pressed");
                  //       },txt: "-",height: 84,width: 60),
                  //       customButton(onTap: () {
                  //         print("/ pressed");
                  //       },txt: "/",height: 84,width: 60),
                  //     ],
                  //   ),
                  // )
  //               ],
  //             ),
  //
  //
  //           ],
  //         ),
  //       )
  //   );
  // }

//   Widget customButton({String? txt, VoidCallback? onTap,double? height,double? width}){
//     return   GestureDetector(
//       onTap: onTap,
//       child: Container(
//           margin: EdgeInsets.only(left: 15,top: 10),
//           /*margin: EdgeInsets.only(left: 10),
//                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),*/
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(15)
//           ),
//           child: Center(
//             child: Text(
//               txt??"",
//
//               style: TextStyle(fontSize: 20.0),
//             ),
//
//           )),
//     );
//   }

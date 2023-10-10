import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    bodyMedium : TextStyle(
      color: Colors.white,
    ),
  )
);
final _darkTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodyMedium : TextStyle(
        color: Colors.black,
      ),
    )
);
class SettingsUI extends StatefulWidget {
  const SettingsUI({super.key});

  @override
  State<SettingsUI> createState() => _SettingsUIState();
}

class _SettingsUIState extends State<SettingsUI> {
bool isSwitch=false;
bool isSwitchOn=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isSwitchOn ? _lightTheme: _darkTheme,
    home: Scaffold(
      backgroundColor: isSwitchOn ? Colors.black: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                    child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: MediaQuery.of(context).size.height/1.1667,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height/20,
                    // ),
                    Expanded(
                     child: ListView.separated(
                         itemBuilder: (context, index) {
                       return Container(
                         height: MediaQuery.of(context).size.height/2.75,
                         width: MediaQuery.of(context).size.width,
                         child: Column(
                           children: [
                             Column(
                               children: [
                                 Container(
                                     height: MediaQuery.of(context).size.height / 14,
                                     width: MediaQuery.of(context).size.width ,
                                     child: custom1(
                                       icon: Icon(Icons.event_note_rounded),
                                       txt: "Privacy Policy",
                                       onTap: () {
                                         print("Privacy Policy");
                                       },
                                       trailing: Icon(Icons.arrow_forward_ios),)),
                                 Container(

                                     height: MediaQuery.of(context).size.height / 14,
                                     width: MediaQuery.of(context).size.width / 1,
                                     child: custom1(
                                       icon: Icon(Icons.description_outlined),
                                       txt: "Terms & Conditions",
                                       onTap: () {
                                         print("Terms & Conditions");
                                       },
                                       trailing: Icon(Icons.arrow_forward_ios),)),
                                 Container(
                                     height: MediaQuery.of(context).size.height / 14,
                                     width: MediaQuery.of(context).size.width / 1,
                                     child: custom1(
                                       icon: Icon(Icons.notifications_active_outlined),
                                       txt: "Notifications",
                                       onTap: () {
                                         print("Notifications");
                                       },
                                        trailing: SizedBox(
                                          height: 20,
                                          width: 30,
                                          child: CupertinoSwitch(
                                            value: isSwitch, activeColor: CupertinoColors.systemPink,
                                            onChanged: (bool? value) {
                                            setState(() {
                                              isSwitch=value ?? false;
                                            });
                                          },),
                                        )
                                     )),
                                 Container(
                                     height: MediaQuery.of(context).size.height / 14,
                                     width: MediaQuery.of(context).size.width / 1,
                                     child: custom1(
                                       icon: Icon(Icons.dark_mode_outlined),
                                       txt: "Dark Mode",
                                       onTap: () {
                                         print("Dark Mode");
                                       },
                                       trailing: SizedBox(
                                         height: 20,
                                         width: 30,
                                         child: CupertinoSwitch(
                                             value: isSwitchOn,
                                             activeColor:CupertinoColors.systemPink,
                                             onChanged: (newvalue){
                                               setState(() {
                                                 isSwitchOn=newvalue;
                                               });
                                             },),
                                       )
                                     )),
                                 Container(
                                     height: MediaQuery.of(context).size.height / 14,
                                     width: MediaQuery.of(context).size.width / 1,
                                     child: custom1(
                                       icon: Icon(Icons.power_settings_new_outlined),
                                       txt: "Log Out",
                                       onTap: () {
                                         print("Logout");
                                       },
                                       //  icons: Icon(Icons.arrow_forward_ios),
                                     )),
                               ],
                             ),
                           ],
                         ),
                       );
                     }, separatorBuilder: (context,index){
                           return Divider(
                             height: 20,
                           );
                     }, itemCount: 1),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    )
    );
  }
}
Widget custom1({
  String? txt,
  VoidCallback? onTap,
  double? height,
  double? width,
  Icon? icon,
  Widget? trailing,
}){
  return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
        ),
        // height: MediaQuery.of(context).size.height / 13,
        //      width: MediaQuery.of(context).size.width / 1,

        child: ListTile(
          leading: icon,
          trailing: trailing,
          title: Text(
            txt ?? "",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ));

}

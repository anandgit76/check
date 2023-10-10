import 'package:flutter/material.dart';
import 'package:my_dummy_app/bottomSheet_UI.dart';

import 'First_UI.dart';
import 'Profile_UI.dart';

class SecondUI extends StatefulWidget {
  const SecondUI({super.key});

  @override
  State<SecondUI> createState() => _FirstUIState();
}

class _FirstUIState extends State<SecondUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // showUnselectedLabels: false,
        // showSelectedLabels: false,
        onTap: (index) {
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfileUI()));
                setState(() {});
              },
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
            ),
            label: 'Profile',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FirstUI()));
                setState(() {});
              },
              icon: const Icon(Icons.filter_tilt_shift),
            ),
            label: 'Music',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const bottomSheet(),));
                },
                icon: const Icon(Icons.event_note_sharp),
              ),
              label: 'Sheet',
              backgroundColor: Colors.deepOrangeAccent),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80),
            margin: const EdgeInsets.symmetric(vertical: 1),
            height: 150,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Dine Favoritter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SizedBox(
            height: 550,
            width: 400,
            child: Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF1F4F6),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    height: 90,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('asset/666.jpg'),
                          radius: 30,
                        ),
                        Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "Climbing",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 55),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text(
                                    "Climbing is a set of outdoor activities that\n involves ascending mountains.",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(
                                    DateTime.now().toString(),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 60),
                                  child: Icon(Icons.share_outlined),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 20,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
// // This widget is the root
// // of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "ListView.builder",
//         theme: ThemeData(primarySwatch: Colors.green),
//         debugShowCheckedModeBanner: false,
//         home: const ListViewBuilder());
//   }
// }
//
// class ListViewBuilder extends StatelessWidget {
//   const ListViewBuilder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("ListView.builder")),
//       body: ListView.builder(
//           //itemCount: 10,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//                 leading: const Icon(Icons.list),
//                 trailing: const Text(
//                   "GFG",
//                   style: TextStyle(color: Colors.green, fontSize: 15),
//                 ),
//                 title: Text("List item $index"));
//           }),
//     );
//   }
// }

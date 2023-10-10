import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomSheet extends StatefulWidget {
  const bottomSheet({super.key});
  @override
  State<bottomSheet> createState() => _bottomSheetState();
}
class _bottomSheetState extends State<bottomSheet> {
  List<String> test = [
    "Business",
    "Culture",
    "Economy",
    "Finance",
    "News",
    "Personal growth",
    "Politics",
    "Science",
    "Tech",
    "World Affairs"
  ];
  List<int> selectedIndices = [];
  List<Color> selectedColors = [
    Colors.orange,
    Colors.lightBlue,
    Colors.greenAccent,
    Colors.lime,
    Colors.green,
    Colors.blueGrey,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Show Bottom Sheet"),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                     return Wrap(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                shape: const CircleBorder(),
                                child: const Text("Skip")),
                          ),
                          Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height/14,
                                width: MediaQuery.of(context).size.width,
                                child: const Padding(
                                  padding:
                                  EdgeInsets.only(left: 20, top: 8),
                                  child: Text(
                                    "Add your interests",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 22,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Get personalized suggetions"
                                        " alongside wider curations.Please "
                                        "choose at least 4 topics.",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                              ),
                              Container (
                                height: MediaQuery.of(context).size.height / 1.5,
                                child: ListView.builder(
                                    itemCount: test.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        height:
                                        MediaQuery.of(context).size.height /
                                            13,
                                        width: MediaQuery.of(context).size.width,
                                        child: custom1(
                                          text: test[index],
                                          index: index,
                                          onTap: () {
                                          bool isSelected = selectedIndices.contains(index);
                                          setState(() {
                                            if (isSelected) {
                                              selectedIndices.remove(index);
                                            } else {
                                             // if (selectedIndices.length < 4) {
                                                selectedIndices.add(index);
                                              }
                                            }
                                        //  }
                                          );
                                        },
                                        ),
                                      );
                                    }),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 10,
                                ),
                                height: MediaQuery.of(context).size.height / 13,
                                width: MediaQuery.of(context).size.width,
                                child: FloatingActionButton.extended(
                                  label: Text(
                                    "Continue",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.black,
                                  onPressed: () {
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const bottomSheet()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },

                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget custom1({
    String? text,
    required VoidCallback onTap,
    required int index,
  }) {
    bool isSelected = selectedIndices.contains(index);
    Color selectedColor = isSelected
        ? selectedColors[selectedIndices.indexOf(index) % selectedColors.length]
        : Colors.grey.shade300;
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: selectedColor,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: ListTile(
            title: Text(
              text ?? "",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            trailing:
                isSelected ? Icon(Icons.check, color: Colors.white) : null,
          ),
        ));
  }
}
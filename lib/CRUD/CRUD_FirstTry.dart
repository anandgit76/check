import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Contact.dart';

class CRUD_try extends StatefulWidget {
  const CRUD_try({super.key});

  @override
  State<CRUD_try> createState() => _CRUD_tryState();
}

class _CRUD_tryState extends State<CRUD_try> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<Contact> contacts = [];
  int selectedIndex = 0;
  List<int> selectedIndices = [];
  List<Color> selectedColors = [
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          '_CRUD_Operations_',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              maxLength: 16,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                  hintText: "Address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.send_time_extension_rounded,
                  ),
                  tooltip: "Save",
                  iconSize: 50,
                  color: Colors.green,
                  splashColor: Colors.purple,
                  onPressed: () {
                    String name = nameController.text.trim();
                    String number = numberController.text.trim();
                    String address = addressController.text.trim();
                    if (name.isNotEmpty &&
                        number.isNotEmpty &&
                        address.isNotEmpty) {
                      setState(() {
                        nameController.text = "";
                        numberController.text = "";
                        addressController.text = "";
                        contacts.add(Contact(
                            name: name, number: number, address: address));
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.access_time_filled_outlined,
                  ),
                  tooltip: "Update",
                  iconSize: 50,
                  color: Colors.blue,
                  splashColor: Colors.purple,
                  onPressed: () {
                    String name = nameController.text.trim();
                    String number = numberController.text.trim();
                    String address = addressController.text.trim();
                    if (name.isNotEmpty &&
                        number.isNotEmpty &&
                        address.isNotEmpty) {
                      setState(() {
                        nameController.text = "";
                        numberController.text = "";
                        addressController.text = "";
                        contacts[selectedIndex].name = name;
                        contacts[selectedIndex].number = number;
                        contacts[selectedIndex].address = address;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  tooltip: "Delete",
                  iconSize: 50,
                  color: Colors.pink,
                  onPressed: () {
                    setState(() {
                      contacts.removeAt(selectedIndex);
                      //print("index$selectedIndex");
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            contacts.isEmpty
                ? Text("Oops! No Data Found",
                    style: TextStyle(fontSize: 20, color: Colors.grey))
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    bool isSelected = selectedIndices.contains(index);
    return Card(
      color: isSelected ? Colors.orange : null,
      child: ListTile(
        onTap: () {
          selectedIndex = index;
          // print("indexontap$index");
          setState(() {});
        },
        onLongPress: () {
          selectedIndex = index;
          // print("indexlong$index");
          setState(() {
            if (isSelected) {
              selectedIndices.remove(index);
            } else {
              selectedIndices.add(index);
            }
          });
        },
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.red.shade300 : Colors.green.shade300,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: TextStyle(fontSize: 25),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].number),
            Text(contacts[index].address)
          ],
        ),
        trailing: SizedBox(
          width: 96,
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                ),
                color: Colors.blue,
                onPressed: () {
                  nameController.text = contacts[index].name;
                  numberController.text = contacts[index].number;
                  addressController.text = contacts[index].address;
                  setState(() {
                    selectedIndex = index;
                    print("index$selectedIndex");
                    // print("index$index");
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                ),
                color: Colors.pinkAccent,
                onPressed: () {
                  setState(() {
                    contacts.removeAt(index);
                    // print("index$index");
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/SignUp_UI.dart';
import 'Second_UI.dart';
import 'Settings_UI.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  //Packages
  File? galleryFile;
  File? gallery;
  final picker = ImagePicker();

  void removePicture() {
    setState(() {
      galleryFile = null;
    });
  }
  void removeBackgroundPicture(){
    setState(() {
      gallery = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future getImage(
      ImageSource img,
    ) async {
      final pickedFile = await picker.pickImage(source: img);
      XFile? xfilePick = pickedFile;
      setState(() {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Nothing is Selected")));
        }
      });
    }

    Future setImage(
      ImageSource img,
        {bool isBackground = false}
    ) async {
      final pickedFile = await picker.pickImage(source: img);
      XFile? xfilePick = pickedFile;
      setState(() {
        if (xfilePick != null) {
          if (isBackground) {
            // Update the background image
            gallery = File(pickedFile!.path);
          } else {
            // Update the profile picture
            galleryFile = File(pickedFile!.path);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Nothing is Selected")),
          );
        }
      });
    }

    void PickerUsed({
      required BuildContext context,
    }) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Camera"),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.do_not_disturb_alt),
                title: const Text("Remove Profile Picture"),
                onTap: () {
                  removePicture();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
        },
      );
    }

    void PickerWant({
      required BuildContext context,
    }) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: <Widget>[
              const ListTile(
                title: Text("Change your Background Image"),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Camera"),
                onTap: () {
                  setImage(ImageSource.camera,isBackground:true);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text("Photo Gallery"),
                onTap: () {
                  setImage(ImageSource.gallery,isBackground:true);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.do_not_disturb_alt),
                title: const Text("Remove Background Image"),
                onTap: () {
                  removeBackgroundPicture();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 82,
        child: BottomNavigationBar(
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          onTap: (index) {
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SecondUI()));
                    setState(() {});
                  },
                  icon: const Icon(Icons.home, size: 30),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingsUI()));
                    setState(() {});
                  },
                  icon: const Icon(Icons.settings_outlined,size: 30,),
                ),
                label: 'Settings'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignInScreen(),));
                    setState(() {});
                  },
                  icon: const Icon(Icons.manage_accounts_outlined,size: 30,),
                ), label: 'Account'),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 43),
            margin: const EdgeInsets.symmetric(vertical: 1),
            height: 100,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "My Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.74,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 85),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("asset/888.jpg"),fit: BoxFit.cover,
                    )),
                  ),
                ),
                Positioned(
                    right:0,
                    child: RawMaterialButton(
                      onPressed: () {
                        PickerWant(context: context);
                      },
                      elevation: 2.0,
                      padding: const EdgeInsets.all(5.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                    )),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: SizedBox(
                    height: 100,
                    width: 140,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 50,
                          child: CircleAvatar(
                            //backgroundImage: AssetImage("asset/777.jpg"),
                            radius: 49,
                            child: galleryFile == null
                                ? const Center(
                                child:Icon(Icons.person_outline,size: 80,))
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                galleryFile!,
                                fit: BoxFit.cover,
                                width:
                                MediaQuery.of(context).size.width /
                                    3,
                                height:
                                MediaQuery.of(context).size.width /
                                    3,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -10,
                            child: RawMaterialButton(
                              onPressed: () {
                                PickerUsed(context: context);
                              },
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              padding: const EdgeInsets.all(0.0),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                 bottom: 5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 19),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 20,
                            child: Text(
                              "Johnson Smith",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                            ),
                            Text(
                              "- 4658 Barter Street.",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF6F6F0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: 50,
            child: const ListTile(
              leading: Icon(
                Icons.person_outlined,
                size: 30,
              ),
              title: Text("Personal Information"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF6F6F0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: 50,
            child: const ListTile(
              leading: Icon(
                Icons.notifications_on_outlined,
                size: 30,
              ),
              title: Text("Notifications"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF6F6F0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: 50,
            child: const ListTile(
              leading: Icon(
                Icons.settings_outlined,
                size: 30,
              ),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ),
        ],
      ),
    );
  }
}

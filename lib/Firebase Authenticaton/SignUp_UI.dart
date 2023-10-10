import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/Home_UI.dart';
import 'SignIn_UI.dart';

class SignInScreen extends StatefulWidget {
   const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  // createUser(){
  //   DocumentReference documentReference = FirebaseFirestore.instance.collection("Users").doc(AutofillHints.name);
  //   Map<String,String> Users ={
  //     "UserName" : AutofillHints.name,
  //     "Password" : AutofillHints.password
  //   };
  //   documentReference.set(Users).whenComplete(() => print("Data Stored Successfully"));
  // }

  @override
  Widget build(BuildContext context) {
    // String emailAddress = '', password = '';
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.purple,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/10,
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => const HomeScreen(),));
                  },
                  fillColor: const Color(0xFFF5F6F9),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                ),
                const Center(
                  child: Text(
                    "Sign_Up",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 20,
                  ),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Name',
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 20,
                  ),
                  child: TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Email Address";
                      }
                      if (!emailRegex.hasMatch(value)) {
                        return "Please Enter a Valid Email Address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Email Address',
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 20,
                  ),
                  child: TextFormField(
                    controller: pass,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a password.';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Password',
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 30,
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 13,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: FloatingActionButton.extended(
                      label: const Text(
                        "SignUp",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      backgroundColor: Colors.blueGrey,
                      onPressed: () async {
                       // createUser();
                        if (_formKey.currentState!.validate()) {
                          _signup(
                              email: email.text.toString(),
                              password: pass.text.toString(),
                              context: context);
                        }
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Registered?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: const Text(
                          "Login Here",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signup({
    required String email,
    required String password,
    required BuildContext context}) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user != null){
        await FirebaseFirestore.instance.collection("Users").doc(credential.user!.uid).set(
            {
              "UserName":name.text,
              "Email": email,
            });
      }
      print("=======================$credential");
      if (credential.toString().isNotEmpty) {
        print("===========+++++++============$credential");
        setState(() {
          emptyFields();
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),);
      } else {
        print("User creation failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  emptyFields() {
    name.text = "";
    email.text = "";
    pass.text = "";
  }
}
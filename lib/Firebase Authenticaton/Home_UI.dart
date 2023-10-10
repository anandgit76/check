import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/OTP%20_Screen.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/SignIn_UI.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/SignUp_UI.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Page",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Container(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                  debugPrint('Received click');
                },
                child: const Text('Sign_Up',style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Container(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                  debugPrint('Received click');
                },
                child: const Text('Sign_In',style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Container(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                onPressed: () async {
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                  debugPrint('Received click');
                },
                child: const Text('Sign_Out',style: TextStyle(color: Colors.black),),
              ),
            ),

            Container(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OTP_Screen(),));
                  debugPrint('Received click');
                },
                child: const Text('OTP Screen',style: TextStyle(color: Colors.black),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/Home_UI.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/SignUp_UI.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.google),
            label: "Google",
            onTap: () {
              signInWithGoogle();
            },
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.facebook),
            label: "Facebook",
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.twitter),
            label: "Twitter",
            onTap: () {
              Xlogin();
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.lightGreenAccent.shade700,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
            children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/5,
                  ),
                  const Center(
                    child: Text(
                      "Sign_In",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  Column(
                    children: [
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Password',
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 25,
                    ),
                    height: MediaQuery.of(context).size.height/13,
                    width: MediaQuery.of(context).size.width,
                    child: FloatingActionButton.extended(
                      label: const Text(
                        "SignIn",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      backgroundColor: Colors.blueGrey,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signIn(
                              email: email.text.toString(),
                              password: pass.text.toString(),
                              context: context);
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not Registered Yet?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ));
                          },
                          child: const Text(
                            "Sign_Up Here",
                            style: TextStyle(color: Colors.pink),
                          ))
                    ],
                  ),
                  Text("!..........Or SignIn with..........!",
                    style: TextStyle(fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white70.withOpacity(1.0)),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          signInWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 12.0,
                            textStyle: const TextStyle(color: Colors.white)),
                        child: Icon(FontAwesomeIcons.google),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signInWithFacebook();
                          setState(() {
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 12.0,
                            textStyle: const TextStyle(color: Colors.white)),
                        child: Icon(FontAwesomeIcons.facebook),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Xlogin();
                          setState(() {
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 12.0,
                            textStyle: const TextStyle(color: Colors.white)),
                        child: const Icon(FontAwesomeIcons.twitter)
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signInWithYahoo();
                          setState(() {
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 12.0,
                            textStyle: const TextStyle(color: Colors.white)),
                        child: const Icon(FontAwesomeIcons.yahoo)
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future<void> signInWithYahoo() async {
    try {
      final OAuthProvider oAuthProvider = OAuthProvider('yahoo.com');
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(oAuthProvider);
      final User? user = userCredential.user;
      print('Signed in with Yahoo! User ID: ${user?.uid}');
    } catch (error) {
      print('Error signing in with Yahoo: $error');
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    print("facebook Login");
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile', 'user_birthday']
    );
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider
        .credential(loginResult.accessToken!.token);
    final userData = await FacebookAuth.instance.getUserData();
    userEmail = userData["email"];
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void Xlogin() async {
    final twitterLogin = TwitterLogin(apiKey: "gcQutcL4hme7u1XpaDEXMyaKx",
        apiSecretKey: "MnojeaOdfwnbwQpPvjV4UcJ9Y2vpu30pBHLzYhHtCGhUYTSkAk",
        redirectURI: "flutter-twitter-login://");
    await twitterLogin.login().then((value) async{
      final twitterAuthCredential = TwitterAuthProvider.credential(accessToken: value.authToken!,
          secret: value.authTokenSecret!)
;
      print("ghghghj========>   ${twitterAuthCredential.secret}");

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    });
  }

  signInWithGoogle() async {
    GoogleSignInAccount? Googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await Googleuser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    print(userCredential.user?.displayName);

    if (userCredential.user != null) {
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => HomeScreen(),));
    }
  }

  _signIn({required String email,
    required String password,
    required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      print("=======================$credential");
      if (credential.toString().isNotEmpty) {
        print("===========+++++++============$credential");
        setState(() {
          emptyFields();
        });
        Navigator.push(
            (context), MaterialPageRoute(builder: (context) => HomeScreen(),));
      } else {
        print("=========here");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  emptyFields() {
    email.text = "";
    pass.text = "";
  }
}
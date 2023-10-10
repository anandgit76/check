import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dummy_app/Firebase%20Authenticaton/SignIn_UI.dart';

class Google_SignUp extends StatefulWidget {
  const Google_SignUp({super.key});

  @override
  State<Google_SignUp> createState() => _Google_SignUpState();
}

class _Google_SignUpState extends State<Google_SignUp> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.purple,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                  NetworkImage('https://media2.giphy.com/media/3oKGzFba1fQEuthrkQ/giphy.gif?cid=ecf05e4765emnx6hkj2yhcx8xszsytxgmb0e61jgc2wby3jl&ep=v1_gifs_search&rid=giphy.gif&ct=g'),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Sign_Up",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          //controller: name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Name',
                            filled: true,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 20,
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          // controller: email,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Enter Email Address";
                          //   }
                          //   if (!emailRegex.hasMatch(value)) {
                          //     return "Please Enter a Valid Email Address";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Email Address',
                            filled: true,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 20,
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          // controller: pass,
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
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 30,
                        ),
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width,
                        child: FloatingActionButton.extended(
                          label: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          backgroundColor: Colors.blueGrey,
                          onPressed: () {},
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Registered?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: Text(
                                "Login Here",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Widget custom1({
//   String? textValidate,
//   String? hintText,
//   bool isEmail = false,
//   double? height,
//   double? width,
//   String? Function(String?)? validator,
//   bool? isPass,
//   TextEditingController? controller,
// }){
//   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//   return GestureDetector(
//     //onTap: onTap,
//     child: Container(
//       margin: EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//       ),
//       child: TextFormField(
//         // onChanged: (value){
//         //   emailAddress = value;
//         // },
//         controller: controller,
//         obscureText:  isPass??false,
//         validator: (value) {
//           if (isEmail) {
//             if (value == null || value.isEmpty) {
//               return hintText;
//             }
//             if (!emailRegex.hasMatch(value)) {
//               return 'Please enter a valid email';
//             }
//           }
//           if (validator != null) {
//             return validator(value);
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//           hintText: hintText,
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 5,color: Colors.blueGrey),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           border: InputBorder.none,
//           filled: true,
//         ),
//       ),
//     ),
//   );
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/Profile.dart';
import 'package:flutter_application_1/ZeroPage/Welcom.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'Login_Register.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final formKey = GlobalKey<FormState>();
  // Profile profile = Profile(
  //     fname: "",
  //     lname: "",
  //     telephone: "",
  //     email: "",
  //     password: "",
  //     repassword: "");

  // final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text("Login System"),
  //       ),
  //       body: Container(
  //           color: Color.fromARGB(255, 194, 184, 240),
  //           child: Center(
  //             child: Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(16),
  //                     gradient: LinearGradient(colors: [
  //                       Color.fromARGB(255, 74, 179, 228),
  //                       Color.fromARGB(255, 159, 202, 109)
  //                     ])),
  //                 margin: EdgeInsets.fromLTRB(32, 15, 32, 0),
  //                 padding: EdgeInsets.all(24),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: <Widget>[
  //                     Padding(
  //                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
  //                       child: Container(
  //                         padding: EdgeInsets.only(
  //                           bottom: 10, // Space between underline and text
  //                         ),
  //                         decoration: BoxDecoration(
  //                             border: Border(
  //                                 bottom: BorderSide(
  //                           color: Colors.pink,
  //                           width: 5.0, // Underline thickness
  //                         ))),
  //                         child: Text(
  //                           "Login",
  //                           style: TextStyle(
  //                             fontSize: 30,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     buildTextFieldEmail(),
  //                     buildTextFieldPassword(),
  //                     buildButtonSignIn(),
  //                     buildOtherLine(),
  //                     buildButtonForgotPassword(),
  //                   ],
  //                 )),
  //           )));
  // }

  // Container buildButtonForgotPassword() {
  //   return Container(
  //       constraints: BoxConstraints.expand(height: 50),
  //       child: Text("Forgot Password",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //               color: Colors.white)),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(16), color: Colors.red[200]),
  //       margin: EdgeInsets.only(top: 16),
  //       padding: EdgeInsets.all(12));
  // }

  // Container buildButtonSignIn() {
  //   return Container(
  //       constraints: BoxConstraints.expand(height: 50),
  //       child: Text("Sign in",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //               color: Colors.white)),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
  //       margin: EdgeInsets.only(top: 16),
  //       padding: EdgeInsets.all(12));
  // }

  // Widget buildOtherLine() {
  //   return Container(
  //       margin: EdgeInsets.only(top: 16),
  //       child: Row(children: <Widget>[
  //         Expanded(child: Divider(color: Color.fromARGB(255, 3, 3, 3))),
  //         Padding(
  //             padding: EdgeInsets.all(6),
  //             child: Text("Forgot Your Account?",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold, color: Colors.black87))),
  //         Expanded(child: Divider(color: Color.fromARGB(255, 3, 3, 3))),
  //       ]));
  // }

  // Container buildTextFieldEmail() {
  //   return Container(
  //       padding: EdgeInsets.all(12),
  //       decoration: BoxDecoration(
  //           color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
  //       child: TextField(
  //           decoration: InputDecoration.collapsed(hintText: "Email"),
  //           style: TextStyle(fontSize: 18)));
  // }

  // Container buildTextFieldPassword() {
  //   return Container(
  //       padding: EdgeInsets.all(12),
  //       margin: EdgeInsets.only(top: 12),
  //       decoration: BoxDecoration(
  //           color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
  //       child: TextField(
  //           obscureText: true,
  //           decoration: InputDecoration.collapsed(hintText: "Password"),
  //           style: TextStyle(fontSize: 18)));

  //   // ignore: dead_code
  // }
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
      fname: "",
      lname: "",
      telephone: "",
      email: "",
      password: "",
      repassword: "");
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error !"),
              ),
              body: Center(
                child: Text("Error ! \n ${snapshot.error}",
                    style: TextStyle(fontSize: 30)),
              ),
            );
          }
          ;
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Login System"),
                ),
                body: Container(
                    color: Color.fromARGB(255, 194, 184, 240),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          10, // Space between underline and text
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.pink,
                                      width: 5.0, // Underline thickness
                                    ))),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                // Text("*Email: ",
                                //     style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "*Email",
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.email_outlined)),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Please Input the Email."),
                                    EmailValidator(
                                        errorText: "Email Invaid Value.")
                                  ]),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (String? email) {
                                    profile.email = email!;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Text("*Password: ",
                                //     style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "*Password",
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.lock_outline)),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Password Invaid Value"),
                                    MinLengthValidator(8,
                                        errorText:
                                            'password must be at least 8 digits long'),
                                    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                        errorText:
                                            'passwords must have at least one special character')
                                  ]),
                                  obscureText: true,
                                  onSaved: (String? password) {
                                    profile.password = password!;
                                  },
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 40, 20, 20),
                                    child: SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: ElevatedButton.icon(
                                          icon: Icon(Icons.add_box_rounded),
                                          label: Text("Login Now !",
                                              style: TextStyle(fontSize: 20)),
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              formKey.currentState?.save();
                                              try {
                                                await FirebaseAuth.instance
                                                    .signInWithEmailAndPassword(
                                                        email: profile.email,
                                                        password:
                                                            profile.password)
                                                    .then((value) {
                                                  formKey.currentState?.reset();
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return WelcomeScreen();
                                                  }));
                                                });
                                              } on FirebaseAuthException catch (e) {
                                                Fluttertoast.showToast(
                                                    msg: e.code,
                                                    gravity:
                                                        ToastGravity.CENTER);
                                              }
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 20),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: OutlinedButton.icon(
                                        icon: Icon(Icons.turn_left),
                                        label: Text("Back to Home",
                                            style: TextStyle(fontSize: 20)),
                                        onPressed: () async {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return HomeScreen();
                                          }));
                                        },
                                        style: OutlinedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 176, 81, 235),
                                          side: BorderSide(
                                            width: 2.0,
                                            color: Color.fromARGB(
                                                255, 176, 81, 235),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )));
          }
          ;
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

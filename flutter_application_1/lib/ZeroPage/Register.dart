import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Model/Profile.dart';
import 'package:form_field_validator/form_field_validator.dart';

// import 'package:form_field_validator/form_field_validator.dart';
class RegisterScreen extends StatefulWidget {
  // const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  title: Text("Register System"),
                ),
                body: Container(
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
                            Text("▰▱▰ Register ▱▰▱",
                                style: TextStyle(fontSize: 40)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("*FristName: ",
                                style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "FristName Invaid Value"),
                              keyboardType: TextInputType.name,
                              onSaved: (String? fname) {
                                profile.fname = fname!;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("*LastName: ", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "LastName Invaid Value"),
                              keyboardType: TextInputType.name,
                              onSaved: (String? lname) {
                                profile.lname = lname!;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("*Telephone: ",
                                style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "Telephone Invaid Value"),
                              keyboardType: TextInputType.phone,
                              onSaved: (String? telephone) {
                                profile.telephone = telephone!;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("*Email: ", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Please Input the Email."),
                                EmailValidator(errorText: "Email Invaid Value.")
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String? email) {
                                profile.email = email!;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("*Password: ", style: TextStyle(fontSize: 20)),
                            TextFormField(
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
                            SizedBox(
                              height: 20,
                            ),
                            Text("*Re-Password: ",
                                style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "RE Password Invaid Value"),
                              obscureText: true,
                              onSaved: (String? repassword) {
                                profile.repassword = repassword!;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 40, 20, 20),
                                child: SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton.icon(
                                      icon: Icon(Icons.add_box_rounded),
                                      label: Text("Register Now !",
                                          style: TextStyle(fontSize: 20)),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState?.save();
                                          try {
                                            await FirebaseAuth.instance
                                                .createUserWithEmailAndPassword(
                                                    email: profile.email,
                                                    password: profile.password);
                                            formKey.currentState?.reset();
                                          } on FirebaseAuthException catch (e) {
                                            print(e.message);
                                          }
                                        }
                                      },
                                    )),
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

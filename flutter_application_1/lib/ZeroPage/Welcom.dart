import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ZeroPage/Login_Register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth1 = FirebaseAuth.instance.currentUser?.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME JAA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
            child: Column(
          children: [
            Text(
              "WELCOME ARE YOU READY !\n" + auth1!,
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  });
                },
                child: Text("LogOut Here"))
          ],
        )),
      ),
    );
  }
}

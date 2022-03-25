import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home_Login_Register"),
        ),
        body: Column(
          children: [
            SizedBox(
              child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("Create New Account",style: TextStyle(fontSize: 20)),
                  onPressed: () {},
                  ),
              
            )
          ],
        ));
  }
}

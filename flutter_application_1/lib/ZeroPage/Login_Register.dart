import 'package:flutter/material.dart';
import 'package:flutter_application_1/ZeroPage/Register.dart';
import 'package:flutter_application_1/ZeroPage/Login.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home_Login_Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // padding: const EdgeInsets.fromLTRB(20,20,20,0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('picture/pic1.jpg'),
                    radius: 220,
                  ),
                ),
                const Text(
                  '\n\n\n\n\nPOP ME Please POP Me Now !!! Ahhhhhhhh',
                  style: TextStyle(height: 0, fontSize: 25),
                ),
                const Text(
                  'POP ME POP ME UP\n\n',
                  style: TextStyle(height: 0, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text("Create New Account",style: TextStyle(fontSize: 25)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return RegisterScreen();
                          })
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.login),
                      label: Text("Login With Your Account",style: TextStyle(fontSize: 25)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return LoginScreen();
                          })
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Text("\n2022 \u00a9 PrabPluem Mobile App"),
                )
              ],
            ),
        ),
        );
  }
}

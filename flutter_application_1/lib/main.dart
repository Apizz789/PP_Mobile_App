// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prab PLUEM Molie App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'PRAB PLUEM Moblie Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  get flatButtonStyle => null;

  get raisedButtonStyle => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "picture/pic1.jpg",
              height: 300,
              width: 300,
            ),
            const Text(
              '\n\nPOP ME Please POP Me Now !!! Ahhhhhhhh',
              style: TextStyle(height: 0, fontSize: 30),
            ),
            const Text(
              'POP ME POP ME UP\n\n',
              style: TextStyle(height: 0, fontSize: 20),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(50, 3, 50, 0),
                child: TextField(
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: "Username"),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(50, 3, 50, 0),
                child: TextField(
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                )),
            Container(
                margin: EdgeInsets.all(20),
                height: 40.0,
                width: 200.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                      height: 0,
                      fontSize: 20,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 112, 229, 236),
                  padding: EdgeInsets.only(left: 50, right: 50),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: Text(
                    'Join with us ?',
                    style: TextStyle(
                      height: 0,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ),
                TextButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      height: 0,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text("\n\n\n\n2022 \u00a9 PrabPluem Mobile App"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

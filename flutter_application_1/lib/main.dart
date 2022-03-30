import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ZeroPage/Login_Register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// // // }
// void main() => runApp(MyApp());


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrabPluem Moblie Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: const MyHomePage(title: 'PrabPluem Moblie Application'),
      home: HomeScreen()
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
            CircleAvatar(
              backgroundImage: AssetImage('picture/pic1.jpg'),
              radius: 220,
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _loginBuildPopupDialog(context),
                    );
                  },
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _registerBuildPopupDialog(context),
                    );
                  },
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _repasswordBuildPopupDialog(context),
                    );
                  },
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

Widget _loginBuildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Warring !'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Username or Password is Wrong."),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _registerBuildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Register !'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Username or Password is Wrong."),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _repasswordBuildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('RESET your password'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Username or Password is Wrong."),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

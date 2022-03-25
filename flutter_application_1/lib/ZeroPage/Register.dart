import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
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
                    Text(" ▰▱▰ Register ▱▰▱", style: TextStyle(fontSize: 40)),
                    SizedBox(
                      height: 20,
                    ),
                    Text("*FristName: ", style: TextStyle(fontSize: 20)),
                    TextFormField(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("*LastName: ", style: TextStyle(fontSize: 20)),
                    TextFormField(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("*Telephone: ", style: TextStyle(fontSize: 20)),
                    TextFormField(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("*Email: ", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      keyboardType:TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("*Password: ", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("*Re-Password: ", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                        child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.add_box_rounded),
                              label: Text("Register Now !",
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {},
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
}

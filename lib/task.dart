import 'package:flutter/material.dart';

class MyApp1 extends StatefulWidget {
  final String title;
  MyApp1({Key key, this.title}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

// ignore: camel_case_types
class contextCapture {
  static var context;
}

Future navigateToSubPage(context) async {
  Navigator.pop(context);
}

class _MyApp1State extends State<MyApp1> {
  // ignore: missing_return

  @override
  Widget build(BuildContext context) {
    // print("CURRENT INDEX = ${Commands.currentindex}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => {Navigator.pop(context)}),
            ),
            body: Container(
              child: Text("Hello"),
            ),
            
          )),
    );
  }
}
                      
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:get/get.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'task.dart';
import 'profile.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

bool selected = true;

class contextCapture {
  static var context;
}

Future navigateToSubPage(context) async {
  Navigator.pop(context);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue, brightness: _brightness),
          // home: MyHomePage(title: 'Task Manager'),
          home: CustomSplash(
              duration: 5000,
              backGroundColor: Colors.white,
              logoSize: 500,
              animationEffect: 'zoom-in',
              customFunction: () {
                CircularProgressIndicator();
                //FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
                //FlutterStatusbarcolor.setNavigationBarColor(Colors.blue);
              },
              imagePath: 'images/splash.gif',
              home: MyHomePage(title: 'Task Manager')),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              ThemeBuilder.of(context).changeTheme();
                selected = !selected;
            },
            child: Icon(selected ? Icons.light_mode : Icons.dark_mode),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/man.gif"),
                  fit: BoxFit.fitWidth,
                ),
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: const Text("Language"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: const Text("Search User"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: const Text("All Users"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text("Details of Users"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.grid_on),
              title: const Text("Change View"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: ProfileTwoPage(),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('To Do'), icon: Icon(Icons.list_alt)),
          BottomNavyBarItem(
              title: Text('In Progress'), icon: Icon(Icons.watch_later)),
          BottomNavyBarItem(title: Text('Done'), icon: Icon(Icons.done)),
          BottomNavyBarItem(
              title: Text('Active Proje'),
              icon: Icon(Icons.run_circle_outlined)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            contextCapture.context = context;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyApp1();
          }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.calendar_today_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

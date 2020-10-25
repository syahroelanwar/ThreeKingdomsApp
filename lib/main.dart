import 'package:flutter/material.dart';
import 'package:threekingdomsapp/pages/about.dart';
import 'package:threekingdomsapp/pages/history.dart';
import 'package:threekingdomsapp/pages/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Three Kingdoms',
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text(_currentIndex==2?"About Us":_currentIndex==1?"History":"Dynasty Ensiklopedia"),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.black))),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (newIndex) => setState((){_currentIndex = newIndex;}),
            type: BottomNavigationBarType.fixed,
            items: [BottomNavigationBarItem(
              icon: _currentIndex==0?SvgPicture.asset(
              "assets/icons/home.svg",width: 20,):SvgPicture.asset(
              "assets/icons/home-outline.svg",width: 20,),
              title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: _currentIndex==1?Icon(Icons.border_all):Icon(Icons.border_clear),
                title: Text('History'),
              ),
              BottomNavigationBarItem(
                icon: _currentIndex==2?Icon(Icons.info):Icon(Icons.info_outline),
                title: Text('Info'),
              )
            ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Home(),
          History(),
          About(),
        ],
      ),
    );
  }
}



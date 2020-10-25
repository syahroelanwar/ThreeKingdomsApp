import 'package:flutter/material.dart';
import 'package:threekingdomsapp/views/homeview.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AllCharacters(),
          TopCharacters(),
          ShuCharacters(),
          WeiCharacters(),
          WuCharacters(),
          OtherCharacters()
        ],
      ),
    );
  }
}

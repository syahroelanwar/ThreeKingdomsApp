import 'package:flutter/material.dart';

class About extends StatelessWidget {

  List<String> info = [
    "App Name",
    "Build Version",
    "Email",
    "Developer",
    "Copyright"
  ];
  List<String> sub = [
    "Dynasty Ensiklopedia App",
    "Version 1.0",
    "syahrul.am9773@gmail.com",
    "MSA",
    "Copyright © 2019 All rights reserved"
    //"https://koei.fandom.com/\n\nhttps://threekingdoms.wikia.org/\n\nhttps://the3kingdoms.fandom.com/wiki/\n\nhttp://kongming.net/\n\nhttps://military.wikia.org/wiki/"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context,int index){
            final information = info[index].toString();
            final subt = sub[index].toString();
            return Card(
              child: ListTile(
                leading: ClipRect(
                  child: Icon(
                    index==0?Icons.home:index==1?Icons.verified_user:index==2?Icons.mail:index==3?Icons.account_circle:Icons.copyright,
                    //size: 20,
                  ),
                ),
                title: Text(information, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),),
                subtitle: Text(subt, style: TextStyle(fontStyle: FontStyle.italic),),
              ),
            );
          },
        ),
      ),
    );
  }
}

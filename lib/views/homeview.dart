import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:threekingdomsapp/model/allhero.dart';
import 'package:threekingdomsapp/views/detail.dart';

//http://heaped-magnesium.000webhostapp.com/rest_ci4/index.php/RestHero

class AllCharacters extends StatelessWidget {
  Future<List<AllHero>> _getAllHero() async {
    var allData = await http.get(
        "http://heaped-magnesium.000webhostapp.com/rest_ci4/index.php/RestHero");
    var jsonData = json.decode(allData.body) as List;
    List<AllHero> heroes = [];
    for (var m in jsonData) {
      AllHero hero = AllHero(m["name"], m["kingdom"], m["detail"], m["img"]);
      heroes.add(hero);
    }
    return heroes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:10.0),
                  child: Text("All Characters", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:16.0
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:3.0),
                  child: Text("Three Kingdoms heroes", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:12.0
                  ),),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _getAllHero(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.data == null){
                        return Container(child: Center(child: CircularProgressIndicator()));
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.00, bottom: 10.00, left: 8, right: 4),
                                    child: InkWell(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image(
                                              image: NetworkImage("http://heaped-magnesium.000webhostapp.com/img/"+snapshot.data[index].img),
                                              width: 80.0,
                                              height: 80.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text(snapshot.data[index].name, style: TextStyle(
                                              color:Color(0xff202124),
                                            ),),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text("of "+snapshot.data[index].kingdom,  style: TextStyle(
                                                color:Color(0xff5f6368),
                                                fontSize:12.0
                                            ),),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(name:snapshot.data[index].name,kingdom:snapshot.data[index].kingdom,detail: snapshot.data[index].detail,img:snapshot.data[index].img))
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class TopCharacters extends StatelessWidget {
  Future<List<AllHero>> _getTopHero() async {
    var allData = await http.get(
        "http://heaped-magnesium.000webhostapp.com/rest_ci4/index.php/RestHero/show/yes");
    var jsonData = json.decode(allData.body) ['data'] as List;
    List<AllHero> heroes = [];
    for (var m in jsonData) {
      AllHero hero = AllHero(m["name"], m["kingdom"], m["detail"], m["img"]);
      heroes.add(hero);
    }
    return heroes;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:10.0),
                  child: Text("Popular Characters", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:16.0
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:3.0),
                  child: Text("Three Kingdoms top heroes", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:12.0
                  ),),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _getTopHero(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.data == null){
                        return Container(child: Center(child: CircularProgressIndicator()));
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.00, bottom: 10.00, left: 8, right: 4),
                                    child: InkWell(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image(
                                              image: NetworkImage("http://heaped-magnesium.000webhostapp.com/img/"+snapshot.data[index].img),
                                              width: 180.0,
                                              height: 200.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text(snapshot.data[index].name, style: TextStyle(
                                              color:Color(0xff202124),
                                            ),),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text("of "+snapshot.data[index].kingdom,  style: TextStyle(
                                                color:Color(0xff5f6368),
                                                fontSize:12.0
                                            ),),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(name:snapshot.data[index].name,kingdom:snapshot.data[index].kingdom,detail: snapshot.data[index].detail,img:snapshot.data[index].img))
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class ShuCharacters extends StatelessWidget {
  Future<List<AllHero>> _getShuHero() async {
    var allData = await http.get(
        "http://heaped-magnesium.000webhostapp.com/rest_ci4/index.php/RestHero/show/shu");
    var jsonData = json.decode(allData.body) ['data'] as List;
    List<AllHero> heroes = [];
    for (var m in jsonData) {
      AllHero hero = AllHero(m["name"], m["kingdom"], m["detail"], m["img"]);
      heroes.add(hero);
    }
    return heroes;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:10.0),
                  child: Text("SHU Kingdom", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:16.0
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:3.0),
                  child: Text("All Hero Of Shu", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:12.0
                  ),),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _getShuHero(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.data == null){
                        return Container(child: Center(child: CircularProgressIndicator()));
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.00, bottom: 10.00, left: 8, right: 4),
                                    child: InkWell(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image(
                                              image: NetworkImage("http://heaped-magnesium.000webhostapp.com/img/"+snapshot.data[index].img),
                                              width: 80.0,
                                              height: 80.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text(snapshot.data[index].name, style: TextStyle(
                                              color:Color(0xff202124),
                                            ),),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text("of "+snapshot.data[index].kingdom,  style: TextStyle(
                                                color:Color(0xff5f6368),
                                                fontSize:12.0
                                            ),),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(name:snapshot.data[index].name,kingdom:snapshot.data[index].kingdom,detail: snapshot.data[index].detail,img:snapshot.data[index].img))
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class WeiCharacters extends StatelessWidget {
  Future<List<AllHero>> _getWeiHero() async {
    var allData = await http.get(
        "http://heaped-magnesium.000webhostapp.com/rest_ci4/index.php/RestHero/show/wei");
    var jsonData = json.decode(allData.body) ['data'] as List;
    List<AllHero> heroes = [];
    for (var m in jsonData) {
      AllHero hero = AllHero(m["name"], m["kingdom"], m["detail"], m["img"]);
      heroes.add(hero);
    }
    return heroes;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:10.0),
                  child: Text("WEI Kingdom", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:16.0
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:3.0),
                  child: Text("All Hero of Wei", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:12.0
                  ),),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _getWeiHero(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.data == null){
                        return Container(child: Center(child: CircularProgressIndicator()));
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.00, bottom: 10.00, left: 8, right: 4),
                                    child: InkWell(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image(
                                              image: NetworkImage("http://heaped-magnesium.000webhostapp.com/img/"+snapshot.data[index].img),
                                              width: 80.0,
                                              height: 80.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text(snapshot.data[index].name, style: TextStyle(
                                              color:Color(0xff202124),
                                            ),),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text("of "+snapshot.data[index].kingdom,  style: TextStyle(
                                                color:Color(0xff5f6368),
                                                fontSize:12.0
                                            ),),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(name:snapshot.data[index].name,kingdom:snapshot.data[index].kingdom,detail: snapshot.data[index].detail,img:snapshot.data[index].img))
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class WuCharacters extends StatelessWidget {
  Future<List<AllHero>> _getWuHero() async {
    var allData = await http.get(
        "http://heaped-magnesium.000webhostapp.com/rest_ci4/index.php/RestHero/show/wu");
    var jsonData = json.decode(allData.body)['data'] as List;
    List<AllHero> heroes = [];
    for (var m in jsonData) {
      AllHero hero = AllHero(m["name"], m["kingdom"], m["detail"], m["img"]);
      heroes.add(hero);
    }
    return heroes;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:10.0),
                  child: Text("WU Kingdom", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:16.0
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:3.0),
                  child: Text("All Hero of Wu", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:12.0
                  ),),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _getWuHero(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.data == null){
                        return Container(child: Center(child: CircularProgressIndicator()));
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.00, bottom: 10.00, left: 8, right: 4),
                                    child: InkWell(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image(
                                              image: NetworkImage("http://heaped-magnesium.000webhostapp.com/img/"+snapshot.data[index].img),
                                              width: 80.0,
                                              height: 80.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text(snapshot.data[index].name, style: TextStyle(
                                              color:Color(0xff202124),
                                            ),),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text("of "+snapshot.data[index].kingdom,  style: TextStyle(
                                                color:Color(0xff5f6368),
                                                fontSize:12.0
                                            ),),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(name:snapshot.data[index].name,kingdom:snapshot.data[index].kingdom,detail: snapshot.data[index].detail,img:snapshot.data[index].img))
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class OtherCharacters extends StatelessWidget {
  Future<List<AllHero>> _getOtherHero() async {
    var allData = await http.get(
        "http://heaped-magnesium.000webhostapp.com/rest_ci4/index.php/RestHero/show/other");
    var jsonData = json.decode(allData.body)['data'] as List;
    List<AllHero> heroes = [];
    for (var m in jsonData) {
      AllHero hero = AllHero(m["name"], m["kingdom"], m["detail"], m["img"]);
      heroes.add(hero);
    }
    return heroes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:10.0),
                  child: Text("Other Characters", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:16.0
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:3.0),
                  child: Text("Three Kingdoms heroes", style: TextStyle(
                      color:Color(0xff616161),
                      fontSize:12.0
                  ),),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _getOtherHero(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.data == null){
                        return Container(child: Center(child: CircularProgressIndicator()));
                      }else{
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.00, bottom: 10.00, left: 8, right: 4),
                                    child: InkWell(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image(
                                              image: NetworkImage("http://heaped-magnesium.000webhostapp.com/img/"+snapshot.data[index].img),
                                              width: 80.0,
                                              height: 80.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text(snapshot.data[index].name, style: TextStyle(
                                              color:Color(0xff202124),
                                            ),),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                            ),
                                            Text(snapshot.data[index].kingdom,  style: TextStyle(
                                                color:Color(0xff5f6368),
                                                fontSize:12.0
                                            ),),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.push(context,
                                            new MaterialPageRoute(builder: (context) => DetailPage(name:snapshot.data[index].name,kingdom:snapshot.data[index].kingdom,detail: snapshot.data[index].detail,img:snapshot.data[index].img))
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

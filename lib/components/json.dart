import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(new MaterialApp(
    home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class Location {
  final String id;
  final double title;
  final double subtitle;

  Location({this.id, this.title, this.subtitle});
}

class HomePageState extends State<HomePage> {

  List data;
  var subtitle;
  Future _future;
  List<Location> locations;

  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/data.json');
 

    this.setState(() {
      data = jsonDecode(response);
      subtitle = data[0]["subtitle"];
    });
    
  
    print(subtitle);
    
    
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(subtitle[index]),
          );
        },
      ),
    );
  }
}
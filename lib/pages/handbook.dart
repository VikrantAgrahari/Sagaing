import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sagain_region/components/componentsForPages.dart';
import 'package:sagain_region/components/data.dart';
import 'package:sagain_region/components/variable.dart';

class Handbook extends StatefulWidget {
  @override
  _HandbookState createState() => _HandbookState();
  final Stream<int> stream;
  final Stream<int> stream2;
  Handbook(this.stream, this.stream2);
}

class HandBookTitles {
  final String id;
  final double title;
  final double subtitle;

  HandBookTitles({this.id, this.title, this.subtitle});
}

class _HandbookState extends State<Handbook> {
  List data;
  List<dynamic> titles;
  Future future;

  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/data.json');

    this.setState(() {
      data = jsonDecode(response);
    });

    listForHandbook = [];

    for (var i = 0; i < data.length; i++) {
      listForHandbook.add(data[i]["title"].toString());
    }
    selectedNamesForHandbook = [];
    selectedNamesForHandbook = listForHandbook;
    print(selectedNamesForHandbook);

    return "Success!";
  }

  void _updateFontSize(int fontSize) {
    setState(() {
      selectedFontSize = fontSize;
    });
  }

  @override
  void initState() {
    this.getData();
    widget.stream.listen((fontSize) {
      _updateFontSize(fontSize);
    });
    widget.stream2.listen((event) {
      setState(() {
        print('hello');
      });
    });
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    StreamSubscription subscription;
    widget.stream2.listen((event) {
      subscription.cancel();
    });
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: <Widget>[
          getTextWidgetsForHandbookPage(
            selectedNamesForHandbook.toList(),
            context,
            selectedFontSize,
          )
        ],
      ),
    );
  }
}

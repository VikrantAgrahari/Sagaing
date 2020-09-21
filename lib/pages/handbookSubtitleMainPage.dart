import 'package:flutter/material.dart';
import 'package:sagain_region/components/componentsForPages.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sagain_region/components/data.dart';
import 'package:sagain_region/components/variable.dart';
import 'package:sagain_region/appbar/MySubtitleAppBar.dart';

class HandbookSubtitle extends StatefulWidget {
  @override
  _HandbookSubtitleState createState() => _HandbookSubtitleState();
  int idofthetitlebutton;
  StreamController<int> controller;

  HandbookSubtitle({this.idofthetitlebutton, this.controller});
}

class _HandbookSubtitleState extends State<HandbookSubtitle> {
  StreamController<int> controller = StreamController<int>.broadcast();
  StreamController<int> controller2 = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/SagaingMap.jpg"),
            fit: BoxFit.fill,
            alignment: Alignment.centerLeft),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: MySubtitleAppBar(listForHandbook[widget.idofthetitlebutton],
              controller, controller2, widget.idofthetitlebutton),
        ),
        body: SubtitleBody(
            controller.stream, controller2.stream, widget.idofthetitlebutton),
      ),
    );
  }
}

class SubtitleBody extends StatefulWidget {
  @override
  _SubtitleBodyState createState() => _SubtitleBodyState();
  final Stream<int> stream;
  final Stream<int> stream2;
  final int idofthetitlebutton;
  SubtitleBody(this.stream, this.stream2, this.idofthetitlebutton);
}

class _SubtitleBodyState extends State<SubtitleBody> {
  List data;
  List<dynamic> subtitles;
  Future future;
  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/data.json');

    this.setState(() {
      data = jsonDecode(response);
    });
    print(data[widget.idofthetitlebutton]["subtitle"].length);

    listForHandBookSubtitle = [];
    for (var i = 0;
        i < data[widget.idofthetitlebutton]["subtitle"].length;
        i++) {
      listForHandBookSubtitle
          .add(data[widget.idofthetitlebutton]["subtitle"][i].toString());
    }
    selectedHandBookSubtitle = [];
    selectedHandBookSubtitle = listForHandBookSubtitle;
    print(selectedHandBookSubtitle);

    return "Success!";
  }

  void _updateFontSize(int fontSize) {
    setState(() {
      selectedFontSize = fontSize;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    widget.stream.listen((fontSize) {
      _updateFontSize(fontSize);
    });
    widget.stream2.listen((event) {
      setState(() {
        print('hello');
      });
    });
  }

  @override
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
          getTextWidgetsForHandbookSubtitlePage(
              selectedHandBookSubtitle.toList(),
              context,
              selectedFontSize,
              widget.idofthetitlebutton)
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sagain_region/components/componentsForPages.dart';
import 'package:sagain_region/components/data.dart';
import 'package:sagain_region/pages/pdfviewPagesecond.dart';
import 'package:sagain_region/components/variable.dart';

class LawPage extends StatefulWidget {
  @override
  _LawPageState createState() => _LawPageState();
  final Stream<int> stream;
  final Stream<int> stream2;
  LawPage(this.stream, this.stream2);
  
}

class _LawPageState extends State<LawPage> {
  
  void _updateFontSize(int fontSize) {
    setState(() {
      selectedFontSize = fontSize;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.stream.listen((fontSize) {
      _updateFontSize(fontSize);
    });
    widget.stream2.listen((event) {
      setState(() {
        print('hello');
      });
    });
    selectedNamesForLaw = names;
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
          getTextWidgetsForLawPage(
            selectedNamesForLaw.toList(),
            context,
            selectedFontSize,
          )
        ],
      ),
    );
  }
}

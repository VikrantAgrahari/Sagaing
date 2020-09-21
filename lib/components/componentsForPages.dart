import 'dart:ffi';
import 'package:sagain_region/pages/handbookSubtitleMainPage.dart';
import 'variable.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:sagain_region/pages/pdfviewPage.dart';
import 'package:sagain_region/pages/pdfviewPagesecond.dart';

class ButtonForHome extends StatelessWidget {
  ButtonForHome(
      {this.onPressed,
      this.borderRadius,
      this.splashColor,
      this.fontsize,
      this.lable,
      this.fillcolor,
      this.textColor,
      this.id});

  final Function onPressed;
  final String lable;
  final int id;
  final Color fillcolor;
  final Color textColor;
  final int fontsize;
  final Color splashColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: RawMaterialButton(
        elevation: 0,
        splashColor: splashColor,
        enableFeedback: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.blue),
        ),
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        onPressed: onPressed,
        child: Text(
          lable,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontsize.toDouble(), color: textColor),
        ),
        fillColor: fillcolor,
      ),
    );
  }
}

Widget getTextWidgetsForLawPage(
    List<dynamic> strings, dynamic context, int fontSize) {
  List<Widget> list = new List<Widget>();

  for (var i = 0; i < strings.length; i++) {
    list.add(Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: ButtonForHome(
        id: i, // passing the i value only, for clear int values
        lable: strings[i],
        fillcolor: Colors.white,
        textColor: Colors.blue,
        fontsize: fontSize,
        splashColor: Colors.blue[200],
        borderRadius: 15,
        onPressed: () {
          print(i);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PdfviewPagesecond(
                        lawid: (i + 1).toString(),
                      )));
        },
      ),
    ));
  }

  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: list);
}

Widget getTextWidgetsForHandbookPage(
    List<dynamic> strings, dynamic context, int fontSize) {
  List<Widget> list = new List<Widget>();

  for (int i = 0; i < strings.length; i++) {
    list.add(Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: ButtonForHome(
        id: i, // passing the i value only, for clear int values
        lable: strings[i],
        fillcolor: Colors.white,
        textColor: Colors.blue,
        fontsize: fontSize,
        splashColor: Colors.blue[200],
        borderRadius: 15,

        onPressed: () {
          print(i);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HandbookSubtitle(
                        idofthetitlebutton: i,
                      )));
        },
      ),
    ));
  }

  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: list);
}

Widget getTextWidgetsForHandbookSubtitlePage(List<dynamic> strings,
    dynamic context, int fontSize, int idofthetitlebutton) {
  List<Widget> list = new List<Widget>();

  for (var i = 0; i < strings.length; i++) {
    list.add(Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: ButtonForHome(
        id: i, // passing the i value only, for clear int values
        lable: strings[i],
        fillcolor: Colors.white,
        textColor: Colors.blue,
        fontsize: fontSize,
        splashColor: Colors.blue[200],
        borderRadius: 15,

        onPressed: () {
          print(i);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PageViewForSubtitle(
                handbookid: (i + 1).toString(),
                idofthetitlebutton: idofthetitlebutton,
              ),
            ),
          );
        },
      ),
    ));
  }

  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: list);
}

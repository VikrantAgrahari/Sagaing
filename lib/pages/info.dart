import 'package:flutter/material.dart';
import 'package:sagain_region/components/constants.dart';
import 'package:sagain_region/pages/handbookSubtitleMainPage.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:sagain_region/components/componentsForPages.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'dart:ffi';
import 'package:sagain_region/pages/handbookSubtitleMainPage.dart';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:sagain_region/pages/pdfviewPage.dart';
import 'package:sagain_region/pages/pdfviewPagesecond.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
  final Stream<int> stream;
  Info(this.stream);
}

class _InfoState extends State<Info> {
  var response;
  List data;
  List<Widget> cityandphone = new List<Widget>();
  @override
  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/phonenum.json');
    this.setState(() {
      data = jsonDecode(response);
      for (int i = 0; i < data.length; i++) {
        cityandphone.add(CityName(data[i]['city']));
        List data2 = data[i]['phone'];
        for (int j = 0; j < data2.length; j++) {
          cityandphone.add(PhoneNo(
            displayText: data[i]['phone'][j]['display'],
            number: data[i]['phone'][j]['number'],
          ));
        }
      }
    });

    print(data[0]['city']);

    return "Success!";
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250.0),
              child: TextBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Supported\n',
                            style: TitleTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'By',
                                style: TitleTextStyle,
                              )
                            ]),
                      ),
                    ),
                    Image.asset(
                      'images/yonekyiyar.png',
                      scale: 2.5,
                    ),
                    Text(
                      'info@yonekyiyar.org',
                      style: SubTitleTextStyle,
                    ),
                    PhoneNo(
                      number: '09977240977',
                      displayText: '၀၉-၉၇၇၂၄၀၉၇၇',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: cityandphone,
          ),
        ],
      ),
    );
  }
}

class CityName extends StatelessWidget {
  final String city;
  CityName(this.city);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: TextBox(
          child: Text(
            city,
            style: SubTitleTextStyle,
          ),
        ),
      ),
    );
  }
}

class PhoneNo extends StatelessWidget {
  final String number;
  final String displayText;
  PhoneNo({this.number, this.displayText});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => launch("tel:$number"),
      child: Text(
        displayText,
        style: SubTitleTextStyle,
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  Widget child;
  TextBox({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blue),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: child,
    );
  }
}

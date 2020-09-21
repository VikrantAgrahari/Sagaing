import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sagain_region/components/variable.dart';
import 'package:sagain_region/components/data.dart';

class MySubtitleAppBar extends StatefulWidget {
  @override
  _MySubtitleAppBarState createState() => _MySubtitleAppBarState();
  String text;
  List lawList = [];
  StreamController<int> controller;
  StreamController<int> controller2;
  int pagenumber;
  MySubtitleAppBar(this.text, this.controller, this.controller2, this.pagenumber);
}

class _MySubtitleAppBarState extends State<MySubtitleAppBar> {
  FocusNode focusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isLoading = false;
  }
  @override
  Widget build(BuildContext context) {
    void getFontSizeDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return MyDialog(widget.controller);
          });
    }

    void _selectedNames(value) {

      print(widget.pagenumber);
      print(value);
      setState(() {

        selectedHandBookSubtitle = listForHandBookSubtitle.where((name) => name.contains(value)).toList();
      });
      print(listForHandBookSubtitle);

    }

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Center(
        child: isLoading
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  style: TextStyle(color: Colors.blue),
                  focusNode: focusNode,
                  onChanged: (value) {
                    _selectedNames(value);

                    widget.controller2.add(1);
                  },
                  decoration: InputDecoration(

                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "ရှာရန်",

                      hintStyle: TextStyle(
                          color: Colors.blue
                      )
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: Icon(Icons.cancel),
                onTap: () {
                  setState(() {
                    isLoading = false;
                    selectedHandBookSubtitle = listForHandBookSubtitle;
                    widget.controller2.add(1);
                    print(isLoading);
                  });
                },
              ),
            ),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                    icon: Icon(Icons.format_size),
                    onPressed: () {
                      getFontSizeDialog();
                    })),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'vufpGJpmtkyf',
                style: TextStyle(fontSize: 50, color: Colors.blueAccent, fontFamily: 'TitleWinFont'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      focusNode.requestFocus();
                      setState(() {
                        isLoading = true;
                      });
                    })),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
  StreamController<int> controller;
  MyDialog(this.controller);
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.blue),
        ),
        title: Center(child: Text('FontSize')),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.zoom_out),
                onPressed: () {
                  if (fontSize > 15) {
                    setState(() {
                      widget.controller.add(fontSize--);
                    });
                  }
                }),
            Text(
              fontSize.toInt().toString(),
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            IconButton(
                icon: Icon(Icons.zoom_in),
                onPressed: () {
                  setState(() {
                    if (fontSize < 23) {
                      setState(() {
                        widget.controller.add(fontSize++);
                      });
                    }
                  });
                })
          ],
        ));
  }
}

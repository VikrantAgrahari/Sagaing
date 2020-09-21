import 'package:flutter/material.dart';

class InfoAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text('qufoG,f&ef',
          style: TextStyle(fontSize: 50, color: Colors.blueAccent, fontFamily: 'TitleWinFont',),),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}

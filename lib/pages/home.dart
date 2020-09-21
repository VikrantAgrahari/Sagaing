import 'package:flutter/material.dart';
import 'TabPage.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.fromLTRB(top: 100),
//                   child: Column(

//             children: <Widget>[
//             Image.asset('images/logo.png',
//             scale: 5,),
//             RawMaterialButton(onPressed: (){

//             },
//             )
//           ],),
//         ),
//       ),
//     );
//   }
// }

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Opacity 20%.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: RawMaterialButton(
                              splashColor: Colors.transparent,
                              enableFeedback: false,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              padding:
                                  EdgeInsets.fromLTRB(75.0, 10.0, 75.0, 10.0),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TabPage(1),
                                  ),
                                );
                              },
                              child: Text(
                                'လက်စွဲစာအုပ်',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                              fillColor: Color(0xFF328CBB),
                            ),
                          ),
                          RawMaterialButton(
                            splashColor: Colors.transparent,
                            enableFeedback: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: BorderSide(
                                    color: Color(0xFF328CBB), width: 2.0)),
                            padding:
                                EdgeInsets.fromLTRB(110.0, 10.0, 110.0, 10.0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabPage(0),
                                ),
                              );
                            },
                            child: Text(
                              'ဥပဒေ',
                              style: TextStyle(
                                color: Color(0xFF328CBB),
                                fontWeight: FontWeight.w500,
                                fontSize: 25.0,
                              ),
                            ),
                            fillColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TabPage(2),
                                  ),
                                );
                              },
                              child: Container(
                                child: Text(
                                  'ဆက်သွယ်ရန်',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

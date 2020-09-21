import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sagain_region/Icon/hand_book_icons.dart';
import 'package:sagain_region/fancy_bottom_navigation/fany_bottom_navigation.dart';
import 'law.dart';
import 'package:sagain_region/appbar/MyAppBar.dart';
import 'handbook.dart';
import 'info.dart';
import 'dart:math';
import 'dart:async';
import 'package:sagain_region/appbar/infoAppbar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ext_storage/ext_storage.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
  int pagenumber;

  TabPage(this.pagenumber);
}

class _TabPageState extends State<TabPage> {
  StreamController<int> controller = StreamController<int>.broadcast();
  StreamController<int> controller2 = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {
    var hideFloat = widget.pagenumber;
    final List<Widget> _children = [
      LawPage(controller.stream, controller2.stream),
      Handbook(controller.stream, controller2.stream),
      Info(controller.stream),
    ];
    final List<String> _appBarlist = [
      "Oya'",
      'vufpGJpmtkyf',
      '',
    ];
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
          child: widget.pagenumber == 2
              ? InfoAppbar()
              : MyAppBar(_appBarlist[widget.pagenumber], controller,
                  controller2, widget.pagenumber),
        ),
        body: _children[widget.pagenumber],
        floatingActionButton: Visibility(
          child: FloatingActionButton(
              onPressed: () => downloadFile(widget.pagenumber),
              child: Icon(Icons.file_download)),
          visible: hideFloat == 2 ? false : true,
        ),
        bottomNavigationBar: FancyBottomNavigation(
          textColor: Colors.blue,
          initialSelection: widget.pagenumber,
          onTabChangedListener: onTapped,
          tabs: [
            TabData(
              iconData: Icons.gavel,
              title: 'ဥပဒေ',
            ),
            TabData(
              iconData: HandBook.menu_book_black_24dp,
              title: 'လက်စွဲစာအုပ်',
            ),
            TabData(iconData: Icons.phone, title: 'ဆက်သွယ်ရန်'),
          ],
        ),
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      widget.pagenumber = index;
    });
  }

  Future<void> toastMessage(String title, ByteData bytes, String dir) async {
    var rng = new Random();
    var newID = rng.nextInt(1000);
    print(newID);
    await writeToFile(bytes, '$dir/Sagaing$title$newID.pdf');
    Fluttertoast.showToast(
        msg:
            'Downloaded in downloads folder with Named \'Sagain$title$newID.pdf',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }

  Future<void> downloadFile(int forDownload) async {
    PermissionStatus currentStatus = await Permission.storage.request();

    //print("Download Buton Pressed");

    if (currentStatus == PermissionStatus.granted) {
      //forDownload -> 0 : Law
      // forDownload -> 1: Handbook
      if (forDownload == 0) {
        var bytes = await rootBundle.load("assets/docs/law.pdf");
        String dir = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage
            .DIRECTORY_DOWNLOADS); //(await DownloadsPathProvider.downloadsDirectory).path;
        await toastMessage("Law", bytes, dir);
      } else if (forDownload == 1) {
        var bytes = await rootBundle.load("assets/docs/handbook.pdf");
        String dir = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage
            .DIRECTORY_DOWNLOADS); //(await DownloadsPathProvider.downloadsDirectory).path;
        await toastMessage("Handbook", bytes, dir);
      }
    } else if (currentStatus == PermissionStatus.denied) {
      Fluttertoast.showToast(
          msg: 'Doesn\'t have permission to download!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
    }
  }
}

Future<void> writeToFile(ByteData data, String path) {
  final buffer = data.buffer;
  return new File(path)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

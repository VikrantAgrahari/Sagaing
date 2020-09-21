import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfviewPagesecond extends StatefulWidget {
  final String lawid;
  @override
  _PdfviewPagesecondState createState() => _PdfviewPagesecondState();
  const PdfviewPagesecond({Key key, this.lawid}) : super(key: key);
}

class _PdfviewPagesecondState extends State<PdfviewPagesecond> {
  PdfController _pdfController;
  int _actualPageNumber = 1, _allPagesCount = 0;
  @override
  void initState() {
    loadeverything();
    super.initState();
  }

  void loadeverything() async {
      String id = widget.lawid;
      _pdfController = PdfController(
        document: PdfDocument.openAsset('assets/law$id.pdf'),
      );




  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PdfView(
            controller: _pdfController,
            documentLoader: Center(
              child: CircularProgressIndicator(),
            ),
            pageLoader: Center(child: CircularProgressIndicator()),
            scrollDirection: Axis.vertical,
            onDocumentLoaded: (document) {
              setState(() {
                _allPagesCount = document.pagesCount;
              });
            },
            onPageChanged: (page) {
              setState(() {
                _actualPageNumber = page;
              });
            },
          ),
        ),
      ),
    );
  }
}

class PageViewForSubtitle extends StatefulWidget {
  final String handbookid;
  final int idofthetitlebutton;
  @override
  _PageViewForSubtitleState createState() => _PageViewForSubtitleState();
  PageViewForSubtitle({this.handbookid,this.idofthetitlebutton});
}

class _PageViewForSubtitleState extends State<PageViewForSubtitle> {
  PdfController _pdfController;
  int _actualPageNumber = 1, _allPagesCount = 0;
  @override
  void initState() {
    loadeverything();
    super.initState();
  }

  void loadeverything() async {
    String id = widget.handbookid;
    String idofthetitlebutton = (widget.idofthetitlebutton+1).toString();
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/$idofthetitlebutton$id.pdf'),//the firstnumber is title button id and the last number is the subtitle id button(the first numebr range 1 -> 23, the last number range 1 -> 10 or 15 something like that )
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PdfView(
            controller: _pdfController,
            documentLoader: Center(
              child: CircularProgressIndicator(),
            ),
            pageLoader: Center(child: CircularProgressIndicator()),
            scrollDirection: Axis.vertical,
            onDocumentLoaded: (document) {
              setState(() {
                _allPagesCount = document.pagesCount;
              });
            },
            onPageChanged: (page) {
              setState(() {
                _actualPageNumber = page;
              });
            },
          ),
        ),
      ),
    );
  }
}

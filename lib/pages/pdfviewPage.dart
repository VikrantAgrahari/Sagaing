import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';



class PdfViewPage extends StatefulWidget {
  final String lawid;
  final String handid;

  const PdfViewPage({Key key, this.lawid, this.handid}):super(key:key);
  
  
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  
  bool isLoading = true;
  PDFDocument document;
  //String path;

  
  @override
  void initState() {
    
    super.initState();
    loadDocument();
  }


  loadDocument() async {
    
    if(widget.lawid.length>0){
      String id= widget.lawid;
      document = await PDFDocument.fromAsset('assets/law$id.pdf');
      setState(() => isLoading = false);
    }else if(widget.handid.length>0){
      String id= widget.handid;
      document = await PDFDocument.fromAsset('docs/hand/hand$id.pdf');
      setState(() => isLoading = false);
    }
    
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
                  document: document,
                  zoomSteps: 1,
                  scrollDirection: Axis.vertical,
                  
        )),
    ));
  }
}



// class PDFViewerFromAsset extends StatelessWidget {
//   PDFViewerFromAsset({Key key, @required this.pdfAssetPath}) : super(key: key);
//   final String pdfAssetPath;
//   final Completer<PDFViewController> _pdfViewController =
//       Completer<PDFViewController>();
//   final _pageCountController = StreamController<String>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF From Asset'),
//         actions: <Widget>[
//           StreamBuilder<String>(
//               stream: _pageCountController.stream,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData)
//                   return Center(
//                     child: Container(
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue[900],
//                       ),
//                       child: Text(snapshot.data),
//                     ),
//                   );
//                 return SizedBox();
//               }),
//         ],
//       ),
//       body: PDF(
//         enableSwipe: true,
//         swipeHorizontal: false,
        
//         autoSpacing: false,
//         pageFling: false,
//         onPageChanged: (current, total) =>
//             _pageCountController.add('${current + 1} - $total'),
//         onViewCreated: _pdfViewController.complete,
//       ).fromAsset(pdfAssetPath),
//       floatingActionButton: FutureBuilder<PDFViewController>(
//         future: _pdfViewController.future,
//         builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//           if (snapshot.hasData) {
//             return Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 FloatingActionButton(
//                   heroTag: "-",
//                   child: Text("-"),
//                   onPressed: () async {
//                     final pdfController = snapshot.data;
//                     final currentPage =
//                         await pdfController.getCurrentPage() - 1;
//                     if (currentPage >= 0)
//                       await snapshot.data.setPage(currentPage);
//                   },
//                 ),
//                 FloatingActionButton(
//                   heroTag: "+",
//                   child: Text("+"),
//                   onPressed: () async {
//                     final pdfController = snapshot.data;
//                     final currentPage =
//                         await pdfController.getCurrentPage() + 1;
//                     final numberOfPages = await pdfController.getPageCount();
//                     if (numberOfPages > currentPage)
//                       await snapshot.data.setPage(currentPage);
//                   },
//                 ),
//               ],
//             );
//           }
//           return SizedBox();
//         },
//       ),
//     );
//   }
// }
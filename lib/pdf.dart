// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:pdfx/pdfx.dart';
import 'package:performance/performance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pdf extends StatefulWidget {
  final int Surah_number;

  // pdf(this.Surah_number);

//   final int Surah_number;
const pdf({required this.Surah_number, Key? key}) : super(key: key);

  @override
  _pdfState createState() => _pdfState();
}

class _pdfState extends State<pdf> {
  static int _initialPage = 0;
  // int lastViewedPage = 0;
  // final LAST_VIEWED_PAGE = 'lastViewedPage';
  // late int currentPage;
  // late SharedPreferences prefs;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  late PdfControllerPinch _pdfController;

  // void setLastViewedPage(int _currentPage) async {
  //   prefs = await SharedPreferences.getInstance();
  //   if (_currentPage != null && !_currentPage.isNaN) {
  //     prefs.setInt(LAST_VIEWED_PAGE, _currentPage);
  //     lastViewedPage = prefs.getInt(LAST_VIEWED_PAGE)!;
  //   }
  // }

  @override
  void initState() {
    _initialPage = widget.Surah_number;
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('images/quran1.pdf'),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 56, 100),
      appBar: AppBar(
        title: const Text("القرآن الكريم",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color.fromARGB(255, 4, 56, 100),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.bookmark_add_outlined),
          //   onPressed: () {
          //     _pdfController.previousPage(
          //       curve: Curves.ease,
          //       duration: const Duration(milliseconds: 100),
          //     );
          //   },
          // ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '$_actualPageNumber/$_allPagesCount',
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          // IconButton(
          //   icon: const Icon(Icons.navigate_next),
          //   onPressed: () {
          //     _pdfController.nextPage(
          //       curve: Curves.ease,
          //       duration: const Duration(milliseconds: 100),
          //     );
          //   },
          // ),
        ],
      ),
      body:
          //  CustomPerformanceOverlay(
          //   alignment: Alignment.center,
          //   enabled: false,
          //   child:
          PdfViewPinch(
        documentLoader: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 6, 23, 153),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            strokeWidth: 8,
          ),
        ),
        pageLoader: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 6, 23, 153),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            strokeWidth: 8,
          ),
        ),
        controller: _pdfController,
        onDocumentLoaded: (document) {
          setState(() {
            _allPagesCount = document.pagesCount;
          });
        },
        onPageChanged: (page) {
          setState(() {
            _actualPageNumber = page;
            // currentPage = _actualPageNumber;
            // setLastViewedPage(currentPage);
            
          });
        },
      ),
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class PdfDocViewer extends StatefulWidget {
  const PdfDocViewer({required this.document});

  final PDFDocument document;

  @override
  State<PdfDocViewer> createState() => _PdfDocViewerState();
}

class _PdfDocViewerState extends State<PdfDocViewer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PDFViewer(
        document: widget.document,
        lazyLoad: false,
        zoomSteps: 1,
        numberPickerConfirmWidget: const Text(
          "Confirm",
        ),
        //uncomment below line to preload all pages
        // lazyLoad: false,
        // uncomment below line to scroll vertically
        // scrollDirection: Axis.vertical,

        //uncomment below code to replace bottom navigation with your own
        /* navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage()(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  }, */
      ),
    );
  }
}
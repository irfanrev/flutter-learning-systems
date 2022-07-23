import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class PdfView extends StatefulWidget {
  final String pdf;

  PdfView({required this.pdf});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child:  AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.lightBlue,)),
        title: Container(
          width: double.infinity,
          height: 150,
          child: Center(
            child: Text('Happy Flutter Learning', style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.lightBlue
            ),),
          ),
        ),
    
      ), preferredSize: Size.fromHeight(70)),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            HtmlWidget(widget.pdf,),
          ],
        ),
      ),
    );
  }
}
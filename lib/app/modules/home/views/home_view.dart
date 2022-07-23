import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leasson/app/modules/home/views/pdf_view.dart';
import 'package:flutter_leasson/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionReference materi =
        FirebaseFirestore.instance.collection('materi');


    final c = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SizedBox.expand(
        child: Row(
          children: [
            Expanded(
              
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.blue[300],
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(25),
                      child: Text(
                        'List Flutter Leasson',
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        
                        width: double.infinity,
                        height: double.infinity,
                        child: FutureBuilder<QuerySnapshot>(
                          future: materi.get(),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (_, index) {
                                  final item = snapshot.data!.docs[index];
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: ListTile(
                                      leading: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue[300],

                                        ),
                                        child: Center(
                                          child: Text(item['id'], style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),),
                                        )
                                      ),
                                      
                                      title: Text(
                                        item['name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      subtitle: Text(
                                        item['deskripsi'],
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          
                                        ),
                                      ),
                                      trailing: InkWell(
                                        onTap: () => Get.to(PdfView(pdf: item['pdf'],)),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                                          decoration: BoxDecoration(
                                      
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.deepOrange[400],
                                          ),
                                          child: Text('Start Learning', style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        ),
                                      ),
                                    ),
                                    
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image:AssetImage('assets/img/code.jpeg',),fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => c.signOut(),
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            
                            ]
                          ),
                          child:  const Center(
                            child: Icon(
                              Icons.logout_rounded,
                              color: Colors.white,  
                              size: 30,
                            ),
                          ),
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

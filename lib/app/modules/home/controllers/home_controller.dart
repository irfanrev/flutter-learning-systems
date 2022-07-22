

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<dynamic> docID = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('materi').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            docID.add(element.reference.id);
          }),
        );
  }

  
}

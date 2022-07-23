import 'package:flutter/material.dart';
import 'package:flutter_leasson/app/modules/home/views/home_view.dart';
import 'package:flutter_leasson/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var emailC = TextEditingController();
  var passC = TextEditingController();

  void signIn() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailC.text, password: passC.text);

          Get.offAll(HomeView());
          emailC.text = '';
          passC.text = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'User tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Password salah');
      }
    }
  }


  signOut() async {
    Get.defaultDialog(
      title: 'Konfirmasi',
      content: Text('Apakah anda yakin ingin keluar?'),
      confirmTextColor: Colors.white,
      
      contentPadding: EdgeInsets.all(20),
      onConfirm: () {
        FirebaseAuth.instance.signOut();
        Get.offAll(LoginView());
      },
      onCancel: () => Get.back(),
    );
  }
}

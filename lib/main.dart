import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leasson/app/modules/home/views/home_view.dart';
import 'package:flutter_leasson/app/modules/login/views/login_view.dart';
import 'package:flutter_leasson/firebase_options.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      home: HomeView(),
    ),
  );
}

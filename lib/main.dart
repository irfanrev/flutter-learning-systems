import 'package:flutter/material.dart';
import 'package:flutter_leasson/app/modules/login/views/login_view.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    const GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      home: LoginView(),
    ),
  );
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackbarController extends GetxController {
  void showSnackbar(String message) {
    Get.snackbar(
      'Node Clicked',  // Title
      message,  // Message
      snackPosition: SnackPosition.BOTTOM,  // Position at the bottom
      backgroundColor: Colors.black.withOpacity(0.7),
      colorText: Colors.white,
      borderRadius: 8.0,
      margin: EdgeInsets.all(12),
      duration: Duration(seconds: 2),
    );
  }
}

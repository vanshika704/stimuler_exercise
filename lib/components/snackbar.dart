import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackbarController extends GetxController {
  // Variable to keep track of snackbar visibility
  static RxBool isSnackbarVisible = false.obs;

  void showSnackbar(String message) {
    if (!isSnackbarVisible.value) {
      Get.snackbar(
        'Node Clicked',  // Title
        message,  // Message
        snackPosition: SnackPosition.BOTTOM,  // Position at the bottom
        backgroundColor: Colors.black.withOpacity(0.7),
        colorText: Colors.white,
        borderRadius: 8.0,
        margin: EdgeInsets.all(12),
        duration: Duration(days: 365),  // Set a long duration to prevent auto-dismissal
        isDismissible: false,  // Disable swipe to dismiss
      );
      isSnackbarVisible.value = true; // Mark snackbar as visible
    }
  }

  // Function to manually dismiss the snackbar
  void dismissSnackbar() {
    if (isSnackbarVisible.value) {
      Get.back();  // Dismiss snackbar
      isSnackbarVisible.value = false;
    }
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackbarController extends GetxController {
  void showModal(String message) {
    Get.bottomSheet(
      GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 5) {
            Get.back(); // Close the bottom sheet when user scrolls down
          }
        },
        child: Container(
          width: double.infinity, // Set width to full
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 41, 31, 62),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Only take necessary height
            children: [
              const Text(
                'Choose Exercise',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      isDismissible: true, // Allow tapping outside to close
      enableDrag: true, // Enable drag-to-dismiss
      backgroundColor: Colors.transparent, // Make background transparent
    );
  }
}

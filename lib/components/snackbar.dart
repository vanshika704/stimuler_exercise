import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackbarController extends GetxController {
  // Method to show modal with a list of styled buttons
  void showModal(String message, List<Map<String, String>> nodes) {
    Get.bottomSheet(
      GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 5) {
            Get.back(); // Close the bottom sheet when the user scrolls down
          }
        },
        child: Container(
          width: double.infinity, // Full screen width
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 32, 24, 50),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Only take necessary height
            children: [
              Center(
                child: Text(
                  'Choose Exercise',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: nodes.length,
                  itemBuilder: (context, index) {
                    final node = nodes[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(node['route']!); // Navigate to respective route
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getButtonColor(node),
                          side: BorderSide(color: _getBorderColor(node)),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation:  0, // Elevation for selected state
                          shadowColor: node['state'] == 'selected'
                              ? Color.fromARGB(255, 168, 106, 255)
                              : Colors.transparent, // Glowing effect for selected state
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundImage: AssetImage(node['icon'] ?? ''), // Ensure image is loaded properly
                                  radius: 18, // Profile picture or icon
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  node['label']!,
                                  style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              node['progress'] ?? '',
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                           
                          ],
                          
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
    );
  }

  // Get button color based on state
  Color _getButtonColor(Map<String, String> node) {
    if (node['state'] == 'completed') {
      return Colors.green;
    } 
    return Colors.transparent; // Default button color
  }

  // Get border color based on state
  Color _getBorderColor(Map<String, String> node) {
    if (node['state'] == 'completed') {
      return Colors.green;
    } else if (node['state'] == 'selected' || node['state'] == 'active') {
      return Color.fromARGB(255, 168, 106, 255);
    }
    
    return Colors.transparent;
  }
}

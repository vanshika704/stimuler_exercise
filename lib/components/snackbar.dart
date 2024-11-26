import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  message, // Use the dynamic message passed to the modal
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
                        onPressed: _isTileEnabled(node) ? () {
                          Get.toNamed(node['route']!); // Navigate to respective route
                        } : null, // Disable button if not selected
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getButtonColor(node),
                          side: BorderSide(color: _getBorderColor(node)),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: _isTileEnabled(node) ? 4 : 0, // Elevation for selected state
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(node['icon'] ?? ''), // Ensure image is loaded properly
                                  radius: 18, // Profile picture or icon
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  node['label']!,
                                  style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: _isTileEnabled(node) ? Colors.white : Colors.grey, // Grey text for disabled tiles
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              node['progress'] ?? '',
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                color: _isTileEnabled(node) ? Colors.white70 : Colors.grey, // Grey text for disabled tiles
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

  // Check if the tile should be enabled (only the selected tile is enabled)
  bool _isTileEnabled(Map<String, String> node) {
    return node['state'] == 'selected'; // Only allow the tile with 'selected' state to be interactive
  }

  // Get button color based on state
  Color _getButtonColor(Map<String, String> node) {
    if (node['state'] == 'completed') {
      return Colors.green;
    } else if (node['state'] == 'selected') {
      return const Color.fromARGB(255, 135, 69, 226); // Highlight selected node
    }
    return Colors.grey; // Disabled button color
  }

  // Get border color based on state
  Color _getBorderColor(Map<String, String> node) {
    if (node['state'] == 'completed') {
      return Colors.green;
    } else if (node['state'] == 'selected') {
      return const Color.fromARGB(255, 168, 106, 255); // Glow effect for selected state
    }
    return Colors.transparent; // No border for disabled button
  }
}

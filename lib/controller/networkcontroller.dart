import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  // Your network-related methods and properties go here
  final Connectivity _connectivity = Connectivity();
  List<ConnectivityResult> _previousResult = [];

  @override
  void onInit() {
    super.onInit();
    checkInitialConnection();
    _connectivity.onConnectivityChanged.listen(netStatus);
  }

  Future<void> checkInitialConnection() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    _previousResult = result; // Set initial state, don't show snackbar
    // Optionally, show "No internet" if starting offline:
    if (result.contains(ConnectivityResult.none)) {
      Get.snackbar(
        "Network Status",
        "No internet connection",
        padding: const EdgeInsets.all(16.0),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        isDismissible: false,
        duration: const Duration(days: 1),
      );
    }
  }

  netStatus(List<ConnectivityResult> result) {
    if (_previousResult.contains(ConnectivityResult.none) &&
        !result.contains(ConnectivityResult.none)) {
      Get.closeAllSnackbars(); // Close previous snackbar if exists
      Get.snackbar(
        "Network Status",
        "Internet connection is restored",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade100,
      );
    }
    // Show "No internet" only if just lost connection
    if (!_previousResult.contains(ConnectivityResult.none) &&
        result.contains(ConnectivityResult.none)) {
      Get.snackbar(
        "Network Status",
        "No internet connection",
        padding: const EdgeInsets.all(16.0),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        isDismissible: false,
        duration: const Duration(days: 1),
      );
    }
    _previousResult = result;
  }
}

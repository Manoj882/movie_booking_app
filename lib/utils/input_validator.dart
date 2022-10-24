import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputValidator {
  static bool validateField(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Error',
      '$title is empty',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orangeAccent,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),

    );
    return false;
  }

  static bool validatePassword(String pwd, String confirmPwd) {
    if (pwd.trim() == confirmPwd.trim()) {
      return true;
    }
    Get.snackbar(
      'Error',
      'Confirm password didn\'t match',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orangeAccent,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),

    );
    return false;
  }
}

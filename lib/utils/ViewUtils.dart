import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewUtils {
  static bool get isTablet {
    return Get.context!.isLandscape ||
        Get.context!.isTablet ||
        Get.context!.isLargeTablet;
  }

  static getAmountText(num? amount) {
    try {
      return NumberFormat("###,###,##0.00").format(amount);
    } catch (e) {
      return amount ?? "0.00";
    }
  }

  static double get radius {
    return 8;
  }
}

Future<void> showError(error) async {
  String title = "Error";
  String message = error.toString();
  if (error is DioError) {
    title = "API Error";
    message = error.message;
  } else if (error is Map &&
      error.containsKey('statusCode') &&
      error.containsKey('message')) {
    title = error['message'].toString();
    message = "Something went wrong";
  }
  showSnackbar(title, message);
}

void showSnackbar(title, message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      duration: const Duration(milliseconds: 2700),
      backgroundColor: Colors.black87,
      colorText: Colors.white);
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}

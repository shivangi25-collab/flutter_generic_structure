import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  String toNormalCase() {
    try {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } catch (e) {
      return this;
    }
  }

  String toCamelCase() {
    try {
      List<String> list = split(" ");
      String str = "";
      for (String item in list) {
        str += "${item.toNormalCase()} ";
      }
      return str;
    } catch (e) {
      return this;
    }
  }
}

extension DateTimeExtensions on DateTime {
  DateTime get onlyDateTime {
    return DateTime(year, month, day);
  }

  String get dateString {
    return DateFormat('dd/MM/yyyy').format(toLocal());
  }

  String get dateString1 {
    try {
      return DateFormat('dd-MM-yyyy').format(toLocal());
    } catch (e) {
      return '';
    }
  }

  String get dateString2 {
    try {
      return DateFormat("dd-MMMM-yyyy").format(toLocal());
    } catch (e) {
      return '';
    }
  }

  String get dayString {
    return DateFormat('EEEE').format(this.toLocal());
  }

  String get monthString {
    return DateFormat('MMMM').format(this.toLocal());
  }

  String get timeString {
    try {
      return DateFormat('hh:mm aa').format(this.toLocal());
    } catch (e) {
      return '';
    }
  }

  String get timeStringtwo {
    try {
      return DateFormat('hh:mm aa').format(this.toLocal().toUtc());
    } catch (e) {
      return '';
    }
  }

  String get apiString {
    return DateFormat('dd/MM/yyyy hh:mm aa').format(this.toLocal());
  }

  String get apiStringtwo {
    return DateFormat('dd/MM/yyyy hh:mm aa').format(this.toLocal().toUtc());
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}

extension DioResponseExtension on Response {
  bool get isSuccess {
    final statusCode = this.statusCode ?? 0;
    return this.statusCode! >= 200 && statusCode < 300;
  }
}

String _twoDigits(int n) {
  return NumberFormat("00").format(n);
}

extension TimeOfDayExtensions on TimeOfDay {
  String get formatHHMMAA {
    return "${_twoDigits(hour % 12)}:${_twoDigits(minute)} ${period == DayPeriod.am ? "AM" : "PM"}";
  }

  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}

extension FilenameFromStorage on File {
  String get filename {
    return path.substring(path.lastIndexOf('/') + 1);
  }
}

import 'dart:io';
import 'package:ryalize/models/model_user.dart';

class FunctionHelpers {
  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static double toDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0;
    } else {
      return value.toDouble();
    }
  }

  static int toInt(dynamic value) {
    if (value is String) {
      return int.tryParse(value) ?? 0;
    } else {
      return value.toInt();
    }
  }

  static String formatTime(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final minutes = duration.inMinutes;
    final seconds = totalSeconds % 60;

    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');
    return '${minutesString}m${secondsString}s';
  }

  static String getName(ModelUser? profile) {
    if (profile == null) {
      return 'Name not set';
    }
    var _fName = stringTitleCase(profile.data?.firstName ?? '');
    var _lName = stringTitleCase(profile.data?.lastName ?? '');
    if (_fName.isEmpty && _lName.isEmpty) {
      return 'Name not set';
    }
    return '$_fName $_lName';
  }

  static stringTitleCase(String value) {
    if (value.isEmpty) return '';
    return value[0].toUpperCase() + value.substring(1);
  }
}

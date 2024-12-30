import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralFunction {
  Future<void> getLaunchUrl(String host, String path) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: host,
      path: path,
    );

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $uri');
    }
  }

  bool isValidateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (emailValid) {
      return true;
    } else {
      return false;
    }
  }

  bool isValidateMobileNumber(String handphone) {
    bool handphoneValid = RegExp(r"^08\d{8,10}$").hasMatch(handphone);

    if (handphoneValid) {
      return true;
    } else {
      return false;
    }
  }

  String formatRupiah(String amount) {
    if (amount != "") {
      final money = NumberFormat("#,##0", "en_US");

      var temp = money.format(int.parse(amount.toString()));

      return temp;
    } else {
      return "";
    }
  }

  String dateformat1(DateTime dateTime) {
    const dateformat = 'dd MMM, HH:mm';
    return DateFormat(dateformat).format(dateTime);
  }

  String dateformat2(DateTime dateTime) {
    const dateformat = 'dd MMM yyyy, HH:mm';
    return DateFormat(dateformat).format(dateTime);
  }

  String dateformat3(DateTime dateTime) {
    const dateformat = 'yyyy-MM-dd';
    return DateFormat(dateformat).format(dateTime);
  }

  String dateformat4(DateTime dateTime) {
    const dateformat = 'dd MMM yyyy';
    return DateFormat(dateformat).format(dateTime);
  }

  String dateformat5(DateTime dateTime) {
    const dateformat = 'dd MMM';
    return DateFormat(dateformat).format(dateTime);
  }

  String getCurrentDate() {
    const dateformat = 'dd MMM yyyy, HH:mm';

    DateTime currentDate = DateTime.now();
    return DateFormat(dateformat).format(currentDate);
  }

  DateTime? lastPressed;
  Future<bool> onWillPop(BuildContext context) {
    final now = DateTime.now();
    const maxDuration = Duration(seconds: 2);
    final isWarning =
        lastPressed == null || now.difference(lastPressed!) > maxDuration;

    if (isWarning) {
      lastPressed = DateTime.now();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Tekan sekali lagi untuk keluar"),
      ));
      //
      return Future.value(false);
    } else {
      //
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else {
        exit(0);
      }
      return Future.value(true);
    }
  }

  Future<bool> snackBar(BuildContext context, String message, int duration) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    ));
    return Future.value(true);
  }
}

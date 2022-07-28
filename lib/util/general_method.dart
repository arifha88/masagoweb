import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masago_web_reg/ui/pages/pages.dart';

class GeneralMethod {
  String generateRandomValue() {
    var rng = Random();
    var value = "";
    for (var i = 0; i < 12; i++) {
      value += rng.nextInt(9).toString();
    }
    return value;
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  String checkedNotsTypes(String? nots) {
    switch (nots) {
      case "0":
        return "SMS";
      case "1":
        return "E-MAIL";
      default:
        return "Whatsapp";
    }
  }

  void showDialogLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WidgetDialogLoading();
      },
    );
  }
}

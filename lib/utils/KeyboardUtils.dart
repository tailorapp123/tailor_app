import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
class KeyBoardUtils {

  dynamic focus(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  dynamic hideKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  String titleCase(String text) {
    if (text.length <= 1) return text.toUpperCase();
    var words = text.split(' ');
    var capitalized = words.map((word) {
      var first = word.substring(0, 1).toUpperCase();
      var rest = word.substring(1);
      return '$first$rest';
    });
    return capitalized.join(' ');
  }
  String firstLetterCapitalize(String text) {
    if (text.length <= 1) {
      return text.toUpperCase ();
    }else{
      return "${text[0].toUpperCase()}${text.substring(1)}";
    }
  }
}



